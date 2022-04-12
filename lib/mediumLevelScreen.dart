import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MediumLevelScreen extends StatefulWidget {
  const MediumLevelScreen({Key? key}) : super(key: key);

  @override
  State<MediumLevelScreen> createState() => _MediumLevelScreenState();
}

class _MediumLevelScreenState extends State<MediumLevelScreen> {
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
                      height: 50,
                    ),
                    const Text(
                      "MEDIUM : 14",
                      style: TextStyle(
                        color: Colors.amberAccent,
                        fontSize: 24,
                        fontFamily: "Schyler",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: ElevatedButton(
                            onPressed: () {
                              print("red");
                            },
                            child: null,
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.redAccent)),
                          ),
                        ),
                        const SizedBox(
                          width: 70,
                        ),
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: ElevatedButton(
                            onPressed: () {
                              print("green");
                            },
                            child: null,
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.greenAccent)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 50,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: ElevatedButton(
                            onPressed: () {
                              print("blue");
                            },
                            child: null,
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.blueAccent)),
                          ),
                        ),
                        const SizedBox(
                          width: 70,
                        ),
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: ElevatedButton(
                            onPressed: () {
                              print("purple");
                            },
                            child: null,
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.purpleAccent)),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30 ,
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
