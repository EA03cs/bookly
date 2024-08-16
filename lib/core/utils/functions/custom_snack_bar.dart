import 'package:flutter/material.dart';

void snackBar(Uri uri, BuildContext context) {
  final snackBar = SnackBar(content: Text('Could not launch $uri'));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
