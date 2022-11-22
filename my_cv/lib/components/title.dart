import 'package:flutter/material.dart';
import 'package:my_cv/common_widget/links.dart';
import 'package:my_cv/util/details.dart';

Column nameAndbio() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "BIMAL KHATRI",
        style: TextStyle(
          color: Colorss().headingColor,
          fontWeight: FontWeight.w500,
          fontSize: 80,
        ),
      ),
      Text(
        "Software Developer",
        style: TextStyle(
          color: Colorss().subheadingColor,
          fontSize: 35,
        ),
      ),
    ],
  );
}

Container titleLinks() {
  List<Map> datas = [
    {'iconData': Icons.email_outlined, 'link': "khattribimal90@gmail.com"},
    {'iconData': Icons.language, 'link': "bimalkhatri.com.np"},
    {'iconData': Icons.location_on_outlined, 'link': "Pokhara"},
    {'iconData': Icons.phone, 'link': "9867743236"},
  ];

  List<Widget> getDetail() {
    return datas
        .map<Widget>((data) => Links(iconData: data['iconData'], link: data['link']))
        .toList();
  }

  return Container(
    margin: const EdgeInsets.only(right: 70),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: getDetail(),
    ),
  );
}
