import 'package:flutter/material.dart';
import 'package:my_app/common/colors.dart';
import 'package:my_app/widget/home_page.dart';
import 'package:my_app/widget/message_page.dart';
import 'package:my_app/main_controller.dart';

class TabbarController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TabbarStateController();
  }
}

class TabbarStateController extends State<TabbarController> with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            HomePage(),
            MessagePage(),
            MainController(),
          ],
      ),
        bottomNavigationBar: Material(
          color: Colors.white,
          child: TabBar(
            controller: _tabController,
            tabs: <Widget>[
              new Tab(text: "首页",icon: new Icon(Icons.home)),
              new Tab(text: "消息",icon: new Icon(Icons.message)),
              new Tab(text: "我的",icon: new Icon(Icons.person)),
            ],
            labelColor: Colours.app_main,
            unselectedLabelColor: Color(0xff999999),
            indicator: const BoxDecoration(),
            isScrollable: false,
          ),
        ),

    );
  }

}

