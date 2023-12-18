import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_news_app/modules/settings/cubit/states.dart';

import '../../../data_layer/shared_preferences.dart';

class SettingsCubit extends Cubit<SettingsStates> {
  SettingsCubit() : super(SettingsInitialState());

  static SettingsCubit get(context) => BlocProvider.of(context);

  String appLanguage = 'en';

  void changeAppLang({required String language}) {
    appLanguage = language;
    CacheHelper.putData(key: 'language', value: language);
    print(CacheHelper.getStringData(key: 'language'));
    emit(SettingsChangeAppLanguageState(language));
  }

  bool isArabic() {
    return CacheHelper.getStringData(key: 'language') == 'ar';
  }
}
