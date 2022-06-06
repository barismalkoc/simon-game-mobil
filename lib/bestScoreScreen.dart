
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simon_game/selectLevelScreen.dart';
import 'package:simon_game/user.dart';
import 'package:simon_game/userDao.dart';

class BestScoreScreen extends StatefulWidget {
  User user;
  BestScoreScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<BestScoreScreen> createState() => _BestScoreScreenState();
}


class _BestScoreScreenState extends State<BestScoreScreen> {

  late int easyLevelScore = 0;
  late int mediumLevelScore = 0;
  late int hardLevelScore = 0;

  Future<void> getScores() async {
    List<int> scores = await UserDao().getUserScore(widget.user);

    setState(() {
      easyLevelScore = scores[0];
      mediumLevelScore = scores[1];
      hardLevelScore = scores[2];
    });

  }

  @override
  void initState() {
    super.initState();
    getScores();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color(0xff1fa5a5),
                    Color(0xff77cccc),
                  ])),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                padding:  EdgeInsets.symmetric(
                  horizontal:MediaQuery.of(context).size.width / 10,
                  vertical: MediaQuery.of(context).size.height / 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                     Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        widget.user.user_name,
                        style: const TextStyle(
                          color: Colors.amberAccent,
                          fontSize: 15,
                          fontFamily: "Schyler",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      "BEST SCORE",
                      style: TextStyle(
                        color: Colors.amberAccent,
                        fontSize: 35,
                        fontFamily: "Schyler",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                     Text(
                      'EASY : $easyLevelScore',
                      style: const TextStyle(
                        color: Colors.amberAccent,
                        fontSize: 30,
                        fontFamily: "Schyler",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "MEDIUM : $mediumLevelScore",
                      style:  const TextStyle(
                        color: Colors.amberAccent,
                        fontSize: 30,
                        fontFamily: "Schyler",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                     Text(
                      "HARD: $hardLevelScore",
                      style: const TextStyle(
                        color: Colors.amberAccent,
                        fontSize: 30,
                        fontFamily: "Schyler",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 170,
                    ),
                    IconButton(
                        onPressed: () => {
                          Navigator.pop(context),
                        },
                        icon: const Icon(
                          Icons.wb_sunny_outlined,
                          size: 60,
                          color: Colors.amberAccent,
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
