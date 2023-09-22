import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomSheetButton extends StatelessWidget {
  final String title;

  const BottomSheetButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0XFF39A552),
        ),
        borderRadius: BorderRadius.circular(8.0),
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/pattern.png',
          ),
          fit: BoxFit.fill,
        ),
        color: Colors.black.withOpacity(.1),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Text(
            title,
            style: GoogleFonts.exo(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.check,
          ),
        ],
      ),
    );
  }
}
