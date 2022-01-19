import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_project/colors.dart' as colors;

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List info = [];
  _initData() {
    DefaultAssetBundle.of(context)
        .loadString("json/videoinfo.json")
        .then((value) {
      info = json.decode(value);
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colors.AppColor.gradientFirst.withOpacity(0.8),
            colors.AppColor.gradientSecond,
          ],
          begin: const FractionalOffset(0.0, 0.4),
          end: Alignment.topRight,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back_ios,
                          size: 20, color: colors.AppColor.secondPageIconColor),
                    ),
                    Expanded(child: Container()),
                    Icon(Icons.info_outline,
                        size: 20, color: colors.AppColor.secondPageIconColor),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Legs Toning",
                  style: TextStyle(
                    fontSize: 25,
                    color: colors.AppColor.secondPageTitleColor,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "and Glutes Workout",
                  style: TextStyle(
                    fontSize: 25,
                    color: colors.AppColor.secondPageTitleColor,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Wrap(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 4.0),
                      margin: const EdgeInsets.only(right: 16.0, bottom: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            colors.AppColor.secondPageContainerGradient1stColor,
                            colors.AppColor.secondPageContainerGradient2ndColor
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.timer,
                            size: 20,
                            color: colors.AppColor.secondPageIconColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "68 min",
                            style: TextStyle(
                              fontSize: 16,
                              color: colors.AppColor.secondPageIconColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            colors.AppColor.secondPageContainerGradient1stColor,
                            colors.AppColor.secondPageContainerGradient2ndColor
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.handyman_outlined,
                            size: 20,
                            color: colors.AppColor.secondPageIconColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Resistent band",
                            style: TextStyle(
                              fontSize: 16,
                              color: colors.AppColor.secondPageIconColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            colors.AppColor.secondPageContainerGradient1stColor,
                            colors.AppColor.secondPageContainerGradient2ndColor
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.handyman_outlined,
                            size: 20,
                            color: colors.AppColor.secondPageIconColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Kettebell",
                            style: TextStyle(
                              fontSize: 16,
                              color: colors.AppColor.secondPageIconColor,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(70)),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Circuit 1: Legs Toning",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: colors.AppColor.circuitsColor,
                      ),
                    ),
                    Expanded(child: Container()),
                    Row(
                      children: [
                        Icon(
                          Icons.loop,
                          size: 30,
                          color: colors.AppColor.loopColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "3 sets",
                          style: TextStyle(
                            fontSize: 15,
                            color: colors.AppColor.setsColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                )
              ],
            ),
          )),
        ],
      ),
    ));
  }
}
