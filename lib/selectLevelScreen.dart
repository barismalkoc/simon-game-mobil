import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simon_game/bestScoreScreen.dart';
import 'package:simon_game/easyLevelScreen.dart';
import 'package:simon_game/hardLevelScreen.dart';
import 'package:simon_game/mediumLevelScreen.dart';
import 'package:simon_game/user.dart';

class SelectLevelScreen extends StatefulWidget {
  User user;

  SelectLevelScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<SelectLevelScreen> createState() => _SelectLevelScreenState();

}

Widget easyLevelBtn(BuildContext context, User user) {
  return Container(
    alignment: Alignment.center,
    child: TextButton(
      onPressed: () => {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EasyLevelScreen(user: user))),
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

Widget mediumLevelBtn(BuildContext context, User user) {
  return Container(
    alignment: Alignment.center,
    child: TextButton(
      onPressed: () => {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MediumLevelScreen(user: user))),
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

Widget hardLevelBtn(BuildContext context, User user) {
  return Container(
    alignment: Alignment.center,
    child: TextButton(
      onPressed: () => {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => HardLevelScreen(user: user))),
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

Widget bestScoreBtn(BuildContext context, User user) {
  return Container(
    alignment: Alignment.center,
    child: TextButton(
      onPressed: () => {

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BestScoreScreen(user: user))),
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
                padding: EdgeInsets.symmetric(
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
                    easyLevelBtn(context, widget.user),
                    mediumLevelBtn(context, widget.user),
                    hardLevelBtn(context, widget.user),
                    const SizedBox(
                      height: 60,
                    ),
                    bestScoreBtn(context, widget.user),
                    const SizedBox(
                      height: 120,
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
