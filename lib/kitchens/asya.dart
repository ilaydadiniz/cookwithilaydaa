import 'package:flutter/material.dart';

class Asya extends StatefulWidget {
  @override
  _AsyaState createState() => _AsyaState();
}

class _AsyaState extends State<Asya> {
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
                  "assets/images/noodle.png", "1,5 saat", "Noodle", "Asya"),
              SizedBox(
                width: 20,
              ),
              yemekKarti(
                  "assets/images/kimchi.png", "1 saat", "Kimchi", "Asya"),
              SizedBox(
                width: 20,
              ),
              yemekKarti(
                  "assets/images/tofu.png", "Yarım Saat", "Tofu", "Asya"),
              SizedBox(
                width: 20,
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
            "Asya Mutfağı Detayları",
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
              "Bilinen en eski mutfaklardan biri olan ‘Asya Mutfağı’nın hemen hemen 5 bin yılı aşan bir tarihi vardır. "
              " Asya mutfağı Çin, Kore, Japonya, Tayland ve Bangkok’u içine alan geniş bir kültürdür. Temelini pirinç ve çorbaların oluşturduğu bu mutfakta ana felsefe az malzemeyi en iyi şekilde değerlendirmektir. ",
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
