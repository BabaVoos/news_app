import 'package:flutter/material.dart';

class SourceItem extends StatelessWidget {
  final String text;
  bool? isSelected;

  SourceItem({Key? key, required this.text, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected! ? const Color(0XFF39A552) : Colors.transparent,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: const Color(0XFF39A552),
          width: 2,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: isSelected! ? Colors.white : const Color(0XFF39A552),
        ),
      ),
    );
  }
}
