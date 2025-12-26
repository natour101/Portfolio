import 'package:flutter/material.dart';

import '../app.dart';
import '../core/localization/app_localizations.dart';
import 'language_toggle_button.dart';

class PortfolioAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PortfolioAppBar({
    super.key,
    required this.page,
    required this.locale,
    required this.onPageSelected,
    required this.onToggleLanguage,
  });

  final PortfolioPage page;
  final Locale locale;
  final ValueChanged<PortfolioPage> onPageSelected;
  final VoidCallback onToggleLanguage;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 900;
        final items = <_NavItemData>[
          _NavItemData(localization.navHome, PortfolioPage.home),
          _NavItemData(localization.navAbout, PortfolioPage.about),
          _NavItemData(localization.navSkills, PortfolioPage.skills),
          _NavItemData(localization.navProjects, PortfolioPage.projects),
          _NavItemData(localization.navContact, PortfolioPage.contact),
        ];

        return AppBar(
          title: Text(localization.appTitle),
          actions: [
            if (isWide)
              ...items.map(
                (item) => _NavigationButton(
                  label: item.label,
                  isSelected: page == item.page,
                  onTap: () => onPageSelected(item.page),
                ),
              )
            else
              PopupMenuButton<PortfolioPage>(
                tooltip: localization.appTitle,
                onSelected: onPageSelected,
                itemBuilder: (context) => items
                    .map(
                      (item) => PopupMenuItem(
                        value: item.page,
                        child: Text(item.label),
                      ),
                    )
                    .toList(),
                icon: const Icon(Icons.menu),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: LanguageToggleButton(locale: locale, onToggle: onToggleLanguage),
            ),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _NavItemData {
  const _NavItemData(this.label, this.page);

  final String label;
  final PortfolioPage page;
}

class _NavigationButton extends StatelessWidget {
  const _NavigationButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: isSelected ? colorScheme.primary : colorScheme.onSurface,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
        ),
      ),
    );
  }
}
