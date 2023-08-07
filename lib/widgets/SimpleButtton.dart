import 'package:flutter/material.dart';

class SimpleButton extends StatefulWidget {
  final String btnTitle;
  final Color btnColor;
  final VoidCallback onTap;
  const SimpleButton(
      {super.key,
      required this.btnTitle,
      required this.btnColor,
      required this.onTap});

  @override
  State<SimpleButton> createState() => _SimpleButtonState();
}

class _SimpleButtonState extends State<SimpleButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          widget.btnTitle,
          style: TextStyle(color: widget.btnColor),
        ),
      ),
    );
  }
}
