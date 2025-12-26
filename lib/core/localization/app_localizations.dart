import 'package:flutter/widgets.dart';

import 'ar.dart';
import 'en.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const supportedLocales = [Locale('en'), Locale('ar')];

  String get appTitle => _value('appTitle');
  String get navHome => _value('navHome');
  String get navAbout => _value('navAbout');
  String get navSkills => _value('navSkills');
  String get navProjects => _value('navProjects');
  String get navContact => _value('navContact');
  String get homeName => _value('homeName');
  String get homeTitle => _value('homeTitle');
  String get homeTagline => _value('homeTagline');
  String get homeHighlightExperience => _value('homeHighlightExperience');
  String get homeHighlightArchitecture => _value('homeHighlightArchitecture');
  String get homeHighlightDelivery => _value('homeHighlightDelivery');
  String get homeStatusTitle => _value('homeStatusTitle');
  String get homeStatusBody => _value('homeStatusBody');
  String get homeStatusTimeZone => _value('homeStatusTimeZone');
  String get aboutTitle => _value('aboutTitle');
  String get aboutBody => _value('aboutBody');
  String get skillsTitle => _value('skillsTitle');
  String get skillFlutter => _value('skillFlutter');
  String get skillReactNative => _value('skillReactNative');
  String get skillLaravel => _value('skillLaravel');
  String get skillFirebase => _value('skillFirebase');
  String get skillRestApis => _value('skillRestApis');
  String get skillProblemSolving => _value('skillProblemSolving');
  String get projectsTitle => _value('projectsTitle');
  String get projectsLoading => _value('projectsLoading');
  String get projectsEmpty => _value('projectsEmpty');
  String get projectFallbackTitleOne => _value('projectFallbackTitleOne');
  String get projectFallbackDescOne => _value('projectFallbackDescOne');
  String get projectFallbackTechOne => _value('projectFallbackTechOne');
  String get projectFallbackTitleTwo => _value('projectFallbackTitleTwo');
  String get projectFallbackDescTwo => _value('projectFallbackDescTwo');
  String get projectFallbackTechTwo => _value('projectFallbackTechTwo');
  String get projectFallbackTitleThree => _value('projectFallbackTitleThree');
  String get projectFallbackDescThree => _value('projectFallbackDescThree');
  String get projectFallbackTechThree => _value('projectFallbackTechThree');
  String get contactTitle => _value('contactTitle');
  String get contactGithub => _value('contactGithub');
  String get contactLinkedIn => _value('contactLinkedIn');
  String get contactWhatsApp => _value('contactWhatsApp');
  String get footerNote => _value('footerNote');

  String _value(String key) {
    final map = locale.languageCode == 'ar' ? arStrings : enStrings;
    return map[key] ?? enStrings[key] ?? key;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
