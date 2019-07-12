
import 'package:flutter/material.dart';
import 'package:my_app/common/colors.dart';
import 'package:my_app/common/log_util.dart';
import 'dart:convert';
import 'package:my_app/entity/message_entity.dart';
import 'package:my_app/widget/message_setting.dart';
import 'package:flutter/cupertino.dart';

class MessagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MessageStatePage();
  }
  
}

class MessageStatePage extends State<MessagePage> {

  List<Data> list = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Colours.app_bg,
      child: Scaffold(
        appBar: AppBar(
          title: Stack(
            children: <Widget>[
              Center(
                child: Text("消息"),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: Icon(Icons.settings),
                  onTap: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (ctx)=> MessageSetting()));

                  },
                ),
              )
            ],
          ),
        ),
        body: Container(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString("assets/data/message.json"),
              builder: (context, snapshot) {

                list.clear();
              if (snapshot.hasData) {
                Map dataMap = json.decode(snapshot.data.toString());

//                list = Data.fromJson(dataMap["data"].toString());

                for (Map map in dataMap["data"]) {
                  list.add(Data.fromJson(map));
                }

                LogUtil.e("mydata ： " + dataMap["data"].toString());
              }
                return MessageList(list);
              }
          ),
        ),
      ),
    );
  }

}

class MessageList extends StatelessWidget{

  List<Data> list;


  MessageList(this.list);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          Data entity = list[index];
          return MessageListItem(entity);
        });
  }

}


class MessageListItem extends StatelessWidget {

  Data entity;
  MessageListItem(this.entity);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
      children: <Widget>[
      Align(
      alignment: Alignment.centerLeft,
        child: Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Icon(Icons.notifications),
        ),
      ),
        Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(
                  entity.title,
                style: TextStyle(
                  fontSize: 20,

                ),
              ),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 80),
              padding: EdgeInsets.only(right: 10),
              margin: EdgeInsets.only(left: 0,top: 30, right: 16, bottom: 10),
              child: Text(
                entity.content,
                maxLines: 10,
//            overflow: TextOverflow.ellipsis,
                softWrap: true,
                textDirection: TextDirection.ltr,

                style: TextStyle(
                  color: Color(0xff666666)
                ),
              ),
            ),
          ],
        )
      ],
    ),
          Container(
            height: 1,
            color: Color(0xfff5f5f5),
          ),
    ],
      ),
    );
  }

}

//class MessageEntity {
//
//  String content;
//  String title;
//
//  MessageEntity(this.content, this.title);
//
//
//}