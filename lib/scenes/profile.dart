import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mhp_app/main.dart';

String ad=FirebaseAuth.instance.currentUser.displayName.toString();
String email=FirebaseAuth.instance.currentUser.email.toString();

class ProfilePage extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 0),//Kenar Boşluğu
        child: Container(
          color: Colors.redAccent[700],
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 60),

              CircleAvatar(
                backgroundImage: NetworkImage("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftherapidian.org%2Fsites%2Fdefault%2Ffiles%2Farticle_images%2Fjamesperson.jpg&f=1&nofb=1"),
                radius: 80,
              ),
              SizedBox(height: 10),
              Text(
                ad,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,

                ),
              ),
              SizedBox(height: 3),
              Text(
                email,
                style: TextStyle(),
              ),
              Text(
                "Bilgiler",
                style: TextStyle(),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FlatButton(
                    child: Icon(
                      Icons.message,
                      color: Colors.white,
                    ),
                    color: Colors.grey,
                    onPressed: () {},
                  ),
                  SizedBox(width: 10),
                  FlatButton(
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                    color: Theme.of(context).accentColor,
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  ],
                ),
              ),
              SizedBox(height: 20),

              GridView.builder(//Buraya ilgili haberler eklenecek
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                primary: false,
                padding: EdgeInsets.all(5),
                itemCount: 15,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 200 / 200,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Image.network("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftherapidian.org%2Fsites%2Fdefault%2Ffiles%2Farticle_images%2Fjamesperson.jpg&f=1&nofb=1")
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}