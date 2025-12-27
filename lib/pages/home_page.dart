import 'package:flutter/material.dart';

import '../core/localization/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 900;

        final heroContent = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localization.homeName,
              style: textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              localization.homeTitle,
              style: textTheme.titleLarge?.copyWith(
                color: const Color(0xFF38BDF8),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              localization.homeTagline,
              style: textTheme.bodyLarge?.copyWith(height: 1.6),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _HighlightTile(
                  icon: Icons.verified,
                  label: localization.homeHighlightExperience,
                ),
                _HighlightTile(
                  icon: Icons.architecture,
                  label: localization.homeHighlightArchitecture,
                ),
                _HighlightTile(
                  icon: Icons.devices,
                  label: localization.homeHighlightDelivery,
                ),
              ],
            ),
          ],
        );

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1120),
              child: isWide
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: heroContent),
                        const SizedBox(width: 32),
                        _StatusCard(localization: localization),
                      ],
                    )
                  : heroContent,
            ),
          ),
        );
      },
    );
  }
}

class _StatusCard extends StatelessWidget {
  const _StatusCard({required this.localization});

  final AppLocalizations localization;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: 320,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                localization.homeStatusTitle,
                style: textTheme.labelLarge?.copyWith(
                  color: const Color(0xFF38BDF8),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                localization.homeStatusBody,
                style: textTheme.bodyMedium?.copyWith(height: 1.5),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(Icons.schedule, size: 18, color: Color(0xFF94A3B8)),
                  const SizedBox(width: 8),
                  Text(
                    localization.homeStatusTimeZone,
                    style: textTheme.bodySmall?.copyWith(color: const Color(0xFF94A3B8)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HighlightTile extends StatelessWidget {
  const _HighlightTile({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
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
