import 'package:flutter/material.dart';
import 'package:my_app/common/colors.dart';
import 'package:my_app/common/log_util.dart';
import 'package:my_app/view/banner_view.dart';

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeStatePage();
  }

}


class HomeStatePage extends State<HomePage> {

  List<BannerItem> bannerList = [];

  @override
  void initState() {
    // TODO: implement initState
//    super.initState();
//    LogUtil.e(MediaQuery.of(context).size.width);
  _getBannerData();

  }

  _getBannerData() {

    BannerItem item = BannerItem.defaultBannerItem(
        '''http://n.sinaimg.cn/news/1_img/vcg/2b0c102b/64/w1024h640/20181024/wBkr-hmuuiyw6863395.jpg''',
        '''近日，北大全校教师干部大会刚刚召开，63岁的林建华卸任北大校长；原北大党委书记郝平接替林建华，成为新校长。曾在北京任职多年、去年担任山西高院院长的邱水平回到北大，担任党委书记。图为2018年5月4日，北京大学举行建校120周年纪念大会，时任北京大学校长林建华（右）与时任北京大学党委书记郝平（左）''');
    bannerList.add(item);
    item = BannerItem.defaultBannerItem(
        '''http://n.sinaimg.cn/news/1_img/vcg/2b0c102b/99/w1024h675/20181024/FGXD-hmuuiyw6863401.jpg''',
        '''邱水平、郝平、林建华均为“老北大人”，都曾离开北大，又重归北大任职。图为2018年5月4日，北京大学举行建校120周年纪念大会，时任北京大学党委书记郝平讲话''');
    bannerList.add(item);
    item = BannerItem.defaultBannerItem(
        '''http://n.sinaimg.cn/news/1_img/vcg/2b0c102b/107/w1024h683/20181024/kZj2-hmuuiyw6863420.jpg''',
        '''此番卸任的林建华，亦是北大出身，历任重庆大学、浙江大学、北京大学三所“双一流”高校校长。图为2018年5月4日，北京大学举行建校120周年纪念大会，时任北京大学校长林建华讲话。''');
    bannerList.add(item);
    item = BannerItem.defaultBannerItem(
        '''http://n.sinaimg.cn/news/1_img/vcg/2b0c102b/105/w1024h681/20181024/tOiL-hmuuiyw6863462.jpg''',
        '''书记转任校长的郝平，为十九届中央委员会候补委员。从北大毕业后留校，后离开北大，历任北京外国语大学校长、教育部副部长。2016年12月，时隔11年，郝平再回北大，出任北大党委书记。''');
    bannerList.add(item);
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Colours.app_bg,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("首页"),
          ),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              
              Container(
//                height: 160,
                  color: Colors.red,
                  child: BannerView(200, bannerList)
              ),

              SizedBox(height: 5),
              Container(
//                height: 160,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        ItemBox("支付宝", "assets/images/alipay.png"),
                        ItemBox("微信", "assets/images/wechat.png"),
                        ItemBox("京东", "assets/images/jd.png"),
                        ItemBox("有道云笔记", "assets/images/ydybj.png"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        ItemBox("爱奇艺", "assets/images/aqy.png"),
                        ItemBox("百度", "assets/images/bd.png"),
                        ItemBox("谷歌", "assets/images/google.png"),
                        ItemBox("短信", "assets/images/dx.png"),
                      ],
                    ),
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

class ItemBox extends StatelessWidget {



  String text;
  String icon;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width/4,
      height: 80,
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),

            Image.asset(
              icon,
              width: 35,
              height: 35,
            ),

            SizedBox(height: 5),
            Text(
              this.text,
              style: TextStyle(
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }

  ItemBox(this.text, this.icon);


}