import 'package:flutter/material.dart';

class TapButton extends StatefulWidget {
  const TapButton({super.key});

  @override
  State<TapButton> createState() => _TapButtonState();
}

class _TapButtonState extends State<TapButton> {
  bool _isTapped = false;

  void onTapped() {
    setState(() {
      _isTapped = !_isTapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => onTapped(),
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(color: _isTapped ? Colors.grey[600] : Colors.green[700]),
          alignment: Alignment.center,
          child: Text(
            _isTapped ? "Inactive" : "Active",
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
