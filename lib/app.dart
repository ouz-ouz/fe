import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mhp_app/scenes/home.dart';
import 'package:mhp_app/scenes/notification.dart';
import 'package:mhp_app/scenes/profile.dart';
import 'package:mhp_app/scenes/login.dart';
import 'package:mhp_app/scenes/message.dart';
import 'scenes/alparslan_turkes.dart';
import 'scenes/turkes_hayati.dart';

void main() => runApp(MyApp());
FirebaseAuth auth = FirebaseAuth.instance;

/// This is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: "MHP App",
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);
FirebaseAuth auth = FirebaseAuth.instance;
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    }
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(2.0),
          //LOGO Gelecek
          child: new Image.network('https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2F9%2F99%2FMHP_logo_Turkey.png%2F1200px-MHP_logo_Turkey.png&f=1&nofb=1'),
        ),
        backgroundColor: Colors.red[600],
        actions: <Widget>[
          PopupMenuButton<String>(
            icon: Icon(Icons.table_rows_rounded),
            color: Colors.white,
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'BAŞBUĞ','GENEL BAŞKAN','Ayarlar','Çıkış Yap' }.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),

      body: new Container(
        child: Selector(_selectedIndex),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.red),
            label: 'Anasayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications,color: Colors.red),
            label: 'Bildirimler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message,color: Colors.red),
            label: 'Mesajlar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,color: Colors.red),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red[900],
        onTap: _onItemTapped,
      ),


    );
  }

  Selector(index) {
    //Fonksiyonun olduğu yere diğer sayfalardaki widgetleri getirir !!!
    if(index==0) return HomePage();
    else if(index==1) return NotificationPage();
    else if(index==2) return MessagePage();
    else return ProfilePage();

  }
  void handleClick(String value) { // Popup menü ayarları
    switch (value) {
      case 'BAŞBUĞ':
      Navigator.pushReplacement(
      //Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Turkes_Dashboard()),        
      );
        break;
      case 'GENEL BAŞKAN':


        break;
      case 'Ayarlar':


        break;
      case 'Çıkış Yap':
        auth.signOut();
        Navigator.pushReplacement(
          //Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginApp()),
        );
        break;
    }
  }
}
