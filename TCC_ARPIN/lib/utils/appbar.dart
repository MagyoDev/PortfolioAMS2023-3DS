import 'package:ar_pin/home_page.dart';
import 'package:ar_pin/user_profile.dart';
import 'package:flutter/material.dart';

class ArpinAppBar {
  final double elevation = 1.0;
  final Color backgroundColor = Colors.white;
  List<Widget> actions(BuildContext context) {
    return <Widget>[
      IconButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => UserProfile()));
          },
          icon: Image.asset('assets/images/user.png')),
    ];
  }

  IconButton title(BuildContext context) {
    return IconButton(
        iconSize: 40,
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage()));
        },
        icon: Image.asset('assets/images/led.png'));
  }

  bool centerTitle = true;

  IconButton leading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Image.asset('assets/images/arrow.png'));
  }
}

class ArpinScaffold extends Scaffold{
  final Widget scaffoldBody;
  final FloatingActionButton? floatingActionButton;
  const ArpinScaffold(this.floatingActionButton, {required this.scaffoldBody, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        actions: ArpinAppBar().actions(context),
        title: ArpinAppBar().title(context),
        centerTitle: ArpinAppBar().centerTitle,
        leading: ArpinAppBar().leading(context),
      ),
      body: scaffoldBody,
      floatingActionButton: floatingActionButton,
    );
  }
}