import 'package:cookwithilayda/contact/contactus.dart';
import 'package:cookwithilayda/health/health.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cookwithilayda/driwer/about.dart';

import 'package:cookwithilayda/model/api.dart';
import 'package:cookwithilayda/mainpage/favori.dart';
import 'package:cookwithilayda/driwer/men%C3%BC.dart';
import 'package:cookwithilayda/driwer/profil.dart';
import 'package:cookwithilayda/rate/rate.dart';
import 'package:cookwithilayda/driwer/settings.dart';
import 'package:cookwithilayda/kitchens/t%C3%BCrk.dart';
import 'package:cookwithilayda/mainpage/yemek.dart';
import 'package:cookwithilayda/recipebook/userguide.dart';
import 'package:cookwithilayda/screens/recipe_list.dart';

import '../kitchens/asya.dart';
import '../kitchens/fransız.dart';
import '../kitchens/türk.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> drawerKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FavoriPage()));
              },
              icon: Icon(
                Icons.favorite,
                color: Colors.pink,
              ))
        ],
        title: Text(
          "Cook With İlayda",
          style: TextStyle(
              fontFamily: "Sacramento", fontSize: 40, color: Colors.black),
        ),
      ),
      key: drawerKey,
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,

          children: <Widget>[
            DrawerHeader(
              child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage("assets/images/icon.png"),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MenuPage()));
              },
              leading: Icon(Icons.menu_book, color: Colors.pink),
              title: Text("Menu"),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              leading: Icon(Icons.person, color: Colors.pink),
              title: Text("Your Profile"),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              },
              leading: Icon(Icons.settings, color: Colors.pink),
              title: Text("Settings"),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => AboutPage()));
              },
              leading: Icon(Icons.label, color: Colors.pink),
              title: Text("About"),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => App()));
              },
              leading: Icon(Icons.star_border_outlined, color: Colors.pink),
              title: Text("Rate us!"),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => ContactUs()));
              },
              leading: Icon(Icons.add_call, color: Colors.pink),
              title: Text("Contact Us"),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => health()));
              },
              leading: Icon(Icons.accessibility, color: Colors.green[400]),
              title: Text("Health"),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 15.0,
          ),
          header(),
          SizedBox(
            height: 10,
          ),
          TabBarr()
        ],
      ),
    );
  }

  Widget header() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15.0, left: 5.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 30),
              child: Text(
                "Favori Yemekler",
                style: TextStyle(fontFamily: "PlayfairDisplay", fontSize: 30),
              ),
            ),
          ],
        ),
      ],
    );
  }

  drawer() {
    return Container();
  }
}

class TabBarr extends StatefulWidget {
  @override
  _TabBarrState createState() => _TabBarrState();
}

class _TabBarrState extends State<TabBarr> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: tabController,
          indicatorColor: Colors.pink.shade300,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black,
          isScrollable: true,
          tabs: <Widget>[
            Tab(
              child: Text(
                "Popüler",
                style: TextStyle(fontFamily: "PlayfairDisplay", fontSize: 15),
              ),
            ),
            Tab(
              child: Text(
                "Asya Mutfağı",
                style: TextStyle(fontFamily: "PlayfairDisplay", fontSize: 15),
              ),
            ),
            Tab(
              child: Text(
                "Fransız Mutfağı",
                style: TextStyle(fontFamily: "PlayfairDisplay", fontSize: 15),
              ),
            ),
            Tab(
              child: Text(
                "Türk Mutfağı",
                style: TextStyle(fontFamily: "PlayfairDisplay", fontSize: 15),
              ),
            ),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height - 200,
          child: TabBarView(
            controller: tabController,
            children: [
              YemekListe(),
              Asya(),
              Fransiz(),
              Turk(),
            ],
          ),
        ),
      ],
    );
  }
}
