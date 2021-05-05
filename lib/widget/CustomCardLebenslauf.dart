import 'package:flutter/material.dart';
import 'dart:html' as html;


class CustomCardLebenslauf extends StatelessWidget {
  final double marginCardHorizontal;
  final double marginCardVertical;
  final double iconsize;
  final IconData iconcode;
  final String titletext;
  final String description;
  final BuildContext context;

  const CustomCardLebenslauf(this.marginCardHorizontal,
      this.marginCardVertical,
      this.iconsize,
      this.iconcode,
      this.titletext,
      this.description,
      this.context);

  @override
  Widget build(BuildContext context) {
    return _buildCustomCardLebenslauf(
        this.marginCardHorizontal,
        this.marginCardVertical,
        this.iconsize,
        this.iconcode,
        this.titletext,
        this.description,
        this.context);
  }

  Widget _buildCustomCardLebenslauf(double marginCardHorizontal,
      double marginCardVertical,
      double iconsize,
      IconData icon,
      String titletext,
      String description,
      BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: marginCardHorizontal, vertical: marginCardVertical),
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
