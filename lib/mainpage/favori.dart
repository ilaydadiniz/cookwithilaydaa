import 'package:flutter/material.dart';

class FavoriPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Colors.pink,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            "Cook With İlayda",
            style: TextStyle(
                fontFamily: "Sacramento", fontSize: 40, color: Colors.black),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  size: 24.0,
                  color: Colors.black,
                ),
              ),
              Text(
                "Favorileriniz Boş",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.pink,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
