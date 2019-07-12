import 'package:flutter/material.dart';
import 'package:my_app/login_view.dart';
import 'package:my_app/common/log_util.dart';

class RegistView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Image.asset(
            "assets/images/ic_login_bg.png",
            width: 1.0/0.0,
            height: 1.0/0.0,
            fit: BoxFit.cover,
          ),
          RegistBody(),
        ],
      ),
    );
  }

}


class RegistBody extends StatelessWidget {

  /*
  * 用户名
  * */
  TextEditingController _userName = TextEditingController();

  /*
  * 密码
  * */
  TextEditingController _psw = TextEditingController();

  /*
  * 重复密码
  * */
  TextEditingController _rePsw = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: imoplement build
    return Column(
      children: <Widget>[
        new Expanded(child: new Container()),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 20, top: 15, right: 20),
            child: Column(
             children: <Widget>[
               LoginItem(
                 controller: _userName,
                 prefixIcon: Icons.person,
                 hintText: "用户名",
               ),
               LoginItem(
                 controller: _psw,
                 prefixIcon: Icons.lock,
                 hintText: "密码",
               ),
               LoginItem(
                 controller: _rePsw,
                 prefixIcon: Icons.lock,
                 hintText: "确认密码",
               ),
               RoundButton(
                 text: "注册",
                 margin: EdgeInsets.only(top: 20),
                 onPressed: () {
                   LogUtil.e("regist");
                 },
               )
             ],
            ),
          ),
        ),
      ],

    );
  }

}