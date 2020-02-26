import 'dart:async';

import 'package:ansar_portfolio/shake_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  ShakeController _shakeController;
  Timer _timer;
  @override
  void initState() {
    _shakeController = ShakeController(vsync: this);
    _timer = Timer.periodic(Duration(seconds: 1), (e) {
      _shakeController.shake();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: 200,
                  width: 200,
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/profile.jpg'),
                        fit: BoxFit.cover,
                      ))),
              Text(
                "Hi there, My name is",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 30,
                  color: Colors.grey,
                ),
              ),
              Text(
                "Ansar C.A",
                textAlign: TextAlign.center,
                style: GoogleFonts.rancho(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Apple iOS application developer in Swift.\nGoogle developer expert for Flutter, Dart.",
                textAlign: TextAlign.center,
                style: GoogleFonts.rancho(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ShakeView(
                    child: IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.facebook,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          _launchURL("https://www.facebook.com/anzar.ca");
                        }),
                    controller: _shakeController,
                  ),
                  ShakeView(
                    controller: _shakeController,
                    child: IconButton(
                        icon: FaIcon(FontAwesomeIcons.instagram,
                            color: Colors.white),
                        onPressed: () {
                          _launchURL(
                              "https://instagram.com/anzarazees?r=nametag");
                        }),
                  ),
                  ShakeView(
                    controller: _shakeController,
                    child: IconButton(
                        icon: FaIcon(FontAwesomeIcons.linkedinIn,
                            color: Colors.white),
                        onPressed: () {
                          _launchURL(
                              "http://linkedin.com/in/ansar-c-a-23a025131");
                        }),
                  ),
                  ShakeView(
                    controller: _shakeController,
                    child: IconButton(
                        padding: EdgeInsets.all(5),
                        icon: FaIcon(FontAwesomeIcons.twitter,
                            color: Colors.white),
                        onPressed: () {
                          _launchURL("https://twitter.com/Anzar_azees");
                        }),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
