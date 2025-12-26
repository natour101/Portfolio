import 'dart:html' as html;

import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    const background = Color(0xFF0B0D12);
    const surface = Color(0xFF111827);
    const accent = Color(0xFF38BDF8);

    final colorScheme = ColorScheme.fromSeed(
      seedColor: accent,
      brightness: Brightness.dark,
      surface: surface,
    );

    return MaterialApp(
      title: 'Mohammad Natour | Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: colorScheme,
        brightness: Brightness.dark,
        useMaterial3: true,
        scaffoldBackgroundColor: background,
        textTheme: ThemeData.dark().textTheme.apply(
              bodyColor: const Color(0xFFE2E8F0),
              displayColor: const Color(0xFFF8FAFC),
            ),
        cardTheme: CardTheme(
          color: const Color(0xFF0F172A),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: BorderSide(
              color: Colors.white.withOpacity(0.08),
            ),
          ),
        ),
      ),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 960;

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1120),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _HeroSection(isWide: isWide),
                      const SizedBox(height: 40),
                      _Section(
                        title: 'About Me',
                        child: Text(
                          'I am a Computer Engineer specializing in Flutter and React Native, focused on delivering reliable mobile and web experiences. '
                          'I build scalable backends with Laravel and Firebase (Google), and I approach every project with problem solving, clean architecture, '
                          'and a focus on maintainability.',
                          style: textTheme.bodyLarge?.copyWith(height: 1.6),
                        ),
                      ),
                      const SizedBox(height: 36),
                      _Section(
                        title: 'Skills',
                        child: Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: const [
                            _SkillChip(label: 'Flutter', icon: Icons.flutter_dash),
                            _SkillChip(label: 'React Native', icon: Icons.phone_android),
                            _SkillChip(label: 'Laravel', icon: Icons.storage),
                            _SkillChip(label: 'Firebase', icon: Icons.cloud),
                            _SkillChip(label: 'REST APIs', icon: Icons.api),
                            _SkillChip(label: 'Problem Solving', icon: Icons.lightbulb_outline),
                          ],
                        ),
                      ),
                      const SizedBox(height: 36),
                      _Section(
                        title: 'Projects',
                        child: LayoutBuilder(
                          builder: (context, innerConstraints) {
                            final isCompact = innerConstraints.maxWidth < 760;
                            return Wrap(
                              spacing: 20,
                              runSpacing: 20,
                              children: [
                                _ProjectCard(
                                  width: isCompact ? innerConstraints.maxWidth : 340,
                                  title: 'FlowPay Wallet',
                                  description:
                                      'A secure fintech wallet experience with real-time balance updates and smooth onboarding.',
                                  tech: 'Flutter · Firebase · Stripe',
                                ),
                                _ProjectCard(
                                  width: isCompact ? innerConstraints.maxWidth : 340,
                                  title: 'Clinic Connect',
                                  description:
                                      'Appointment scheduling and patient tracking with role-based access and analytics.',
                                  tech: 'Flutter · Laravel · MySQL',
                                ),
                                _ProjectCard(
                                  width: isCompact ? innerConstraints.maxWidth : 340,
                                  title: 'Retail Pulse',
                                  description:
                                      'Inventory and sales dashboard with offline-first sync for field teams.',
                                  tech: 'React Native · Firebase · REST APIs',
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 36),
                      _Section(
                        title: 'Contact',
                        child: Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: const [
                            _ContactButton(
                              label: 'GitHub',
                              icon: Icons.code,
                              url: 'https://github.com/',
                            ),
                            _ContactButton(
                              label: 'LinkedIn',
                              icon: Icons.work_outline,
                              url: 'https://www.linkedin.com/',
                            ),
                            _ContactButton(
                              label: 'WhatsApp',
                              icon: Icons.chat_bubble_outline,
                              url: 'https://wa.me/0000000000',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      Align(
                        child: Text(
                          'Open to collaborations and impactful projects.',
                          style: textTheme.titleMedium?.copyWith(
                            color: const Color(0xFF94A3B8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection({required this.isWide});

  final bool isWide;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mohammad Natour',
          style: textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Computer Engineer',
          style: textTheme.titleLarge?.copyWith(
            color: const Color(0xFF38BDF8),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Crafting modern mobile and web experiences with thoughtful architecture and a focus on product quality.',
          style: textTheme.bodyLarge?.copyWith(height: 1.5),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: const [
            _HighlightTile(
              icon: Icons.verified,
              label: '4+ Years Experience',
            ),
            _HighlightTile(
              icon: Icons.architecture,
              label: 'Clean Architecture',
            ),
            _HighlightTile(
              icon: Icons.devices,
              label: 'Cross-Platform Delivery',
            ),
          ],
        ),
      ],
    );

    if (!isWide) {
      return content;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: content),
        const SizedBox(width: 32),
        const _HeroCard(),
      ],
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Currently Available',
              style: textTheme.labelLarge?.copyWith(
                color: const Color(0xFF38BDF8),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Open for freelance and full-time opportunities in Flutter and React Native.',
              style: textTheme.bodyMedium?.copyWith(height: 1.5),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.schedule, size: 18, color: Color(0xFF94A3B8)),
                const SizedBox(width: 8),
                Text(
                  'Based in GMT+2',
                  style: textTheme.bodySmall?.copyWith(color: const Color(0xFF94A3B8)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        child,
      ],
    );
  }
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

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({
    required this.width,
    required this.title,
    required this.description,
    required this.tech,
  });

  final double width;
  final String title;
  final String description;
  final String tech;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: width,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                description,
                style: textTheme.bodyMedium?.copyWith(height: 1.5),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(Icons.memory, size: 18, color: Color(0xFF38BDF8)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      tech,
                      style: textTheme.labelLarge?.copyWith(
                        color: const Color(0xFF94A3B8),
                      ),
                    ),
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

class _ContactButton extends StatelessWidget {
  const _ContactButton({
    required this.label,
    required this.icon,
    required this.url,
  });

  final String label;
  final IconData icon;
  final String url;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () => html.window.open(url, '_blank'),
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: BorderSide(color: Colors.white.withOpacity(0.2)),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
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
