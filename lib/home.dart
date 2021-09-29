import 'dart:convert';

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

    APIS.getHomeList({
      "update": 12,
      "recommend": 12
    }).then((response) {
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
                  Container(
                    height: 200,
                    child: _images != null ? Swiper(
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
                    ) : Text(''),
                  ),
              ],
            ),
          ),
        ),
      ),
      onWillPop: () => Future.value(true),
    );
  }
}
