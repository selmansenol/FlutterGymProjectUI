import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_project/Pages/videoinfo.dart';
import 'package:gym_project/colors.dart' as colors;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];
  _initData() {
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
      setState(() {
        info = json.decode(value);
      });
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
      backgroundColor: colors.AppColor.homePageBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 30,
              right: 30,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Training",
                      style: TextStyle(
                          fontSize: 30,
                          color: colors.AppColor.homePageTitle,
                          fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: colors.AppColor.homePageIcons,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.calendar_today_outlined,
                        size: 20, color: colors.AppColor.homePageIcons),
                    const SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: colors.AppColor.homePageIcons,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Your Program",
                      style: TextStyle(
                          fontSize: 20,
                          color: colors.AppColor.homePageSubtitle,
                          fontWeight: FontWeight.w700),
                    ),
                    Expanded(child: Container()),
                    InkWell(
                      onTap: () {
                        Get.to(() => const VideoInfo());
                      },
                      child: Row(
                        children: [
                          Text(
                            "Details",
                            style: TextStyle(
                              fontSize: 20,
                              color: colors.AppColor.homePageDetail,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 20,
                            color: colors.AppColor.homePageDetail,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 220,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          colors.AppColor.gradientFirst.withOpacity(0.8),
                          colors.AppColor.gradientSecond.withOpacity(0.9),
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(80),
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(5, 10),
                          blurRadius: 20,
                          color:
                              colors.AppColor.gradientSecond.withOpacity(0.2),
                        )
                      ]),
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 20, top: 25, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Next Workout",
                          style: TextStyle(
                            fontSize: 16,
                            color: colors.AppColor.homePageContainerTextSmall,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Legs Toning",
                          style: TextStyle(
                            fontSize: 25,
                            color: colors.AppColor.homePageContainerTextSmall,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "and Glutes Workout",
                          style: TextStyle(
                            fontSize: 25,
                            color: colors.AppColor.homePageContainerTextSmall,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.timer,
                                    size: 20,
                                    color: colors
                                        .AppColor.homePageContainerTextSmall),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "60 min",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: colors
                                        .AppColor.homePageContainerTextSmall,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  boxShadow: [
                                    BoxShadow(
                                      color: colors.AppColor.gradientFirst,
                                      blurRadius: 10,
                                      offset: const Offset(4, 8),
                                    )
                                  ]),
                              child: const Icon(
                                Icons.play_circle_fill,
                                color: Colors.white,
                                size: 60,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(top: 30),
                        height: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                                image: AssetImage("assets/card.jpg"),
                                fit: BoxFit.fill),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 40,
                                  offset: const Offset(8, 10),
                                  color: colors.AppColor.gradientSecond
                                      .withOpacity(0.3)),
                              BoxShadow(
                                  blurRadius: 10,
                                  offset: const Offset(-1, -5),
                                  color: colors.AppColor.gradientSecond
                                      .withOpacity(0.3)),
                            ]),
                      ),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(right: 200, bottom: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image: AssetImage("assets/figure.png"),
                          ),
                        ),
                      ),
                      Container(
                        width: double.maxFinite,
                        height: 100,
                        margin: const EdgeInsets.only(
                          left: 150,
                          top: 50,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "You are doing great",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: colors.AppColor.homePageDetail),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            RichText(
                              text: const TextSpan(
                                  text: "Keep it up\n",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                  children: [
                                    TextSpan(text: "stick to your plan")
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Area of focus",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: colors.AppColor.homePageTitle,
                      ),
                    ),
                  ],
                ),
                GridView.builder(
  itemCount: 4,
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2),
  itemBuilder: (BuildContext context, int index) {
    return Card(
      child:GridTile(
        footer:Text("name"),
        child:Text("surname"), //just for testing, will fill with image later
      ),
    );
                SizedBox(
                  height: info.length.toDouble() ~/ 2 * 230,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: info.length.toDouble() ~/ 2, //2
                      itemBuilder: (_, i) {
                        int a = 2 * i;
                        int b = 2 * i + 1;
                        return Row(
                          children: [
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width - 90) / 2,
                              height: 170,
                              margin: const EdgeInsets.only(
                                bottom: 30,
                              ),
                              padding: const EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: AssetImage(info[a]['img']),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: const Offset(5, 5),
                                      color: colors.AppColor.gradientSecond
                                          .withOpacity(0.1),
                                    ),
                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: const Offset(-5, -5),
                                      color: colors.AppColor.gradientSecond
                                          .withOpacity(0.1),
                                    )
                                  ]),
                              child: Center(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    info[a]["title"],
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: colors.AppColor.homePageDetail),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width - 90) / 2,
                              height: 170,
                              margin: const EdgeInsets.only(
                                left: 30,
                                bottom: 30,
                              ),
                              padding: const EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: AssetImage(info[b]['img']),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: const Offset(5, 5),
                                      color: colors.AppColor.gradientSecond
                                          .withOpacity(0.1),
                                    ),
                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: const Offset(-5, -5),
                                      color: colors.AppColor.gradientSecond
                                          .withOpacity(0.1),
                                    )
                                  ]),
                              child: Center(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    info[b]["title"],
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: colors.AppColor.homePageDetail),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
