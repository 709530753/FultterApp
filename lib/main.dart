import 'package:flutter/material.dart';
import 'package:my_app/ControllerPage.dart';
import 'package:my_app/login_view.dart';
import 'package:my_app/main_controller.dart';
import 'main_tabbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        body: TabbarController(),

      ),
      routes: routers,
    );
  }
}






const routerName = [
  "Controller 例子",

];

Map<String, WidgetBuilder> routers = {
  "controller": (context) {
     return LoginViewPage();
 },
  'login': (BuildContext context) => new LoginViewPage(),

};

class DemoListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(itemBuilder: (context, index) {
      var routeLists = routers.keys.toList();

      print(routeLists.length);

      return new InkWell(
        onTap: () {
          print(index);
          Navigator.pushNamed(context, "login");
        },
        child: Text(routerName[index]),
      );
    }, itemCount: routerName.length, );
  }

  var list = [Icons.star, Icons.print, Icons.star, Icons.print, Icons.star, Icons.print, Icons.star, Icons.print, Icons.star, Icons.print, Icons.star, Icons.print];

}

class DemoItem extends StatelessWidget {

  int index;
  String name;
  IconData icon;

  DemoItem(this.name, this.index, this.icon);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: _getBottomItem(icon, index.toString()),
    );
  }

  _getBottomItem(IconData icon,String text){
    return FlatButton(

      onPressed: (){
        print(text);
      },
    child: Row(
      children: <Widget>[
        new Icon(
          icon,
          size: 16.0,
          color: Colors.grey,
        ),
        Padding(
          padding: new EdgeInsets.only(left: 2.0, top: 0.0, right: 2.0, bottom: 0.0),
        ),
        Text(
          text,
          //设置字体样式：颜色灰色，字体大小14.0
          style: new TextStyle(color: Colors.grey, fontSize: 14.0),
          //超过的省略为...显示
          overflow: TextOverflow.ellipsis,
          //最长一行
          maxLines: 1,
        ),

      ],
    ),
    );
  }


}


class DemoStateWidget extends StatefulWidget {

  final String text;

  DemoStateWidget(this.text);

  @override
  _DemoStateWidgetState createState()=>  _DemoStateWidgetState(text);
}


class _DemoStateWidgetState extends State<DemoStateWidget> {
  String text;

  _DemoStateWidgetState(this.text);

  @override
  void initState() {
    super.initState();

    new Future.delayed(const Duration(seconds: 1), (){
      setState(() {
        text = "这就变了值";
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose");

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  Widget build(BuildContext context) {
    return Container(

      ///四周10大小的maring
        margin: EdgeInsets.all(10.0),
        height: 120.0,
        width: 500.0,

        ///透明黑色遮罩
        decoration: new BoxDecoration(

          ///弧度为4.0
            borderRadius: BorderRadius.all(Radius.circular(4.0)),

            ///设置了decoration的color，就不能设置Container的color。
            color: Colors.blue,

            ///边框
            border: new Border.all(color: Colors.green, width: 3)),
        child: new Text("666666")
    );
  }

}


/*
* 无状态StatelessWidget
* */
class DEMOWidget extends StatelessWidget {

  final String text;

  //数据可以通过构造方法传递进来
  DEMOWidget(this.text);

  Widget build(BuildContext context) {
    return new Container(
      color: Colors.blue,
       child: Text(text ?? "这就是无状态DMEO"),
    );
  }

}
