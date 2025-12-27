import 'dart:html' as html;

import 'package:flutter/material.dart';

import '../core/localization/app_localizations.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

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
                localization.contactTitle,
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  _IconLinkButton(
                    icon: Icons.code,
                    tooltip: localization.contactGithub,
                    url: 'https://github.com/',
                  ),
                  _IconLinkButton(
                    icon: Icons.work_outline,
                    tooltip: localization.contactLinkedIn,
                    url: 'https://www.linkedin.com/',
                  ),
                  _IconLinkButton(
                    icon: Icons.chat_bubble_outline,
                    tooltip: localization.contactWhatsApp,
                    url: 'https://wa.me/0000000000',
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                localization.footerNote,
                style: textTheme.titleMedium?.copyWith(
                  color: const Color(0xFF94A3B8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _IconLinkButton extends StatelessWidget {
  const _IconLinkButton({
    required this.icon,
    required this.tooltip,
    required this.url,
  });

  final IconData icon;
  final String tooltip;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: OutlinedButton(
        onPressed: () => html.window.open(url, '_blank'),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.white.withOpacity(0.2)),
          padding: const EdgeInsets.all(18),
        ),
        child: Icon(icon, size: 24, color: const Color(0xFF38BDF8)),
      ),
    );
  }
}
