import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_news_app/core/helpers.dart';
import 'package:route_news_app/core/widgets/my_container.dart';
import 'package:route_news_app/modules/settings/cubit/cubit.dart';
import 'package:route_news_app/modules/settings/widgets/bottom_sheet_selected_item.dart';
import 'package:route_news_app/modules/settings/widgets/bottom_sheet_unselected_item.dart';

class SettingsView extends StatelessWidget {
  static const String routeName = 'settings';

  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    var cubit = SettingsCubit();
    return MyContainer(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              lang.language,
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
                          cubit.isArabic()
                              ? BottomSheetUnselectedItem(
                                  title: lang.english,
                                  onTap: () {
                                    cubit.changeAppLang(language: 'en');
                                    Navigator.pop(context);
                                  },
                                )
                              : BottomSheetSelectedItem(
                                  title: lang.english,
                                ),
                          cubit.isArabic()
                              ? BottomSheetSelectedItem(
                                  title: lang.arabic,
                                )
                              : BottomSheetUnselectedItem(
                                  title: lang.arabic,
                                  onTap: () {
                                    cubit.changeAppLang(language: 'ar');
                                    Navigator.pop(context);
                                  },
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
                      cubit.isArabic() ? lang.arabic : lang.english,
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
