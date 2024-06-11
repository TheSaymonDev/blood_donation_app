import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClickableItem {
  final IconData iconData;
  final String title;
  final Color cardColor;
  final void Function() onTap;

  ClickableItem(
      {required this.iconData, required this.title, required this.cardColor, required this.onTap});
}
