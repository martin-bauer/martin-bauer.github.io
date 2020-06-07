import 'package:flutter/material.dart';
import 'package:bama1033pages/services/calls_and_messages_service.dart';
import 'package:bama1033pages/services/service_locator.dart';
import 'package:bama1033pages/extensions/hover_extensions.dart';
import 'dart:html' as html;
import 'package:toast/toast.dart';

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
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Ubuntu',
      ),
      home: new Scaffold(
        body: MyHomePage(title: 'Martin Bauers Page'),
        bottomNavigationBar: Stack(
          children: [
            new Container(
              height: 100.0,
              color: Colors.green,
//              color: Color(0x00000000)
            ),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 35,
                  vertical: 35),
              child: IconButton(
                icon: Icon(Icons.code),
                color: Colors.white70,
                iconSize: 50,
                onPressed: () {
                  html.window.open(
                      'https://github.com/bama1033',
                      'Github/bama1033');
                },
              ).showCursorOnHover.elevateUpOnHover,
            ),
          ],
        ),
//            Positioned(
//              left: 0.0,
//              right: 0.0,
//              top: 0.0,
//              bottom: 0.0,
////              child: new CustomPaint(
////                painter: Painter(),
////                size: Size.infinite,
////              ),
//            ),
          ],
        ),
      ),
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
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
//    print('data: $media');
    double iconsize = 50.0;
    double marginIconsHorizontal = 35.0;
    double marginIconsVertical = 20.0;
    double marginVerticalAvatar = 50.0;
    double fontSize = 30.0;

    void showToast(String msg, {int duration, int gravity}) {
      Toast.show(msg, context, duration: duration, gravity: gravity);
    }

    if (media.size.width < 650) {
      iconsize = 30.0;
      marginIconsHorizontal = 10.0;
      marginIconsVertical = 0.0;
      fontSize = 20.0;
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('imgs/psxx.jpg'), fit: BoxFit.fitHeight),
        ),
        child: SingleChildScrollView(
          child: Column(
//              new Container(
//                decoration: BoxDecoration(
//                  image: DecorationImage(
//                      image: AssetImage('imgs/psxx.jpg'),
//                      fit: BoxFit.fitHeight
//                  ),
//                ),
//              ),
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
                        margin: EdgeInsets.symmetric(
                            vertical: marginVerticalAvatar),
                        decoration: myBoxDecoration(),
                        child: CircleAvatar(
                            radius: 100,
                            backgroundImage: AssetImage('imgs/psxme2.png')),
                      ),
                      new Container(
                        margin: EdgeInsets.symmetric(
                            vertical: marginVerticalAvatar),
                        decoration: myBoxDecoration(),
                        child: CircleAvatar(
                            radius: 100,
                            backgroundImage: AssetImage('imgs/psxme2.png')),
                      ),
                      new Container(
                        margin: EdgeInsets.symmetric(
                            vertical: marginVerticalAvatar),
                        decoration: myBoxDecoration(),
                        child: CircleAvatar(
                            radius: 100,
                            backgroundImage: AssetImage('imgs/psxme2.png')),
                      ),
                      new Container(
                        margin: EdgeInsets.symmetric(
                            vertical: marginVerticalAvatar),
                        decoration: myBoxDecoration(),
                        child: CircleAvatar(
                            radius: 100,
                            backgroundImage: AssetImage('imgs/psxme2.png')),
                      ),
                      new Container(
                        margin: EdgeInsets.symmetric(
                            vertical: marginVerticalAvatar),
                        decoration: myBoxDecoration(),
                        child: CircleAvatar(
                            radius: 100,
                            backgroundImage: AssetImage('imgs/psxme2.png')),
                      ),
                      new Container(
                        margin: EdgeInsets.symmetric(
                            vertical: marginVerticalAvatar),
                        decoration: myBoxDecoration(),
                        child: CircleAvatar(
                            radius: 100,
                            backgroundImage: AssetImage('imgs/psxme2.png')),
                      ),
                      new Container(
                        margin: EdgeInsets.symmetric(
                            vertical: marginVerticalAvatar),
                        decoration: myBoxDecoration(),
                        child: CircleAvatar(
                            radius: 100,
                            backgroundImage: AssetImage('imgs/psxme2.png')),
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
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: marginIconsHorizontal,
                                  vertical: marginIconsVertical),
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: marginIconsHorizontal,
                                  vertical: marginIconsVertical),
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: marginIconsHorizontal,
                                  vertical: marginIconsVertical),
                              child: IconButton(
                                icon: Icon(Icons.favorite),
                                iconSize: iconsize,
                                color:
                                    pressed ? Colors.redAccent : Colors.white70,
                                onPressed: () {
                                  setState(() {
                                    pressed = !pressed;
                                  });
                                },
                              ).showCursorOnHover.elevateUpOnHover,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: marginIconsHorizontal,
                                  vertical: marginIconsVertical),
                              child: IconButton(
                                icon: Icon(Icons.build),
                                iconSize: iconsize,
                                color: Colors.white70,
                                onPressed: () {
                                  showToast("Work in Progress!");
                                },
                              ).showCursorOnHover.elevateUpOnHover,
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
                            style:
                                TextStyle(fontSize: 10, color: Colors.white70),
                          ),
                        ),
                      ).showCursorOnHover.elevateUpOnHover,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
