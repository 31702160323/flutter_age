import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_age/api/module/AniPreUpList.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';

import 'api/apis.dart' as APIS;
import 'api/module/Slipic.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  List<Slipic>? _images;
  AniPreUpList? _homeList;
  final weekTabs = ['周日', '周一', '周二', '周三', '周四', '周五', '周六'];

  final OutlineInputBorder _inputBorderStyle = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.green),
    borderRadius: BorderRadius.all(Radius.circular(50.0)),
  );

  @override
  void initState() {
    super.initState();
    APIS.getSlipic().then((response) {
      List responseJson = json.decode(response.body);
      setState(() {
        _images = responseJson.map((map) => Slipic.fromJson(map)).toList();
      });
    });

    APIS.getHomeList({"update": 12, "recommend": 12}).then((response) {
      Map<String, dynamic> responseJson = json.decode(response.body);
      print(responseJson);
      setState(() {
        _homeList = AniPreUpList.fromJson(responseJson);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      hintText: '请输入搜索关键字',
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 25,
                      ),
                      enabledBorder: _inputBorderStyle,
                      focusedBorder: _inputBorderStyle,
                    ),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: _images != null
                      ? Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return new Image.network(
                              _images![index].PicUrl,
                              fit: BoxFit.fill,
                            );
                          },
                          indicatorLayout: PageIndicatorLayout.COLOR,
                          autoplay: true,
                          itemCount: _images!.length,
                          pagination: new SwiperPagination(),
                          control: new SwiperControl(),
                        )
                      : Text(''),
                ),
                SizedBox(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text("每日推荐"),
                      ),
                      GridView.builder(
                        // 处理GridView中滑动父级ListView无法滑动
                        physics: NeverScrollableScrollPhysics(),
                        // 处理ListView和GridView嵌套报错问题
                        shrinkWrap: true,
                        itemCount: _homeList!.aniPreEvDay.length,
                        cacheExtent: 50,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 3,
                          mainAxisSpacing: 3,
                          childAspectRatio: 3 / 4,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Image.network(
                            _homeList!.aniPreEvDay[index].picSmall,
                            alignment: Alignment.center,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text("最近更新"),
                      ),
                      GridView.builder(
                        // 处理GridView中滑动父级ListView无法滑动
                        physics: NeverScrollableScrollPhysics(),
                        // 处理ListView和GridView嵌套报错问题
                        shrinkWrap: true,
                        itemCount: _homeList!.aniPreUp.length,
                        cacheExtent: 50,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 3,
                          mainAxisSpacing: 3,
                          childAspectRatio: 3 / 4,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Image.network(
                            _homeList!.aniPreUp[index].picSmall,
                            alignment: Alignment.center,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      onWillPop: () => Future.value(true),
    );
  }
}
