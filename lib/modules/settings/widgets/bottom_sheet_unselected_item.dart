import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomSheetUnselectedItem extends StatelessWidget {
  final String title;
  void Function()? onTap;

  BottomSheetUnselectedItem(
      {Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          style: GoogleFonts.exo(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
