import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchTextField extends StatelessWidget {
  TextEditingController searchController;
  final void Function()? onSuffixTap;

  SearchTextField({Key? key, required this.searchController, this.onSuffixTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: TextFormField(
        controller: searchController,
        decoration: InputDecoration(
          prefixIcon: TextButton(
            child: const Text(
              'X',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xff39A552),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          suffixIcon: IconButton(
            onPressed: onSuffixTap,
            icon: const Icon(
              Icons.search,
              color: Color(0XFF39A552),
              size: 30,
            ),
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: lang.search,
          hintStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: const Color(0XFF39A552).withOpacity(
              .40,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(
                color: Colors.white,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(
                color: Colors.white,
              )),
        ),
      ),
    );
  }
}
