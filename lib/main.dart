import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:route_news_app/core/theme.dart';
import 'package:route_news_app/data_layer/shared_preferences.dart';
import 'package:route_news_app/modules/home/home_view.dart';
import 'package:route_news_app/modules/news_details/news_details_view.dart';
import 'package:route_news_app/modules/search/search_view.dart';
import 'package:route_news_app/modules/settings/cubit/cubit.dart';
import 'package:route_news_app/modules/settings/cubit/states.dart';
import 'package:route_news_app/modules/settings/settings_view.dart';
import 'package:route_news_app/modules/splash/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: BlocConsumer<SettingsCubit, SettingsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = SettingsCubit();
          return MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(
              cubit.isArabic() ? 'ar' : 'en',
            ),
            theme: ApplicationTheme.applicationTheme,
            debugShowCheckedModeBanner: false,
            initialRoute: SplashView.routeName,
            routes: {
              SplashView.routeName: (context) => const SplashView(),
              HomeView.routeName: (context) => const HomeView(),
              SettingsView.routeName: (context) => const SettingsView(),
              NewsDetailsView.routeName: (context) => const NewsDetailsView(),
              SearchView.routeName: (context) => SearchView(),
            },
          );
        },
      ),
    );
  }
}
