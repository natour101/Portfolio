import 'package:flutter/material.dart';

import '../core/localization/app_localizations.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                localization.aboutTitle,
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                localization.aboutBody,
                style: textTheme.bodyLarge?.copyWith(height: 1.7),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
