
import 'package:flutter/material.dart';
import 'package:my_app/common/colors.dart';

class MessageSetting extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MessageStateSetting();
  }

}


class MessageStateSetting extends State<MessageSetting> {

  List<String> list = ["系统消息", "自定义消息"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("消息设置"),
          ),
        ),
      body: Container(
        color: Colours.app_bg,
        child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.white,
                child: Stack(
                  children: <Widget>[
               Align(
                 alignment: Alignment.centerLeft,
                   child: Container(
                     padding: EdgeInsets.only(left:16, top: 15, bottom: 15),
                      child: Text(list[index]),
                   ),
               ),
                    Align(
                      alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.only(top: 13, right: 5),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                    ),
                    Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width,
                      color: Colours.app_bg,

                    )
                  ],
                ),
              );
            },
        ),
      ),
    );
  }

}