import 'package:cookwithilayda/driwer/grafik.dart';
import 'package:flutter/material.dart';

import 'foodcalories.dart';

class health extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Cook With Health",
          style: TextStyle(
              fontFamily: "Sacramento", fontSize: 50, color: Colors.green[300]),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "Health",
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
                SizedBox(
                  width: 8,
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 1.5,
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              leading: Icon(
                Icons.addchart_outlined,
              ),
              title: Text(
                "Calorie Graphic",
                style: TextStyle(fontSize: 18.0),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return BarChartSample1();
                  }),
                );
              },
            ),
            SizedBox(height: 10.0),
            ListTile(
              leading: Icon(Icons.cloud_queue_sharp),
              title: Text(
                "Food Calories",
                style: TextStyle(fontSize: 18.0),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return FoodCalories();
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
