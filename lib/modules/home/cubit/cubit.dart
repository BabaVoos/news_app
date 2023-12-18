import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:route_news_app/modules/category/category_view.dart';
import 'package:route_news_app/modules/home/cubit/states.dart';
import 'package:route_news_app/modules/home/widgets/home_widget.dart';
import 'package:route_news_app/modules/settings/settings_view.dart';

import '../../../data_layer/models/category_model.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of(context);

  CategoryModel? selectedCategory;
  bool showSettings = false;

  String screenTitle(context) {
    var lang = AppLocalizations.of(context)!;
    if (selectedCategory == null && showSettings == false) {
      return lang.news_app;
    } else if (showSettings == true) {
      return lang.settings;
    } else {
      return selectedCategory!.title;
    }
  }

  onClicked(CategoryModel? categoryModel) {
    showSettings = false;
    selectedCategory = categoryModel;
    emit(HomeSelectCategoryState());
    print(selectedCategory!.title);
  }

  settingsOnClicked(context) {
    selectedCategory = null;
    showSettings = true;
    emit(HomeSettingsTappedState());
    Navigator.pop(context);
  }

  categoriesOnClicked(context) {
    selectedCategory = null;
    showSettings = false;
    emit(HomeSettingsTappedState());
    Navigator.pop(context);
  }

  Widget buildBody() {
    if (selectedCategory == null && showSettings == false) {
      return const HomeWidget();
    } else if (showSettings == true) {
      return const SettingsView();
    } else {
      return CategoryView(
        categoryModel: selectedCategory!,
      );
    }
  }
}
