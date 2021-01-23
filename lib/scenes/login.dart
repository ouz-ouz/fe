import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mhp_app/app.dart';
import 'package:mhp_app/scenes/register.dart';

String mail,pass;
void main() => runApp(LoginApp());
FirebaseAuth auth = FirebaseAuth.instance;
TextEditingController emailcont = TextEditingController();
TextEditingController passcont = TextEditingController();


class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Challenge',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  // f45d27
  // f5851f
String mail,pass;
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(auth.currentUser!=null){ // Eğer kullanıcı daha önce oturum açmış ise giriş yapar
      debugPrint("Kullanıcı oturum açmış");
      Navigator.pushReplacement(
        //Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyApp()),
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE53935),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFE53935), Color(0xFFB71C1C)],
                  ),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(90))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Image.network(
                      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2F9%2F99%2FMHP_logo_Turkey.png%2F1200px-MHP_logo_Turkey.png&f=1&nofb=1",
                      width: 80,
                      height: 80,
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 32, right: 32),
                      child: Text(
                        'Giriş',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2.2,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 30),
              child: Column(
                children: <Widget>[
                 Form(
                   child: Column(
                     children: <Widget>[
                       Container(
                         width: MediaQuery.of(context).size.width / 1.2,
                         height: 45,
                         padding:
                         EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.all(Radius.circular(50)),
                             color: Colors.white,
                             boxShadow: [
                               BoxShadow(color: Colors.black12, blurRadius: 5)
                             ]),
                         child: TextFormField(
                           controller: emailcont,
                           decoration: InputDecoration(
                             border: InputBorder.none,
                             icon: Icon(
                               Icons.email,
                               color: Colors.grey,
                             ),
                             hintText: 'E-posta',
                           ),
                         ),
                       ),
                       Container(
                         width: MediaQuery.of(context).size.width / 1.2,
                         height: 45,
                         margin: EdgeInsets.only(top: 22),
                         padding:
                         EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.all(Radius.circular(50)),
                             color: Colors.white,
                             boxShadow: [
                               BoxShadow(color: Colors.black12, blurRadius: 5)
                             ]),
                         child: TextFormField(
                           controller: passcont,
                           autofocus: false,
                           obscureText: true, //girilen kelimeler gizlenir **** vb
                           decoration: InputDecoration(
                             border: InputBorder.none,
                             icon: Icon(
                               Icons.vpn_key,
                               color: Colors.grey,
                             ),
                             hintText: 'Şifre',
                           ),

                         ),
                       ),
                     ],

                   ),

                 ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16, right: 10),
                      child: Text(
                        'şifrenizi mi unuttunuz ?',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Spacer(),
                  //google vs
                  Spacer(),
                  Container(
                    padding: const EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 4),
                    height: 45,
                    width: MediaQuery.of(context).size.width / 1.3,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFE53935), Color(0xFFE53935)],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: MaterialButton(
                      onPressed: (){
                        login(emailcont.text.toString().replaceAll(' ', ''), passcont.text.toString());
                      },
                      child: Text(
                        'Giriş',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: const EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 4),
                    height: 45,
                    width: MediaQuery.of(context).size.width / 1.3,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFE53935), Color(0xFFE53935)],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: MaterialButton(//Register a yönlendirir
                      onPressed: (){
                        Navigator.pushReplacement(
                          //Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterApp()),
                        );
                      },
                      child: Text(
                        'Kayıt Ol',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  login(String mail,String pass) async {
    try {
        User _loginUser = (await auth.signInWithEmailAndPassword(email: mail, password: pass)).user;
        Fluttertoast.showToast(
            msg: "Giriş Yapıldı",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        Navigator.pushReplacement(
          //Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyApp()),
        );
      }
    catch(e){
      Fluttertoast.showToast(
          msg: "E-posta veya Şifre Yanlış! \n"+e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.red,
          fontSize: 16.0
      );

    }

    }

}
