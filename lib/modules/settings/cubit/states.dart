abstract class SettingsStates {}

class SettingsInitialState extends SettingsStates {}

class SettingsChangeAppLanguageState extends SettingsStates {
  final String lang;

  SettingsChangeAppLanguageState(this.lang);
}
