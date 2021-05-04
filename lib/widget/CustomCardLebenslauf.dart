import 'package:flutter/material.dart';
import 'dart:html' as html;


class CustomCardLebenslauf extends StatelessWidget {
  final double marginIconsHorizontal;
  final double marginIconsVertical;
  final double iconsize;
  final IconData iconcode;
  final String titletext;
  final String description;
  final BuildContext context;

  const CustomCardLebenslauf(this.marginIconsHorizontal,
      this.marginIconsVertical,
      this.iconsize,
      this.iconcode,
      this.titletext,
      this.description,
      this.context);

  @override
  Widget build(BuildContext context) {
    return _buildCustomCardLebenslauf(
        this.marginIconsHorizontal,
        this.marginIconsVertical,
        this.iconsize,
        this.iconcode,
        this.titletext,
        this.description,
        this.context);
  }

  Widget _buildCustomCardLebenslauf(double marginIconsHorizontal,
      double marginIconsVertical,
      double iconsize,
      IconData icon,
      String titletext,
      String description,
      BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: marginIconsHorizontal, vertical: marginIconsVertical),
      child: Card(
        color: Colors.white24.withOpacity(0.8),
        child: new Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(icon),
                title: Text(titletext),
                subtitle: Text(description),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
