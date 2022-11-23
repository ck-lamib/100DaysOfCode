import 'package:flutter/material.dart';

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<ParentWidget> createState() => _HelloState();
}

class _HelloState extends State<ParentWidget> {
  @override
  bool _isTapped = true;

  void handlTapBoxChange(bool newValue) {
    setState(() {
      _isTapped = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TapButton(
      tapp: handlTapBoxChange,
      isTapped: _isTapped,
    );
  }
}

class TapButton extends StatelessWidget {
  final ValueChanged<bool> tapp;
  final bool isTapped;
  const TapButton({
    super.key,
    required this.isTapped,
    required this.tapp,
  });
  void handleTapp() {
    tapp(!isTapped);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => handleTapp(),
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(color: isTapped ? Colors.grey[600] : Colors.green[700]),
          alignment: Alignment.center,
          child: Text(
            isTapped ? "Inactive" : "Active",
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }
}

// class ParentWidget extends StatefulWidget {
//   const ParentWidget({super.key});

//   @override
//   State<ParentWidget> createState() => _ParentWidgetState();
// }

// class _ParentWidgetState extends State<ParentWidget> {
//   bool _isTapped = false;
//   void changeValue(bool newValue) {
//     setState(() {
//       _isTapped = newValue;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TapButton(handlechange: changeValue, isTapped: _isTapped);
//   }
// }

// class TapButton extends StatelessWidget {
//   final bool isTapped;
//   final Function handlechange;
//   const TapButton({super.key, required this.handlechange, required this.isTapped});

//   void changeValue() {
//     handlechange(!isTapped);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: GestureDetector(
//         onTap: () => changeValue(),
//         child: Container(
//           height: 100,
//           width: 100,
//           decoration: BoxDecoration(color: isTapped ? Colors.grey[600] : Colors.green[700]),
//           alignment: Alignment.center,
//           child: Text(
//             isTapped ? "Inactive" : "Active",
//             style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
//           ),
//         ),
//       ),
//     );
//   }
// }
