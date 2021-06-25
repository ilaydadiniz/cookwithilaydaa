import 'package:flutter/material.dart';

class Turk extends StatefulWidget {
  @override
  _TurkState createState() => _TurkState();
}

class _TurkState extends State<Turk> {
  bool begenildiMi = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 15,
        ),
        Container(
          height: 300,
          child: ListView(
            padding: EdgeInsets.only(left: 20),
            scrollDirection: Axis.horizontal,
            children: [
              yemekKarti(
                  "assets/images/adana1.png", "2 Saat", "Adana Kebap", "Türk"),
              SizedBox(
                width: 20,
              ),
              yemekKarti(
                  "assets/images/pide.png", "1 Saat", "Kıymalı Pide", "Türk"),
              SizedBox(
                width: 20,
              ),
              yemekKarti(
                  "assets/images/baklava.png", "2 Saat", "Baklava", "Türk"),
              SizedBox(
                width: 20,
              ),
              yemekKarti(
                  "assets/images/mantı.png", "1,5 Saat ", "Mantı", "Türk"),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Text(
            "Türk Mutfağı Detayları",
            style: TextStyle(
                fontSize: 20,
                fontFamily: "PlayfairDisplay",
                color: Colors.pink[500]),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
              " Orta Asya ve Anadolu topraklarının sunduğu ürünlerdeki çeşitlilik, uzun bir tarihsel süreç boyunca birbirinden farklı birçok kültürle yaşanan etkileşim, Selçuklu ve Osmanlı gibi imparatorlukların saraylarında gelişen yeni tatlar, Türk mutfak kültürünün yeni yapısını kazanmasında rol oynamıştır. ",
              style: TextStyle(
                fontFamily: "PlayfairDisplay",
                fontSize: 15,
              )),
        )
      ],
    );
  }

  yemekKarti(String imgPath, String sure, String yemekAdi, String yemekTuru) {
    return Container(
      height: 325,
      width: 225,
      child: Container(
        height: 250,
        width: 225,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade200),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15.0, top: 10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Süre:",
                        style: TextStyle(
                            fontFamily: "PlayfairDisplay",
                            fontSize: 15,
                            color: Colors.grey.shade900),
                      ),
                      Text(sure,
                          style: TextStyle(
                              fontFamily: "PlayfairDisplay",
                              fontSize: 16,
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            Image(
              image: AssetImage(imgPath),
              fit: BoxFit.contain,
              height: 130.0,
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      yemekAdi + "\n" + yemekTuru,
                      style: TextStyle(
                          fontFamily: "PlayfairDisplay",
                          color: Colors.grey.shade700,
                          fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                IconButton(
                  icon: begenildiMi
                      ? Icon(Icons.favorite)
                      : Icon(Icons.favorite_border_outlined),
                  onPressed: () {
                    if (begenildiMi == true) {
                      setState(() {
                        begenildiMi = false;
                      });
                    } else {
                      setState(() {
                        begenildiMi = true;
                      });
                    }
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
