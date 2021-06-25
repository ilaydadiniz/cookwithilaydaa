import 'package:flutter/material.dart';
import 'package:cookwithilayda/mainpage/hamburger.dart';

class YemekListe extends StatefulWidget {
  @override
  _YemekListeState createState() => _YemekListeState();
}

class _YemekListeState extends State<YemekListe> {
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
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HamburgerScreen(
                          "assets/images/hamburger.png",
                          "2 saat",
                          "Hamburger",
                          "Popüler")));
                },
                child: yemekKarti("assets/images/hamburger.png", "2 saat",
                    "Hamburger", "Popüler"),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                child: yemekKarti("assets/images/spagetti.png", "1 saat",
                    "Spagetti", "Popüler"),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                child: yemekKarti("assets/images/donut.png", "Yarım Saat",
                    "Donat", "Popüler"),
              ),
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
            "Detaylar",
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
            "Ayın popüler ve en çok tıklanan yemekleri burada !",
            style: TextStyle(
              fontFamily: "PlayfairDisplay",
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }

  yemekKarti(
    String imgPath,
    String sure,
    String yemekAdi,
    String yemekTuru,
  ) {
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
                      ? Icon(Icons.favorite_border)
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
