import 'package:flutter/material.dart';
import 'package:slackapp/controller/getMembersList.dart';
import 'package:slackapp/dto/member.dart';
import 'package:slackapp/dto/screen_arguments.dart';
import 'package:slackapp/screens/person_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textController = TextEditingController();

  Future<List<Member>> get members async => await fetchMembers();

  @override
  void initState() {
    members;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Member>>(
        future: fetchMembers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                        labelText: "Search",
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: const Icon(Icons.account_box_outlined),
                          title: Text(snapshot.requireData[index].name),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              PersonScreen.routeName,
                              arguments: ScreenArguments(widget.title, 'message'),
                            );
                          },
                        );
                      },
                    ),
                  ),
                )
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
