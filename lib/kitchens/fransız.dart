import 'package:flutter/material.dart';

class Fransiz extends StatefulWidget {
  @override
  _FransizState createState() => _FransizState();
}

class _FransizState extends State<Fransiz> {
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
              yemekKarti("assets/images/kruvasan.png", "1 saat", "Kruvasan",
                  "Fransız"),
              SizedBox(
                width: 20,
              ),
              yemekKarti("assets/images/fransiz1.png", "45 dakika", "Brulee",
                  "Fransız"),
              SizedBox(
                width: 20,
              ),
              yemekKarti(
                  "assets/images/makaron.png", "2 Saat", "Tofu", "Fransız"),
              SizedBox(
                width: 20,
              ),
              yemekKarti("assets/images/mousse.png", "30 dakika ", "Mousse",
                  "Fransız"),
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
            "Fransız Mutfağı Detayları",
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
              "Fransız mutfağının kökleri Orta Çağlara dek gider ancak Fransız Devrimi ve sonrasında yaşanan kolonileşme süreci Fransız mutfak kültürü ve bu kültürün dünyaya yayılmasında büyük rol oynamıştır. Geleneksel olarak Fransa’nın her bölgesinin kendine has bir mutfağı vardır. Fransız mutfak tarzları ‘Haute mutfağı’, ‘Klasik mutfak’ ve ‘Yeni mutfak’ olarak üçe ayrılır.",
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
