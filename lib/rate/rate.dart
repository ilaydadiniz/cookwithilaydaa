import 'package:flutter/material.dart';
import 'package:cookwithilayda/mainpage/mainpage.dart';
import 'package:cookwithilayda/rate/rateing.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter Rating Control",
        home: RatingsPage());
  }
}

class RatingsPage extends StatefulWidget {
  @override
  _RatingsPage createState() => _RatingsPage();
}

class _RatingsPage extends State<RatingsPage> {
  int _rating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomePage()));
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Rating((rating) {
              setState(() {
                _rating = rating;
              });
            }, 5),
            SizedBox(
                height: 44,
                child: (_rating != null && _rating != 0)
                    ? Text("You selected $_rating rating",
                        style: TextStyle(fontSize: 18))
                    : SizedBox.shrink())
          ],
        ),
      ),
    );
  }
}
