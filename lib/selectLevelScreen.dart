import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simon_game/bestScoreScreen.dart';
import 'package:simon_game/easyLevelScreen.dart';
import 'package:simon_game/hardLevelScreen.dart';
import 'package:simon_game/mediumLevelScreen.dart';

class SelectLevelScreen extends StatefulWidget {
  const SelectLevelScreen({Key? key}) : super(key: key);

  @override
  State<SelectLevelScreen> createState() => _SelectLevelScreenState();
}

Widget easyLevelBtn(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    child: TextButton(
      onPressed: () => {
        print("Easy level"),
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const EasyLevelScreen())),
      },
      child: const Text(
        "EASY",
        style: TextStyle(
            letterSpacing: 5,
            color: Colors.amberAccent,
            fontSize: 27,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget mediumLevelBtn(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    child: TextButton(
      onPressed: () => {
        print("Easy level"),
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const MediumLevelScreen())),
      },
      child: const Text(
        "MEDIUM",
        style: TextStyle(
            letterSpacing: 5,
            color: Colors.amberAccent,
            fontSize: 27,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget hardLevelBtn(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    child: TextButton(
      onPressed: () => {
        print("Hard level"),
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const HardLevelScreen())),
      },
      child: const Text(
        "HARD",
        style: TextStyle(
            letterSpacing: 5,
            color: Colors.amberAccent,
            fontSize: 27,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget bestScoreBtn(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    child: TextButton(
      onPressed: () => {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const BestScoreScreen())),
      },
      child: const Text(
        "BEST SCORE",
        style: TextStyle(
            letterSpacing: 5,
            color: Colors.amberAccent,
            fontSize: 30,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget startBtn() {
  return Container(
    alignment: Alignment.center,
    child: TextButton(
      onPressed: () => {},
      child: const Text(
        "LET'S START",
        style: TextStyle(
            letterSpacing: 5,
            color: Colors.amberAccent,
            fontSize: 35,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}

class _SelectLevelScreenState extends State<SelectLevelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color(0xff1fa5a5),
                    Color(0xff77cccc),
                  ])),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 120,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "NICKNAME",
                        style: TextStyle(
                          color: Colors.amberAccent,
                          fontSize: 15,
                          fontFamily: "Schyler",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "SIMON GAME",
                      style: TextStyle(
                        color: Colors.amberAccent,
                        fontSize: 35,
                        fontFamily: "Schyler",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    easyLevelBtn(context),
                    mediumLevelBtn(context),
                    hardLevelBtn(context),
                    const SizedBox(
                      height: 60,
                    ),
                    bestScoreBtn(context),
                    startBtn(),
                    const SizedBox(
                      height: 20,
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
