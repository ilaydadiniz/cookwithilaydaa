import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HamburgerScreen extends StatelessWidget {
  final String imgPath;
  final String sure;
  final String yemekAdi;
  final String yemekTuru;

  const HamburgerScreen(this.imgPath, this.sure, this.yemekAdi, this.yemekTuru);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            Hero(
              child: Container(
                height: size.height * 0.55,
                child: Image.asset(
                  imgPath,
                  fit: BoxFit.cover,
                ),
              ),
              tag: imgPath,
            ),
            DraggableScrollableSheet(
              maxChildSize: 1,
              initialChildSize: 0.6,
              minChildSize: 0.6,
              builder: (context, controller) {
                return SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    height: 800,
                    decoration: BoxDecoration(
                      color: Colors.pink[100],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            Text(
                              "Ağız Sulandıran Hamburger Tarifi",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500),
                            ),
                            Spacer(),
                            IconButton(
                              icon: Icon(Icons.favorite),
                              color: Colors.redAccent,
                              iconSize: 30,
                              onPressed: () {},
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: Colors.grey[300])),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: Colors.grey[300])),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: Colors.grey[300])),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Tarif Hakkında",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "1. Yaptığımız hamburger ekmeklerini eşit bir şekilde ikiye bölelim ve iç taraflarını tost makinesinde hafif kızartalım.",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "2. Ardından ekmeğin bir parçasına mayonezi diğer parçasına hardalı sürelim.",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "3. Bir tavaya pişen veya pişmeye yakın olan köftelerin üzerine birer kare parça cheddar peyniri koyup ısı ile erimesini sağlayalım.",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "4. Ekmeğin alt kısmına marulu, domatesi ve turşuyu koyalım.",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "5. Ardından üzerine erimiş olan peynirli köfteyi de koyalım.",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "6. En son üzerine yapmış olduğumuz karamelize soğanı da koyup diğer parçayı da ekleyip servis edelim.",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
