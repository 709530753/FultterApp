import 'package:flutter/material.dart';
import 'package:my_app/login_view.dart';
import 'package:my_app/widget/account_page.dart';
import 'package:flutter/cupertino.dart';

class MainController extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainStateController();
  }

}

class MainStateController extends State<MainController> with AutomaticKeepAliveClientMixin{
  
  List<ItemEntity> _list = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("aaaaaaa");
    _list.add(ItemEntity("收藏", Icons.collections));
    _list.add(ItemEntity("设置", Icons.settings));
    _list.add(ItemEntity("关于", Icons.info));
    _list.add(ItemEntity("分享", Icons.share));

    print("listCount : " + _list.length.toString());

  }
  
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(

      body: Column(

        children: <Widget>[

          Container(
            height: 166,
            color:  Color(0xFF666666),
            padding: EdgeInsets.only(
              left: 10
            ),

            child: Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
InkWell(
  child: Container(
    width: 64.0,
    height: 64.0,
    margin: EdgeInsets.only(top: 40.0, bottom: 10.0),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
//                          color: Colors.red,
      image: DecorationImage(
        image: ExactAssetImage(
          'assets/images/ali_connors.png',
        ),
        fit: BoxFit.cover,
      ),
    ),
    child: Image.asset("assets/images/ali_connors.png"),
  ),
  onTap: () {
//
//    Navigator.pushAndRemoveUntil(
//      context,
//      MaterialPageRoute(builder: (BuildContext context) => LoginViewPage()),
//      ModalRoute.withName('/'),
//    );
//
  },
),
                    Text(
                      "Sophia",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "个人简介",
                      style: new TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                  ],
                ),
                new Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.only(top: 25, right: 15),
                    child: InkWell(
                      child: new Icon(Icons.settings, color: Colors.white),
                      onTap: () {
                      print("aaaaaaa");
                      Navigator.push(context, CupertinoPageRoute(builder: (ctx)=> AccountPage()));

                      },
                    )
                  )
                )

              ],
            ),

          ),

          //title
          Container(
            height: 50,
            child: Material(
              color: Colors.grey[200],
              child: InkWell(
                onTap: () {
                  print("section header");
                },
                child: Center(
                  child: Text(
                    "Flutter Demo",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
              padding: const EdgeInsets.all(0.0),
              itemCount: 4,
              itemBuilder: (BuildContext context,int index) {
                ItemEntity itemEntity = _list[index];
                return ListTile(
                  leading: Icon(itemEntity.iconData),
                  title: Text(itemEntity.text),
                  onTap: () {
                    print("listItem : " + itemEntity.text);
                  },
                );
              },

            ),
            flex: 1,
          )
        ],
      ),

    );
  }

  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;
  
}

class ItemEntity {

  ItemEntity(this.text, this.iconData);

  String text;
  IconData iconData;

}
