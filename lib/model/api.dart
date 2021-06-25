import 'package:flutter/material.dart';
import 'package:cookwithilayda/driwer/men%C3%BC.dart';
import 'package:cookwithilayda/mainpage/mainpage.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

const titleStyle = TextStyle(fontSize: 20);
const subTitleStyle = TextStyle(fontSize: 18);

class Api extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pink,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final url = Uri.parse('https://reqres.in/api/users');
  int counter;
  var personalResult;

  Future callPerson() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var result = personalFromJson(response.body);
        print(result.data[0].avatar);
        print(result.data[0].email);
        print(result.data[0].firstName);
        print(result.data[0].lastName);
        if (mounted)
          setState(() {
            counter = result.data.length;
            personalResult = result;
          });
        return result;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    callPerson();
  }

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
          "Personel Listesi",
          style: TextStyle(
              fontFamily: "PlayfairDisplay", fontSize: 30, color: Colors.black),
        ),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: counter != null
                ? ListView.builder(
                    itemCount: counter,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          personalResult.data[index].firstName +
                              ' ' +
                              personalResult.data[index].lastName,
                          style: titleStyle,
                        ),
                        subtitle: Text(
                          personalResult.data[index].email,
                          style: subTitleStyle,
                        ),
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(personalResult.data[index].avatar),
                        ),
                      );
                    })
                : Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
