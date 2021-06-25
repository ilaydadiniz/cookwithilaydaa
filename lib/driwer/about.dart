import 'package:flutter/material.dart';
import 'package:cookwithilayda/mainpage/mainpage.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          color: Colors.pink,
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
      body: Container(
        child: ListView(
          padding: EdgeInsets.only(left: 30, top: 25, right: 30),
          children: [
            Text(
              "Hakkımızda",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                  color: Colors.pink),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, top: 25, right: 16),
              child: Text(
                " Tüketicilerimizle ve tariflerimizle kurduğumuz güven bağını, gastronomi kültürü ve eğitimi ile harmanlayarak bu kültürü paylaşmayı ve yaygınlaştırmayı hedefliyoruz.",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, top: 25, right: 16),
              child: Text(
                " Günümüzün şeflerini desteklemenin yanında, gelecekte ülkemizi gastronomi kültüründe temsil edecek ve katkı sağlayacak yarının şeflerini de destekliyoruz.",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, top: 25, right: 16),
              child: Text(
                " Gastronomi dünyasının dijital buluşma noktasına hoş geldiniz...",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, top: 25, right: 16),
              child: Text(
                " Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen 3301456 kodlu MOBİL PROGRAMLAMA dersi kapsamında 193311031 numaralı İlayda Diniz tarafından 25 Haziran 2021 günü yapılmıştır.",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
