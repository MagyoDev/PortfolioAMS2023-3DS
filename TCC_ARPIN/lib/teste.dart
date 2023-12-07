import 'package:ar_pin/utils/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late TextEditingController _textEditingController;
  late String text;

  bool minhaVariavelBool = false; // Variável de estado inicial

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _textEditingController = TextEditingController();
    text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Markdown Editor",
            style: TextStyle(color: Colors.black),
          ),
          actions: ArpinAppBar().actions(context),
          centerTitle: ArpinAppBar().centerTitle,
          leading: ArpinAppBar().leading(context),
          backgroundColor: ArpinAppBar().backgroundColor,
          elevation: ArpinAppBar().elevation,
          bottom: TabBar(controller: _tabController, tabs: [
            Tab(
                child: Text(
              "Editor",
              style: TextStyle(color: Colors.black),
            )),
            Tab(
              child: Text(
                "Preview",
                style: TextStyle(color: Colors.black),
              ),
            )
          ]),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: _textEditingController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter your text here",
                ),
                onChanged: (value) {
                  updateText(value);
                },
              ),
            ),
            Container(
                margin: const EdgeInsets.all(20),
                child: MarkdownBody(data: text)),
          ],
        ));
  }

  void updateText(String value) {
    setState(() {
      text = value;
    });
  }
}
