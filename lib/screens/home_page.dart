import 'package:flutter/material.dart';
import 'package:slackapp/controller/get_members_list.dart';
import 'package:slackapp/dto/member.dart';
import 'package:slackapp/dto/screen_arguments.dart';
import 'package:slackapp/hex_colors.dart';
import 'package:slackapp/screens/person_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textController = TextEditingController();

  List<Member> members = [];
  List<Member> membersDuplicate = [];
  bool isSearchResult = true;

  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    getMembers();
    for (var node in _focusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }
    super.initState();
  }

  void getMembers() {
    fetchMembers().then(
      (value) {
        setState(
          () {
            for (var item in value) {
              members.add(item);
              membersDuplicate.add(item);
            }
          },
        );
      },
    );
  }

  void filterSearchResults(String query) {
    if (query.isNotEmpty) {
      List<Member> transferData = [];
      for (var item in membersDuplicate) {
        if (item.name.contains(query)) {
          transferData.add(item);
        } else {
          setState(
            () {
              isSearchResult = false;
            },
          );
        }
      }
      setState(
        () {
          members.clear();
          members.addAll(transferData);
        },
      );
      return;
    } else {
      setState(
        () {
          members.clear();
          members.addAll(membersDuplicate);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
        backgroundColor: orangeColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              focusNode: _focusNodes[0],
              onChanged: (value) {
                filterSearchResults(value);
              },
              controller: textController,
              decoration: InputDecoration(
                labelText: "Search",
                hintText: "Search",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/searchIconHeureka.png',
                    width: 20,
                    height: 20,
                    color: _focusNodes[0].hasFocus ? orangeColor : Colors.grey,
                  ),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                ),
              ),
            ),
          ),
          Builder(
            builder: (context) {
              if (members.isNotEmpty) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 1.5,
                        child: SingleChildScrollView(
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: members.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                leading: const Icon(Icons.account_box_outlined),
                                title: Text(members[index].name),
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    PersonScreen.routeName,
                                    arguments:
                                        ScreenArguments(widget.title, 'message', members[index]),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                );
              } else if (isSearchResult) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Text('No search result'),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
