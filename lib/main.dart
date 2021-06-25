import 'package:flutter/material.dart';
import 'package:cookwithilayda/login/login.dart';
import 'package:cookwithilayda/mainpage/mainpage.dart';
import 'package:cookwithilayda/login/signup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1080, 1920),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: First(),
      ),
    );
  }
}

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //app bar ve body içerir
        backgroundColor: Colors.pinkAccent,
        body: SafeArea(
          child: Center(
            child: Column(
              //children içerir birden fazla widget
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                  maxRadius: 70.0,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/images/suşi.jpg"),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Cook With İlayda',
                  style: TextStyle(
                    fontFamily: 'Sacramento',
                    fontSize: 45,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  minWidth: (200.0), //genişlik
                  height: 50, //yükseklik
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(40)),
                  child: Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  minWidth: (200.0), //genişlik
                  height: 50, //yükseklik
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignupPage()));
                  },
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(40)),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
