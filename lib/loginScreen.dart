import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simon_game/selectLevelScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

Widget nickNameContainer() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      const SizedBox(height: 20),
      Container(
        alignment: Alignment.center,
        height: 50,
        child: TextField(
          showCursor: false,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.visiblePassword,
          style: const TextStyle(
            fontSize: 30,
            color: Colors.amberAccent,
            letterSpacing: 7,
          ),
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 3),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 5, color: Colors.amberAccent),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 3, color: Colors.amberAccent),
                borderRadius: BorderRadius.circular(15),
              ),
              hintText: "NICKNAME",
              hintStyle: const TextStyle(
                fontSize: 30,
                color: Colors.amberAccent,
              )),
        ),
      )
    ],
  );
}

Widget passwordContainer() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      const SizedBox(height: 20),
      Container(
        alignment: Alignment.center,
        height: 50,

        child: TextField(
          showCursor: false,
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.center,
          keyboardType: TextInputType.visiblePassword,
          style: const TextStyle(
            fontSize: 30,
            letterSpacing: 7,
            color: Colors.amberAccent,
          ),
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 3),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 5, color: Colors.amberAccent),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 3, color: Colors.amberAccent),
                borderRadius: BorderRadius.circular(15),
              ),
              hintText: "PASSWORD",
              hintStyle: const TextStyle(
                fontSize: 30,
                color: Colors.amberAccent,
              )),
        ),
      )
    ],
  );
}

Widget loginBtn(BuildContext context) {
  return Container(
    alignment: Alignment.bottomLeft,
    child: TextButton(
      onPressed: () => {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const SelectLevelScreen())),
      },
      child: const Text(
        "LOGIN",
        style: TextStyle(
            color: Colors.amberAccent,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget signInBtn() {
  return Container(
    alignment: Alignment.bottomRight,
    child: TextButton(
      onPressed: () => print("Sign In button"),
      child: const Text(
        "SIGN IN",
        style: TextStyle(
            color: Colors.amberAccent,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}

class _LoginScreenState extends State<LoginScreen> {
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
                  children: <Widget>[
                    const Text(
                      "SIMON GAME",
                      style: TextStyle(
                        color: Colors.amberAccent,
                        fontSize: 35,
                        fontFamily: "Schyler",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 100),
                    nickNameContainer(),
                    const SizedBox(height: 30),
                    passwordContainer(),
                    const SizedBox(height: 70),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        loginBtn(context),
                        const SizedBox(
                          width: 130,
                        ),
                        signInBtn(),
                      ],
                    )
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
