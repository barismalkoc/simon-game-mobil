import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simon_game/components/simonColor.dart';
import 'package:simon_game/components/utilities/constants.dart';
import 'package:simon_game/user.dart';
import 'dart:math' as Math;

import 'package:simon_game/userDao.dart';

class EasyLevelScreen extends StatefulWidget {
  User user;

  EasyLevelScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<EasyLevelScreen> createState() => _EasyLevelScreenState();
}

class _EasyLevelScreenState extends State<EasyLevelScreen> {
   String _info = "";
  AudioCache audioPlayer = AudioCache();
  int _levelNumber = 0;
  double _redOpacity = 1.0;
  double _greenOpacity = 1.0;
  bool _result = false;

  final List<int> _pcSequence = [];
  final List<int> _playerSequence = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      startGame();
    });
  }

  void startGame() {
    _levelNumber = 0;
    Future.delayed(const Duration(milliseconds: 300), () {
      if (_levelNumber == 0) {
        _result = true;
        _levelNumber += 1;
        _playerSequence.clear();
        _pcSequence.add(Math.Random().nextInt(2) + 1);
        playSequence(_pcSequence);
      } else if (_levelNumber > 0) {
        _result = false;
        _levelNumber = 0;
        _pcSequence.clear();
        _playerSequence.clear();
      }
    });
  }

  void changeOpacity(OpacityColor color) {

    audioPlayer.loadAll(["red.mp3","green.mp3"]);
    switch (color) {
      case OpacityColor.red:
        audioPlayer.play("red.mp3");
        if (mounted) {
          setState(()  {
            _redOpacity = _redOpacity == 1.0 ? 0.0 : 1.0;


          });
        }
        Future.delayed(kDelayedOpacityDuration, () {
          if (mounted) {
            setState(() {
              _redOpacity = _redOpacity == 0.0 ? 1.0 : 0.0;
            });
          }
        });
        break;
      case OpacityColor.green:
        audioPlayer.play("green.mp3");
        if (mounted) {
          setState(() {
            _greenOpacity = _greenOpacity == 1.0 ? 0.0 : 1.0;
          });
        }
        Future.delayed(kDelayedOpacityDuration, () {
          if (mounted) {
            setState(() {
              _greenOpacity = _greenOpacity == 0.0 ? 1.0 : 0.0;
            });
          }
        });
        break;
    }
  }

  void simonPlay(int index, String simonColor, OpacityColor opacityColor) {

    Future.delayed(Duration(milliseconds: index * 500), () {
      changeOpacity(opacityColor);

    });
  }

  void playSequence(List<int> sequence) {


    for (var i = 0; i < sequence.length; i++) {
      switch (sequence[i]) {
        case 1:
          simonPlay(i, SimonColor.red, OpacityColor.red);
          break;
        case 2:
          simonPlay(i, SimonColor.green, OpacityColor.green);
      }
    }
  }

  void nextSequence() {
    if (mounted) {
      setState(() {
        _playerSequence.clear();
        _result = true;
        _levelNumber++;
        _pcSequence.clear();

        for (var i = 0; i < _levelNumber; i++) {
          _pcSequence.add(Math.Random().nextInt(2) + 1);
        }
      });
    }
    Future.delayed(const Duration(seconds: 2), () {
      playSequence(_pcSequence);

    });


  }

  bool checkSequence() {

    int count = 0;
    for (var sq in _pcSequence) {
      for (var i = count; i < _playerSequence.length;) {
        if (sq != _playerSequence[i]) {
          audioPlayer.load("wrong.mp3");
          audioPlayer.play("wrong.mp3");
          return false;
        } else {
          count++;
          break;
        }
      }
      continue;
    }
    return true;
  }

  void endGame() {
    if (_levelNumber > widget.user.user_easy_score) {
      UserDao().updateEasyLevelScore(widget.user, _levelNumber);
    }

    if (mounted) {
      setState(() {
        _result = false;
        _levelNumber = 0;
        _pcSequence.clear();
        _playerSequence.clear();
      });
    }

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _levelNumber = -1;
          startGame();
        });
      }
    });
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
                      height: 20,
                    ),
                    Text(
                      _levelNumber == -1 ? "Game Over" : 'Easy : $_levelNumber',
                      style: const TextStyle(
                        color: Colors.amberAccent,
                        fontSize: 24,
                        fontFamily: "Schyler",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        AnimatedOpacity(
                          duration: kAnimatedOpacityDuration,
                          opacity: _greenOpacity,
                          child: ElevatedButton(
                            onPressed: () {
                              _playerSequence.add(2);
                              changeOpacity(OpacityColor.green);
                              if (_pcSequence.length ==
                                  _playerSequence.length) {
                                if (mounted) {
                                  setState(() {
                                    _result = checkSequence();
                                    if (_result) {
                                      nextSequence();
                                    } else {
                                      endGame();
                                    }
                                  });
                                }
                              }
                            },
                            child: null,
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(100, 100),
                                primary: Colors.greenAccent),
                          ),
                        ),
                        kWidthSpacer,
                        AnimatedOpacity(
                          duration: kAnimatedOpacityDuration,
                          opacity: _redOpacity,
                          child: ElevatedButton(
                            onPressed: () {
                              _playerSequence.add(1);
                              changeOpacity(OpacityColor.red);
                              if (_pcSequence.length ==
                                  _playerSequence.length) {
                                if (mounted) {
                                  setState(() {
                                    _result = checkSequence();
                                    if (_result) {
                                      nextSequence();
                                    } else {
                                      endGame();
                                    }
                                  });
                                }
                              }
                            },
                            child: null,
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(100, 100),
                                primary: Colors.redAccent),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 120,
                    ),
                    Text(
                      _info,
                      style: const TextStyle(
                        color: Colors.amberAccent,
                        fontSize: 24,
                        fontFamily: "Schyler",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
