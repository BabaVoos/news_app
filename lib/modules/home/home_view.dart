import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_news_app/core/helpers.dart';
import 'package:route_news_app/core/widgets/my_container.dart';
import 'package:route_news_app/models/category_model.dart';
import 'package:route_news_app/modules/home/widgets/category_widget.dart';
import 'package:route_news_app/modules/home/widgets/my_drawer.dart';
import 'package:route_news_app/modules/settings/settings_view.dart';

class HomeView extends StatefulWidget {
  static const String routeName = 'home';

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return MyContainer(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: context.screenHeight * 0.075,
          title: Text(
            screenTitle(),
          ),
          actions: [
            selectedCategory != null
                ? Padding(
                    padding: const EdgeInsetsDirectional.only(end: 10),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search_rounded,
                        size: 30,
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
        drawer: MyDrawer(
          settingsOnClicked: () {
            settingsOnClicked();
          },
          categoriesOnClicked: () {
            categoriesOnClicked();
          },
        ),
        body: buildBody(),
      ),
    );
  }

  CategoryModel? selectedCategory;
  bool showSettings = false;

  Widget buildBody() {
    if (selectedCategory == null && showSettings == false) {
      return Padding(
        padding: const EdgeInsets.all(
          32.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Pick your category \nof interest',
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color(0XFF4F5A69),
              ),
            ),
            SizedBox(
              height: context.screenHeight / 40,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                childAspectRatio: 7 / 8,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                return CategoryWidget(
                  categoryModel: CategoryModel.categories[index],
                  index: index,
                  onClicked: () {
                    onClicked(CategoryModel.categories[index]);
                  },
                );
              },
              itemCount: CategoryModel.categories.length,
            ),
          ],
        ),
      );
    } else if (showSettings == true) {
      return const SettingsView();
    } else {
      return Center(
        child: Text(
          selectedCategory!.title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: selectedCategory!.backgroundColor,
          ),
        ),
      );
    }
  }

  String screenTitle() {
    if (selectedCategory == null && showSettings == false) {
      return 'News App';
    } else if (showSettings == true) {
      return 'Settings';
    } else {
      return selectedCategory!.title;
    }
  }

  onClicked(CategoryModel? categoryModel) {
    showSettings = false;
    selectedCategory = categoryModel;
    setState(() {});
    print(selectedCategory!.title);
  }

  settingsOnClicked() {
    selectedCategory = null;
    showSettings = true;
    setState(() {});
    Navigator.pop(context);
  }

  categoriesOnClicked() {
    selectedCategory = null;
    showSettings = false;
    setState(() {});
    Navigator.pop(context);
  }
}
