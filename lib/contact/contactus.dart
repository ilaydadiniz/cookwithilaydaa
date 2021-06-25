import 'package:cookwithilayda/driwer/grafik.dart';
import 'package:cookwithilayda/model/api.dart';
import 'package:cookwithilayda/recipebook/userguide.dart';

import 'package:cookwithilayda/screens/recipe_list.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
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
                  "Bize ulaşın!",
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
            SizedBox(height: 10.0),
            ListTile(
              leading: Icon(Icons.cloud_queue_sharp),
              title: Text(
                "Nasıl tarif ekleyebilirim ?",
                style: TextStyle(fontSize: 18.0),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return FileDownloadView();
                  }),
                );
              },
            ),
            SizedBox(height: 10.0),
            ListTile(
              leading: Icon(Icons.book_outlined),
              title: Text(
                "Tarif ekleyin!",
                style: TextStyle(fontSize: 18.0),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return RecipeList();
                  }),
                );
              },
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              leading: Icon(
                Icons.addchart_outlined,
              ),
              title: Text(
                "Personel Listemiz",
                style: TextStyle(fontSize: 18.0),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Api();
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
