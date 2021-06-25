import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_outlined),
          color: Colors.pink,
        ),
        title: Text(
          "Cook With İlayda",
          style: TextStyle(
              fontFamily: "Sacramento", fontSize: 40, color: Colors.black),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Row(
              children: [
                Icon(
                  Icons.assignment_outlined,
                  color: Colors.pink,
                ),
                SizedBox(
                  height: 35,
                ),
                Text(
                  "Food Categories",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildAccountOptionRow(context, "Çorba"),
            buildAccountOptionRow(context, "Et"),
            buildAccountOptionRow(context, "Balık"),
            buildAccountOptionRow(context, "Tavuk"),
            buildAccountOptionRow(context, "Sebze"),
            buildAccountOptionRow(context, "Salata"),
            buildAccountOptionRow(context, "Tatlı"),
            buildAccountOptionRow(context, "İçecekler"),
            buildAccountOptionRow(context, "Soslar"),
          ],
        ),
      ),
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onDoubleTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog();
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_outlined,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
