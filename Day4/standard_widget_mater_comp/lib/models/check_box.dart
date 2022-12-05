import 'package:flutter/material.dart';

class CheckBoxx extends StatefulWidget {
  const CheckBoxx({super.key});

  @override
  State<CheckBoxx> createState() => _CheckBoxxState();
}

class _CheckBoxxState extends State<CheckBoxx> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Checkbox(
      tristate: true,
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: ((bool? value) => setState(() {
            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: const Text("do u want to make null?"),
                  actions: [
                    TextButton(
                        onPressed: (() {
                          isChecked = (!isChecked!);
                          Navigator.of(context).pop();
                        }),
                        child: Text("No")),
                    TextButton(
                        onPressed: (() {
                          isChecked = null;
                          Navigator.of(context).pop();
                        }),
                        child: Text("Yes"))
                  ],
                );
              },
            );

            // showDialog<void>(
            //     context: context,
            //     barrierDismissible: false, // user must tap button!
            //     builder: (BuildContext context) {
            //       return AlertDialog(
            //         title: const Text('AlertDialog Title'),
            //         content: SingleChildScrollView(
            //           child: ListBody(
            //             children: const <Widget>[
            //               Text('This is a demo alert dialog.'),
            //               Text('Would you like to approve of this message?'),
            //             ],
            //           ),
            //         ),
            //         actions: <Widget>[
            //           TextButton(
            //             child: const Text('Approve'),
            //             onPressed: () {
            //               Navigator.of(context).pop();
            //             },
            //           ),
            //         ],
            //       );
            //     });
          })),
    );
  }
}
