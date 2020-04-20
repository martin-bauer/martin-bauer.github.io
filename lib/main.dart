import 'package:flutter/material.dart';
import 'package:bama1033pages/services/calls_and_messages_service.dart';
import 'package:bama1033pages/services/service_locator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;
import 'package:bama1033pages/extensions/hover_extensions.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Martinez`s Page',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
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
    var media = MediaQuery.of(context);
//    print('data: $media');
    double iconsize = 50.0;
    double marginIconsHorizontal = 35.0;
    double marginIconsVertical = 20.0;
    double marginVerticalAvatar = 50.0;
    double fontSize = 30.0;

    if (media.size.width < 650) {
      iconsize = 30.0;
      marginIconsHorizontal = 10.0;
      marginIconsVertical = 60.0;
      fontSize = 20.0;
      marginVerticalAvatar = 100.0;
    }

    BoxDecoration myBoxDecoration() {
      return BoxDecoration(
        border: Border.all(color: Colors.black54, width: 20),
        borderRadius: BorderRadius.all(
            Radius.circular(300.0) //         <--- border radius here
            ),
      );
    }

    return Scaffold(
//        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            new Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('imgs/psxx.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(40, 40, 45, 0.01),
                        Colors.black87,
                      ],
                    ),
                  ),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        new Container(
                          margin:
                              EdgeInsets.symmetric(vertical: marginVerticalAvatar),
                          decoration: myBoxDecoration(),
                          child: CircleAvatar(
                              radius: 100,
                              backgroundImage: AssetImage('imgs/psxme2.png')),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Hey, ich  bin Martin\n '
                                'und ich mache was ich will',
                            style: GoogleFonts.lato(
                              fontSize: fontSize,
                              color: Colors.white,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: marginIconsHorizontal),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: marginIconsHorizontal, vertical:marginIconsVertical),

                                child: IconButton(
                                  icon: Icon(Icons.code),
                                  color: Colors.white70,
                                  iconSize: iconsize + 10,
                                  onPressed: () {
                                    html.window.open(
                                        'https://github.com/bama1033',
                                        'Github/bama1033');
                                  },
                                ).showCursorOnHover.elevateUpOnHover,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: marginIconsHorizontal, vertical:marginIconsVertical),
                                child: IconButton(
                                  icon: Icon(Icons.mail),
                                  iconSize: iconsize,
                                  color: Colors.white70,
                                  onPressed: () {
                                    _service.sendEmail();
                                  },
                                ).showCursorOnHover.elevateUpOnHover,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: marginIconsHorizontal, vertical:marginIconsVertical),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.white70,
                                  size: iconsize,
                                ).elevateUpOnHover,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: marginIconsHorizontal, vertical:marginIconsVertical),
                                child: Icon(
                                  Icons.build,
                                  color: Colors.white70,
                                  size: iconsize,
                                ).elevateUpOnHover,
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            html.window.open(
                                'https://flutter.dev/web', 'flutter.dev/web');
                          },
                          child: Container(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              'Made by me with Flutter',
                              style: GoogleFonts.lato(
                                  fontSize: 10, color: Colors.white70),
                            ),
                          ),
                        ).showCursorOnHover.elevateUpOnHover,
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
