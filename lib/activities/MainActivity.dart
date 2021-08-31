import 'dart:html' as html;

import 'package:bama1033pages/extensions/hover_extensions.dart';
import 'package:bama1033pages/widget/paddinged_iconbutton.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool pressed = false;
  int counter = 0;
  String avatarIcon = 'imgs/psxme2.png';

  // TODO
  // https://flutter.dev/docs/development/ui/animations/staggered-animations
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
//    print('data: $media'); Debugging
    double iconsize = 50.0;
    double marginIconsHorizontal = 35.0;
    double marginIconsVertical = 20.0;
    double marginVerticalAvatar = 50.0;
    double fontSize = 30.0;


    if (media.size.width < 960) {
      iconsize = 30.0;
      marginIconsHorizontal = 10.0;
      marginIconsVertical = 0.0;
      fontSize = 20.0;
      marginVerticalAvatar = 120.0;
    }
    if (media.size.width < 485) {
      iconsize = 25.0;
      marginIconsHorizontal = 4.0;
      marginIconsVertical = 0.0;
      fontSize = 18.0;
      marginVerticalAvatar = 70.0;
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
                        new GestureDetector(
                          onTap: () {
                            setState(() {
                              counter = counter + 1;
                              switch (counter) {
                                case 0:
                                  avatarIcon = 'imgs/psxme2.png';
                                  break;
                                case 1:
                                  avatarIcon = 'imgs/me4.png';
                                  break;
                                case 2:
                                  avatarIcon = 'imgs/me6.png';
                                  break;
                                default:
                                  avatarIcon = 'imgs/psxme2.png';
                                  counter = 0;
                              }
/*
                                    counter = counter + 1;
                                    switch(counter) {
                                      case 0: avatarIcon = 'imgs/psxme2.png'; break;
                                      case 1: avatarIcon = 'imgs/me6.png';break;
                                      case 2: avatarIcon = 'imgs/me6.png'; break;
                                      default: counter = 0;
                                    */


                            });
                          },
                          child: Container(
                            margin:
                            EdgeInsets.symmetric(
                                vertical: marginVerticalAvatar),
                            decoration: myBoxDecoration(),
                            child: CircleAvatar(
                                radius: 100,
                                backgroundImage: AssetImage(avatarIcon)),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Hey, ich bin Martin\n '
                                'und ich mache was ich will',
                            style: TextStyle(
                              fontSize: fontSize,
                              color: Colors.white,
                              fontFamily: 'Ubuntu',
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: marginIconsHorizontal),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              PIconButton(
                                  marginIconsHorizontal,
                                  marginIconsVertical,
                                  iconsize + 10,
                                  Icons.code,
                                  "Github",
                                  context),
                              PIconButton(
                                  marginIconsHorizontal,
                                  marginIconsVertical,
                                  iconsize,
                                  Icons.work,
                                  "LinkedIn",
                                  context),
                              PIconButton(
                                  marginIconsHorizontal,
                                  marginIconsVertical,
                                  iconsize,
                                  Icons.mail,
                                  "Mail",
                                  context),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: marginIconsHorizontal,
                                    vertical: marginIconsVertical),
                                child: Tooltip(
                                  message: '<3',
                                  child: IconButton(
                                    icon: Icon(Icons.favorite),
                                    iconSize: iconsize + 10,
                                    color:
                                    pressed ? Colors.redAccent : Colors.white70,
                                    onPressed: () {
                                      setState(() {
                                        pressed = !pressed;
                                      });
                                    },
                                  ).showCursorOnHover.elevateUpOnHover,
                                ),
                              ),
                              Hero(
                                tag: 'Document',
                                child: Container(
                                  child: Material(
                                    borderOnForeground: true,
                                    color: Color.fromRGBO(255, 255, 255, 0.0),
                                    // shadowColor: Color.fromRGBO(9, 9, 9, 1.0),
                                    child: PIconButton(
                                        marginIconsHorizontal,
                                        marginIconsVertical,
                                        iconsize,
                                        Icons.description,
                                        "CV",
                                        context),
                                  ),
                                ),
                              ),
                              PIconButton(
                                  marginIconsHorizontal,
                                  marginIconsVertical,
                                  iconsize,
                                  Icons.build,
                                  "WIP",
                                  context),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            html.window
                                .open('https://flutter.dev/web',
                                'flutter.dev/web');
                          },
                          child: Container(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              'Made by me with Flutter',
                              style: TextStyle(
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
