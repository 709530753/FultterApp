import 'package:flutter/material.dart';


class ControllerPage extends StatelessWidget {
  final TextEditingController controller = new TextEditingController(text: "init Text");

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: new Text("ControllerPage"),

        ),
      body: Container(
        child: Center(
          child: Text("ControllerPage"),
        )
      ),
    );
  }

}