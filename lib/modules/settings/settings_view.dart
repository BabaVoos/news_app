import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_news_app/core/helpers.dart';
import 'package:route_news_app/core/widgets/my_container.dart';
import 'package:route_news_app/modules/settings/widgets/bottom_sheet_button.dart';

class SettingsView extends StatelessWidget {
  static const String routeName = 'settings';

  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Language',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: context.screenHeight / 50,
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  context: context,
                  builder: (context) => BottomSheet(
                    backgroundColor: Colors.grey[200],
                    enableDrag: false,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    onClosing: () {},
                    builder: (context) => Container(
                      height: context.screenHeight / 3,
                      padding: const EdgeInsets.all(
                        30,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const BottomSheetButton(
                            title: 'English',
                          ),
                          Text(
                            'Arabic',
                            style: GoogleFonts.exo(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsetsDirectional.only(
                  start: context.screenWidth / 20,
                ),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0XFF39A552),
                    width: 1.5,
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      'English',
                      style: GoogleFonts.exo(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0XFF39A552),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
