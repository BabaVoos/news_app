import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_news_app/core/helpers.dart';
import 'package:route_news_app/modules/home/widgets/drawer_item.dart';

import '../../../core/widgets/my_container.dart';

class MyDrawer extends StatelessWidget {
  final Function categoriesOnClicked;
  final Function settingsOnClicked;

  const MyDrawer(
      {Key? key,
      required this.categoriesOnClicked,
      required this.settingsOnClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: MyContainer(
          child: Column(
            children: [
              Container(
                width: context.screenWidth,
                height: context.screenHeight * 0.12,
                color: const Color(0XFF39A552),
                child: Center(
                  child: Text(
                    'News App!',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              DrawerItem(
                iconData: Icons.menu,
                title: 'Categories',
                onClicked: () {
                  categoriesOnClicked();
                },
              ),
              DrawerItem(
                iconData: Icons.settings,
                title: 'Settings',
                onClicked: () {
                  settingsOnClicked();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
