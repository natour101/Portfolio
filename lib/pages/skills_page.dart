import 'package:flutter/material.dart';

import '../core/localization/app_localizations.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;

    final skills = <_SkillItem>[
      _SkillItem(localization.skillFlutter, Icons.flutter_dash),
      _SkillItem(localization.skillReactNative, Icons.phone_android),
      _SkillItem(localization.skillLaravel, Icons.storage),
      _SkillItem(localization.skillFirebase, Icons.cloud),
      _SkillItem(localization.skillRestApis, Icons.api),
      _SkillItem(localization.skillProblemSolving, Icons.lightbulb_outline),
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                localization.skillsTitle,
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: skills
                    .map((skill) => _SkillChip(label: skill.label, icon: skill.icon))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkillItem {
  const _SkillItem(this.label, this.icon);

  final String label;
  final IconData icon;
}

class _SkillChip extends StatelessWidget {
  const _SkillChip({required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: const Color(0xFF38BDF8)),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
