import 'package:ar_pin/utils/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class CodigoHome extends StatelessWidget {
  final String text;
  const CodigoHome({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ArpinAppBar().title(context),
        actions: ArpinAppBar().actions(context),
        centerTitle: ArpinAppBar().centerTitle,
        elevation: ArpinAppBar().elevation,
        backgroundColor: ArpinAppBar().backgroundColor,
        leading: ArpinAppBar().leading(context),
      ),
      body: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
        return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: MarkdownBody(
                        selectable: true,
                        data: text,
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
      })
    );
  }
}
