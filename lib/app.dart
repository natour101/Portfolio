import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/localization/app_localizations.dart';
import 'core/theme/app_theme.dart';
import 'pages/about_page.dart';
import 'pages/contact_page.dart';
import 'pages/home_page.dart';
import 'pages/projects_page.dart';
import 'pages/skills_page.dart';
import 'widgets/portfolio_app_bar.dart';

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  Locale _locale = const Locale('en');
  PortfolioPage _page = PortfolioPage.home;

  void _toggleLanguage() {
    setState(() {
      _locale = _locale.languageCode == 'en' ? const Locale('ar') : const Locale('en');
    });
  }

  void _setPage(PortfolioPage page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      theme: AppTheme.darkTheme,
      locale: _locale,
      supportedLocales: const [Locale('en'), Locale('ar')],
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context, child) {
        final direction =
            _locale.languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr;
        return Directionality(
          textDirection: direction,
          child: child ?? const SizedBox.shrink(),
        );
      },
      home: PortfolioScaffold(
        locale: _locale,
        page: _page,
        onPageSelected: _setPage,
        onToggleLanguage: _toggleLanguage,
      ),
    );
  }
}

enum PortfolioPage { home, about, skills, projects, contact }

class PortfolioScaffold extends StatelessWidget {
  const PortfolioScaffold({
    super.key,
    required this.locale,
    required this.page,
    required this.onPageSelected,
    required this.onToggleLanguage,
  });

  final Locale locale;
  final PortfolioPage page;
  final ValueChanged<PortfolioPage> onPageSelected;
  final VoidCallback onToggleLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PortfolioAppBar(
        page: page,
        locale: locale,
        onPageSelected: onPageSelected,
        onToggleLanguage: onToggleLanguage,
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: _pageForSelection(page),
      ),
    );
  }

  Widget _pageForSelection(PortfolioPage selection) {
    switch (selection) {
      case PortfolioPage.home:
        return const HomePage();
      case PortfolioPage.about:
        return const AboutPage();
      case PortfolioPage.skills:
        return const SkillsPage();
      case PortfolioPage.projects:
        return const ProjectsPage();
      case PortfolioPage.contact:
        return const ContactPage();
    }
  }
}
