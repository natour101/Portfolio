import 'package:flutter/material.dart';

class LanguageToggleButton extends StatelessWidget {
  const LanguageToggleButton({
    super.key,
    required this.locale,
    required this.onToggle,
  });

  final Locale locale;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    final isEnglish = locale.languageCode == 'en';

    return OutlinedButton(
      onPressed: onToggle,
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: BorderSide(color: Colors.white.withOpacity(0.2)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
      child: Text(
        isEnglish ? 'EN' : 'AR',
        style: const TextStyle(fontWeight: FontWeight.w700),
      ),
    );
  }
}
