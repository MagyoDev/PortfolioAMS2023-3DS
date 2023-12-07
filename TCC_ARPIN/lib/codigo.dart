import 'package:ar_pin/utils/appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class CodigoPage extends StatefulWidget {
  final String text;
  const CodigoPage({super.key, required this.text});

  @override
  State<CodigoPage> createState() => _CodigoPageState();
}

class _CodigoPageState extends State<CodigoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ArpinAppBar().title(context),
        actions: ArpinAppBar().actions(context),
        backgroundColor: ArpinAppBar().backgroundColor,
        elevation: ArpinAppBar().elevation,
        leading: ArpinAppBar().leading(context),
        centerTitle: ArpinAppBar().centerTitle,
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
              FutureBuilder(
                future: FirebaseFirestore.instance.collection('codigos').doc(widget.text).get(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: MarkdownBody(
                        selectable: true,
                        data: snapshot.data!['codigoText'].toString(),
                        styleSheet: MarkdownStyleSheet(
                            p: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            code: const TextStyle(
                              fontSize: 18,
                              color:  Color(0xffe51f43),
                              backgroundColor: Colors.transparent,
              
                            ),
                            codeblockDecoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            ),
                            
                      ),
                    ),
                  );
                }
              )),
    );
  }
}
