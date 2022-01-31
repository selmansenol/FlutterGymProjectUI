import 'dart:convert';

import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_project/Api/api.dart';
import 'package:gym_project/Model/exercise.dart';
import 'package:gym_project/colors.dart' as colors;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoInfo = [];
  bool _playArea = false;
  late YoutubePlayerController _controller;
  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/videoinfo.json")
        .then((value) {
      setState(() {
        videoInfo = json.decode(value);
      });
    });
  }

  List<Exercise> exercises = [];
  List<Exercise> exercisesBodyWeight = [];
  List<String> urlList = [
    "https://exercisedb.p.rapidapi.com/exercises/bodyPart/upper%20legs?rapidapi-key=" +
        Api.rapid_key.toString(),
    "https://exercisedb.p.rapidapi.com/exercises/bodyPart/waist?rapidapi-key=" +
        Api.rapid_key.toString(),
    "https://exercisedb.p.rapidapi.com/exercises/bodyPart/lower%20legs?rapidapi-key=" +
        Api.rapid_key.toString(),
    "https://exercisedb.p.rapidapi.com/exercises/target/forearms?rapidapi-key=" +
        Api.rapid_key.toString(),
  ];
  void initialize() async {
    exercises = await Api.getUpperArms(urlList[0]);
    if (mounted) {
      setState(() {
        print("Name: " + exercises.first.name);
      });
    }
    exercisesBodyWeight = exercises
        .where((e) => e.equipment == "body weight" || e.equipment == "dumbbell")
        .toList();
  }

  @override
  void initState() {
    super.initState();
    initialize();
    _initData();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: _playArea == false
          ? BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  colors.AppColor.gradientFirst.withOpacity(0.8),
                  colors.AppColor.gradientSecond,
                ],
                begin: const FractionalOffset(0.0, 0.4),
                end: Alignment.topRight,
              ),
            )
          : BoxDecoration(
              color: colors.AppColor.gradientSecond,
            ),
      child: Column(
        children: [
          _playArea == false
              ? Container(
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
                                size: 20,
                                color: colors.AppColor.secondPageIconColor),
                          ),
                          Expanded(child: Container()),
                          Icon(Icons.info_outline,
                              size: 20,
                              color: colors.AppColor.secondPageIconColor),
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
                            margin:
                                const EdgeInsets.only(right: 16.0, bottom: 8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [
                                  colors.AppColor
                                      .secondPageContainerGradient1stColor,
                                  colors.AppColor
                                      .secondPageContainerGradient2ndColor
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
                                  colors.AppColor
                                      .secondPageContainerGradient1stColor,
                                  colors.AppColor
                                      .secondPageContainerGradient2ndColor
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
                                  "Dumbbell",
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
                                  colors.AppColor
                                      .secondPageContainerGradient1stColor,
                                  colors.AppColor
                                      .secondPageContainerGradient2ndColor
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
                                  "Body Weight",
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
                )
              : Column(
                  children: [
                    Container(
                      height: 100,
                      padding: const EdgeInsets.only(
                        top: 50,
                        left: 30,
                        right: 30,
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              _controller.pause();
                              _playArea = false;
                              setState(() {});
                            },
                            child: Icon(Icons.close,
                                size: 20,
                                color: colors.AppColor.secondPageTopIconColor),
                          ),
                          Expanded(child: Container()),
                          Icon(
                            Icons.info_outline,
                            size: 20,
                            color: colors.AppColor.secondPageTopIconColor,
                          )
                        ],
                      ),
                    ),
                    _playView(context),
                  ],
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
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(child: _listView()),
              ],
            ),
          )),
        ],
      ),
    ));
  }

  Widget _playView(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        aspectRatio: 16 / 9,
        width: MediaQuery.of(context).size.width,
        controller: _controller,
        showVideoProgressIndicator: true,
        bottomActions: [
          CurrentPosition(),
          ProgressBar(isExpanded: true),
          // FullScreenButton(),
          RemainingDuration(),
          PlayPauseButton(),
          const PlaybackSpeedButton(),
        ],
      ),
      builder: (context, player) {
        return Column(
          children: [
            player,
          ],
        );
      },
    );
  }

  _onTapVideo(int index) {
    String? videoId =
        YoutubePlayer.convertUrlToId(videoInfo[index]["videoUrl"]);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
  }

  _listView() {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        itemCount: exercisesBodyWeight.length,
        itemBuilder: (_, int index) {
          return GestureDetector(
              onTap: () {
                _onTapVideo(index);
                debugPrint(index.toString());
                setState(() {
                  _playArea = _playArea == false;
                });
              },
              child: _buildCard(index));
        });
  }

  _buildCard(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: exercisesBodyWeight.isNotEmpty
                        ? NetworkImage(exercisesBodyWeight[index].gifUrl)
                        : const NetworkImage(""),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringUtils.capitalize(exercisesBodyWeight[index].name),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(
                        StringUtils.capitalize(
                            exercisesBodyWeight[index].target),
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            children: [
              Container(
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                  color: const Color(0xFFeaeefc),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "15s rest",
                    style: TextStyle(
                      color: Color(0xFF839fed),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Divider(
                  endIndent: 50.0,
                  thickness: 0.8,
                  color: Colors.grey[500],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
