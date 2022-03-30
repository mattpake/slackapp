import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18),
            child: AnimSearchBar(
              width: 400,
              textController: textController,
              onSuffixTap: () {
                setState(
                  () {
                    textController.clear();
                  },
                );
              },
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.5,
            child: SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return const ListTile(
                    leading: Icon(Icons.account_box_outlined),
                    title: Text('Person name'),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
