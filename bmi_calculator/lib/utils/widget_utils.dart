import 'package:flutter/material.dart';

const double baseHeight = 932;

double screenAwareSize(double size, BuildContext context) {
  return size * MediaQuery.of(context).size.height / baseHeight;
}
