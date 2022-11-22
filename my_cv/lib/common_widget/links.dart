import 'package:flutter/material.dart';
import 'package:my_cv/util/details.dart';

class Links extends StatelessWidget {
  final IconData iconData;
  final String link;
  const Links({
    super.key,
    required this.iconData,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            size: 25,
            color: Colors.black,
          ),
          const SizedBox(
            width: 5,
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text(
              link,
              style: TextStyle(color: Colorss().textColor),
            ),
          ),
        ],
      ),
    );
  }
}
