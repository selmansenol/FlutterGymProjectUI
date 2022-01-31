import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gym_project/Api/api.dart';
import 'package:gym_project/Model/exercise.dart';
import 'package:gym_project/colors.dart' as colors;

class ExerciseInfo extends StatefulWidget {
  final int page;
  final String title;
  const ExerciseInfo({Key? key, required this.page, required this.title})
      : super(key: key);

  @override
  _ExerciseInfoState createState() => _ExerciseInfoState();
}

class _ExerciseInfoState extends State<ExerciseInfo> {
  List<Exercise> exercises = [];
  List<Exercise> exercises_bodyweight = [];
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
    exercises = await Api.getUpperArms(urlList[widget.page]);
    if (mounted) {
      setState(() {
        print("Name: " + exercises.first.name);
      });
    }
    exercises_bodyweight =
        exercises.where((e) => e.equipment == "body weight").toList();
  }

  @override
  void initState() {
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int axiscount =
        MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3;
    const double aspectratio = 0.72;
    return Scaffold(
      backgroundColor: colors.AppColor.homePageBackground,
      appBar: AppBar(
        backgroundColor: colors.AppColor.homePageBackground,
        foregroundColor: colors.AppColor.homePageTitle,
        shadowColor: colors.AppColor.gradientSecond.withOpacity(0.1),
        elevation: 5,
        title: Text(
          widget.title + " Exercises",
          style: TextStyle(
            fontSize: 30,
            color: colors.AppColor.homePageTitle,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(20.0),
          itemCount: exercises_bodyweight.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: axiscount,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: aspectratio,
          ),
          itemBuilder: (BuildContext context, int index) {
            return exercises_bodyweight.isNotEmpty
                ? Container(
                    clipBehavior: Clip.hardEdge,
                    width: MediaQuery.of(context).size.width * .5,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3,
                            offset: const Offset(5, 5),
                            color:
                                colors.AppColor.gradientSecond.withOpacity(0.1),
                          ),
                          BoxShadow(
                            blurRadius: 3,
                            offset: const Offset(-5, -5),
                            color:
                                colors.AppColor.gradientSecond.withOpacity(0.1),
                          )
                        ]),
                    child: Column(
                      children: [
                        Image.network(
                          exercises_bodyweight[index].gifUrl,
                          color: colors.AppColor.gradientFirst,
                          colorBlendMode: BlendMode.softLight,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            StringUtils.capitalize(
                                exercises_bodyweight[index].name),
                            style: TextStyle(
                              fontSize: 16,
                              color: colors.AppColor.homePageDetail,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  )
                : const SpinKitDoubleBounce(
                    color: Colors.indigo,
                    size: 72.0,
                  );
          },
        ),
      ),
    );
  }
}
