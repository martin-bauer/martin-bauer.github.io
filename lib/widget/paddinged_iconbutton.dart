import 'dart:html' as html;

import 'package:bama1033pages/activities/SecondActivity.dart';
import 'package:bama1033pages/extensions/hover_extensions.dart';
import 'package:bama1033pages/services/calls_and_messages_service.dart';
import 'package:bama1033pages/services/service_locator.dart';
import 'package:bama1033pages/widget/showToast.dart';
import 'package:flutter/material.dart';

class PIconButton extends StatelessWidget {
  final double marginIconsHorizontal;
  final double marginIconsVertical;
  final double iconsize;
  final IconData iconcode;
  final String choice;
  final BuildContext context;

  const PIconButton(this.marginIconsHorizontal, this.marginIconsVertical,
      this.iconsize, this.iconcode, this.choice, this.context);

  @override
  Widget build(BuildContext context) {
    return _buildPIconButton(
        this.marginIconsHorizontal,
        this.marginIconsVertical,
        this.iconsize,
        this.iconcode,
        this.choice,
        this.context);
  }

  Widget _buildPIconButton(double marginIconsHorizontal,
      double marginIconsVertical,
      double iconsize,
      IconData icon,
      String choice,
      BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: marginIconsHorizontal, vertical: marginIconsVertical),
        child: Tooltip(
          message: choice,
          child: IconButton(
            icon: Icon(icon),
            color: Colors.white70,
            iconSize: iconsize + 10,
            onPressed: () {
              decidePressed(choice);
            },
          ).showCursorOnHover.elevateUpOnHover,
        ));
  }

  void decidePressed(String choice) {
    switch (choice) {
      case 'Github':
        callGithubRepo();
        break;
      case 'Mail':
        callMail();
        break;
      case'WIP':
        showToast("Always work in progress!", context);
        break;
      case'C.V. & Skills':
        showToast("C.V. downloadable on the bottom of the page", context);
        break;
      case'CV':
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: Duration(seconds: 1),
                pageBuilder: (_, __, ___) => SecondRoute()));
        break;
      default:
        showToast('Not defined yet', context);
    }
  }
}

void callGithubRepo() {
  html.window.open('https://github.com/bama1033', 'Github/bama1033');
}

void callMail() {
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();
  _service.sendEmail();
}
