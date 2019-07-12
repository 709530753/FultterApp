import 'package:flutter/material.dart';
import 'package:my_app/login_view.dart';
import 'package:my_app/common/colors.dart';

class AccountPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AccountStatePage();
  }

}

class AccountStatePage extends State<AccountPage> {

  List<String> list = ["用户名", "邮箱", "手机号"];

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
          child: Text("账户信息"),
        ),
      ),
      body: Container(
        color: Colours.app_bg,
        child: Stack(
          children: <Widget>[
            Container(
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
            Align(
              alignment: Alignment.bottomCenter,
              child:Container(
                margin: EdgeInsets.only(bottom: 15, left: 15, right: 15),
                child: RoundButton(
                  text: "退出登录",
                  onPressed: () {

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) => LoginViewPage()),
                      ModalRoute.withName(''),
                    );

                  },
                ),
              )
            )
          ],
        ),
      )
    );
  }

}