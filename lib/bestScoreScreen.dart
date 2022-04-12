
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simon_game/selectLevelScreen.dart';

class BestScoreScreen extends StatefulWidget {
  const BestScoreScreen({Key? key}) : super(key: key);

  @override
  State<BestScoreScreen> createState() => _BestScoreScreenState();
}

class _BestScoreScreenState extends State<BestScoreScreen> {
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
                    const Text(
                      "EASY : 7",
                      style: TextStyle(
                        color: Colors.amberAccent,
                        fontSize: 30,
                        fontFamily: "Schyler",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "MEDIUM : 14",
                      style: TextStyle(
                        color: Colors.amberAccent,
                        fontSize: 30,
                        fontFamily: "Schyler",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "HARD: 3",
                      style: TextStyle(
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
