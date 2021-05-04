import 'dart:html';
import 'dart:html' as html;

import 'package:bama1033pages/widget/CustomCardLebenslauf.dart';
import 'package:bama1033pages/widget/paddinged_iconbutton.dart';
import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("C.V. & Skills"),
          actions: <Widget>[
            Hero(
              tag: 'Document',
              child: Material(
                borderOnForeground: true,
                color: Color.fromRGBO(255, 255, 255, 0.0),
                child: PIconButton(
                    0, 0, 20, Icons.description, "C.V. & Skills", context),
              ),
            ),
          ],
          backgroundColor: Colors.blueGrey.withOpacity(0.5),
        ),
        body: Container(
          child: Stack(children: <Widget>[
            new Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('imgs/psxx.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CustomCardLebenslauf(
                        175.0,
                        20.0,
                        10,
                        Icons.work,
                        "Current Job @ adorsys 2018-ongoing",
                        "Developed Mobile-Apps, Fullstack and more",
                        context),
                    CustomCardLebenslauf(
                        175.0,
                        20.0,
                        10,
                        Icons.school,
                        "Study at TH Nürnberg from 2016-2018",
                        "Studied for Master of Science in Wirtschaftsinformatik",
                        context),
                    CustomCardLebenslauf(
                        175.0,
                        20.0,
                        10,
                        Icons.school,
                        "Study at HS Karlsruhe from 2012-2016",
                        "Studied for Bachelor of Science in Wirtschaftsinformatik",
                        context),
                    CustomCardLebenslauf(
                        175.0,
                        20.0,
                        10,
                        Icons.school,
                        "Certificate: Architecture",
                        "ISAQB - Architecture Foundation Level",
                        context),
                    CustomCardLebenslauf(
                        175.0,
                        20.0,
                        10,
                        Icons.brush,
                        "Advanced Experience with these Frameworks and Languages",
                        "Kotlin, Java, Javascript, Android, SpringBoot, Angular, JUnit",
                        context),
                    CustomCardLebenslauf(
                        175.0,
                        20.0,
                        10,
                        Icons.brush,
                        "Basic Experience with these Frameworks and Languages",
                        "Dart, Flutter, Vue.JS, Kong API Management, 3Scale API management, Python, bash, Node.JS, C#, WPF, SQL, MongoDB, Maven, Jenkins, Openshift, Docker, JMeter, Gatling, Keycloak, AEM",
                        context),
                    CustomCardLebenslauf(
                        175.0,
                        20.0,
                        10,
                        Icons.computer,
                        "IDEs, Tools and Methods",
                        "IntelliJ, VSCode, Postman, Git, Scrum, Jira",
                        context),
                    RichText(
                      text: TextSpan(
                        text: 'Download C.V.',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontFamily: 'Ubuntu',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.cloud_download),
                      color: Colors.white70,
                      iconSize: 40,
                      onPressed: () {
                        html.window.open(
                            'https://firebasestorage.googleapis.com/v0/b/homepagefluttertracker.appspot.com/o/martincv.pdf?alt=media&token=c040e363-f7e0-433f-8ac6-e5927a71af2a',
                            'cv.pdf');
                      },
                    )
                  ]),
            )
          ]),
        ));
  }
}
