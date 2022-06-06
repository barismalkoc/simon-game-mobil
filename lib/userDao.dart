import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simon_game/databaseHelper.dart';
import 'package:simon_game/selectLevelScreen.dart';
import 'package:simon_game/user.dart';

class UserDao {
  Future<List<User>> allUser() async {
    var db = await DatabaseHelper.dbHelper();
    List<Map<String,dynamic>> maps = await db!.rawQuery("Select * from user");
    return List.generate(maps.length, (index)  {
      var row = maps[index];

      return User(row["user_id"], row["user_name"], row["user_password"],row["user_easy_score"] ,row["user_medium_score"] ,row["user_hard_score"]);
    });
  }

  Future<void> addUser(BuildContext context, User user) async {
    String userName = user.user_name;
    String userPassword = user.user_password;
    var db = await DatabaseHelper.dbHelper();
    var userInfo = <String, dynamic>{};
    {

      userInfo['user_name'] = userName;
      userInfo['user_password'] = userPassword;
      userInfo['user_easy_score'] = 0;
      userInfo['user_medium_score'] = 0;
      userInfo['user_hard_score'] = 0;
      await db?.insert("user", userInfo);
    }
    //db!.delete("user");
    //allUser();
  }

  Future<void> loginControl(BuildContext context, User user) async {
    var db = await DatabaseHelper.dbHelper();
    String userName = user.user_name;
    String userPassword = user.user_password;

    List<Map<String, dynamic>> users = await db!.rawQuery("SELECT * FROM user WHERE user_name = '$userName' and user_password = '$userPassword'");
    if(users.length > 0) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => SelectLevelScreen(user: user)));
    }

  }

  Future<void> updateEasyLevelScore(User user, int easyLevelScore) async {
    var db = await DatabaseHelper.dbHelper();
    String userName = user.user_name;


    db!.rawQuery("UPDATE user SET user_easy_score = '$easyLevelScore' WHERE user_name = '$userName'");
  }

  Future<void> updateMediumLevelScore(User user, int mediumLevelScore) async {
    var db = await DatabaseHelper.dbHelper();
    String userName = user.user_name;
    db!.rawQuery("UPDATE user SET user_medium_score = '$mediumLevelScore' WHERE user_name = '$userName'");
  }

  Future<void> updateHardLevelScore(User user, int hardLevelScore) async {
    var db = await DatabaseHelper.dbHelper();
    String userName = user.user_name;
    db!.rawQuery("UPDATE user SET user_hard_score = '$hardLevelScore' WHERE user_name = '$userName'");
  }
  Future<List<int>> getUserScore(User user) async {
    var db = await DatabaseHelper.dbHelper();
    String id = user.user_name;
    //print(id);

    List<Map<String, dynamic>> maps = await db!.rawQuery(
        "SELECT * FROM user WHERE user_name = '$id'");
    List<int> scores = [maps[0]['user_easy_score'],maps[0]['user_medium_score'],maps[0]['user_hard_score']];
    return scores;
  }
}