import 'package:flutter/material.dart';
import 'package:my_app/common/log_util.dart';
import 'package:my_app/regist_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_app/main_tabbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:async/async.dart';

class LoginViewPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
              "assets/images/ic_login_bg.png",
            width: 1.0 / 0.0,
            height: 1.0 / 0.0,
            fit: BoxFit.cover,
          ),
            LoginBody(),
        ],
      )
    );
  }
  
}

class LoginBody extends StatelessWidget {

  TextEditingController _controllerName = new TextEditingController();
  TextEditingController _controllerPwd = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 15, top: 0, right: 20),
            child: Column(
              children: <Widget>[
                LoginItem(
                  controller: _controllerName,
                  prefixIcon: Icons.person,
                  hintText: "用户名",
                  hasSufficIcon: false,
                ),
                SizedBox(height: 10),

                LoginItem(
                  controller: _controllerPwd,
                  prefixIcon: Icons.lock,
                  hintText: "密码",
                  hasSufficIcon: true,
                ),
                Container(

                  padding: EdgeInsets.only(top: 15),
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    child: Text(
                      "忘记密码",
                      style: TextStyle(
                        color: Color(0xff999999),
                        fontSize: 14,
                      ),
                    ),
                    onTap: () {
                      print("忘记密码");
                    },
                  ),

                ),

                RoundButton(
                  text: "登录",
                  margin: EdgeInsets.only(top: 20),
                  onPressed: () {
                    print("登录");
                    _loginAction(context);
                  },
                ),
                
                SizedBox(height: 15),
                InkWell(
                  
                  onTap: () {
                    print("新用户？注册");
                    Navigator.push(
                        context, new CupertinoPageRoute<void>(builder: (ctx) => new RegistView()));

                  },

                  child: RichText(text: TextSpan(children: <TextSpan>[
                    TextSpan(
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF999999),
                      ),
                      text: "新用户？"
                    ),
                    TextSpan(
                        style: TextStyle(
                        fontSize: 14,
                      color: Theme.of(context).primaryColor,
                    ),
                    text: "注册"
                    )

                  ])),

                )
                
              ],


            ),
          ),
        )
      ],


    );
  }


  _loginAction(BuildContext context) async {

    LogUtil.e("username : " + _controllerName.text + "\n password: " + _controllerPwd.text);

    SharedPreferences prefs = await SharedPreferences.getInstance() as SharedPreferences;
    prefs.setString( _controllerName.value.text.toString(), "username");

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => TabbarController()),
      ModalRoute.withName(''),
    );

  }

}

class LoginItem extends StatefulWidget {

  const LoginItem({
    Key key,
    this.prefixIcon,
    this.hasSufficIcon = false,
    this.hintText,
    this.controller,
  }) : super(key: key);

  final IconData prefixIcon;
  final bool hasSufficIcon;
  final String hintText;
  final TextEditingController controller;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginItemState();
  }

}

class LoginItemState extends State<LoginItem> {

  bool _obscureText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _obscureText = widget.hasSufficIcon;

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        IconButton(
          iconSize: 28,
          icon: Icon(
            widget.prefixIcon,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            print("press");
          },
        ),
        SizedBox(width: 30),
  Expanded(
    child: TextField(
      obscureText: _obscureText,
      controller: widget.controller,
      style: TextStyle(color: Color(0xFF666666), fontSize: 14),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Color(0xFF999999), fontSize: 14),
        suffixIcon: widget.hasSufficIcon ? IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: Color(0xFF666666),
          ),
          onPressed: () {
            setState(() {
              _obscureText = ! _obscureText;
            });
          },
        ): null,
      ),
    ),
  ),

      ],
    );
  }

}


class RoundButton extends StatelessWidget {

  const RoundButton({
    Key key,
    this.width,
    this.height = 50,
    this.margin,
    this.radius,
    this.bgColor,
    this.highlightColor,
    this.splashColor,
    this.child,
    this.text,
    this.style,
    this.onPressed,
  }) : super(key: key);

  final double width;
  final double height;
  final EdgeInsetsGeometry margin;
  final double radius;
  final Color bgColor;
  final Color highlightColor;
  final Color splashColor;
  final Widget child;
  final String text;
  final TextStyle style;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {

    Color _bgColor = bgColor ?? Theme.of(context).primaryColor;
    BorderRadius _borderRadius = BorderRadius.circular(radius ?? (height / 2));

    // TODO: implement build
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: Material(
        borderRadius: _borderRadius,
        color: _bgColor,
        child: InkWell(
          borderRadius: _borderRadius,
          onTap: () => onPressed(),
          child: child ?? Center(
            child: Text(
              text,
              style: style ?? TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }

}