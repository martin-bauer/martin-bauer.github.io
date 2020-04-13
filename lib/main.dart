import 'package:flutter/material.dart';
import 'package:bama1033pages/services/calls_and_messages_service.dart';
import 'package:bama1033pages/services/service_locator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;

void main() {
  setupLocator();
  runApp(MyApp());
}

//_launchURL() async {
//  const url = 'https://flutter.io';
//  if (await canLaunch(url)) {
//    await launch(url);
//  } else {
//    throw 'Could not launch $url';
//  }
//}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Martinez`s Page',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: MyHomePage(title: 'Martin Bauers Page'),
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
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();

  @override
  Widget build(BuildContext context) {
    BoxDecoration myBoxDecoration() {
      return BoxDecoration(
        border: Border.all(color: Colors.black87, width: 20),
        borderRadius: BorderRadius.all(
            Radius.circular(300.0) //         <--- border radius here
            ),
      );
    }

    void _onSearchButtonPressed() {
      print("search button clicked");
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: new Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: AssetImage('imgs/psx.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  decoration: new BoxDecoration(
                    backgroundBlendMode: BlendMode.xor,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
//                      stops: [
//                        0.1,
//                        0.8,
//                        0.1
//                      ],
                      colors: [
                        new Color.fromRGBO(40, 40, 45, 0.01),
                        Colors.black87,
//                        new Color.fromRGBO(40, 40, 45, 0.2)
                      ],
//                      tileMode: TileMode
//                          .repeated, // repeats the gradient over the canvas
                    ),
                  ),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        new Container(
                          margin: const EdgeInsets.all(30.0),
                          decoration: myBoxDecoration(),
                          child: CircleAvatar(
                              radius: 100,
                              backgroundImage: AssetImage('imgs/psxme2.png')),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Hey, ich  bin Martin',
                            style: GoogleFonts.lato(
                                fontSize: 30, color: Colors.white),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'und ich mache was ich will',
                            style: GoogleFonts.lato(
                                fontSize: 30, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: IconButton(
                                  icon: Icon(Icons.code),
                                  color: Colors.white70,
                                  iconSize: 50.0,
                                  onPressed: () {
                                    html.window.open('https://github.com/bama1033', 'Github/bama1033');
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: IconButton(
                                  icon: Icon(Icons.mail),
                                  iconSize: 50,
                                  color: Colors.white70,
                                  onPressed: () {
                                    _service.sendEmail();
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.white70,
                                  size: 50.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Icon(
                                  Icons.build,
                                  color: Colors.white70,
                                  size: 50.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 162.0, bottom: 32.0),
                          child: RichText(
                            text: TextSpan(
                                text: 'Made with Flutter',
                                style: GoogleFonts.lato(
                                    fontSize: 10, color: Colors.white70)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
