import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(seedColor: const Color(0xFF0D7377));

    return MaterialApp(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: colorScheme,
        useMaterial3: true,
        textTheme: ThemeData.light().textTheme.apply(
              bodyColor: const Color(0xFF0F172A),
              displayColor: const Color(0xFF0F172A),
            ),
        cardTheme: CardTheme(
          elevation: 4,
          color: Colors.white,
          shadowColor: Colors.black.withOpacity(0.08),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
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
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 960),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 42,
                        backgroundColor: Color(0xFF14B8A6),
                        child: Icon(
                          Icons.person,
                          size: 42,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jordan Smith',
                              style: textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Senior Flutter Engineer · Building clean, fast, and delightful mobile apps.',
                              style: textTheme.titleMedium?.copyWith(
                                color: Colors.blueGrey.shade700,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: const [
                                _Chip(label: 'Flutter'),
                                _Chip(label: 'Dart'),
                                _Chip(label: 'Firebase'),
                                _Chip(label: 'CI/CD'),
                                _Chip(label: 'UX-driven UI'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const _ContactActions(),
                    ],
                  ),
                  const SizedBox(height: 32),
                  _Section(
                    title: 'About',
                    children: [
                      Text(
                        'I craft production-ready Flutter apps focused on performance, accessibility, and maintainability. '
                        'From greenfield builds to scaling existing products, I translate complex requirements into '
                        'polished experiences with strong architecture and testing.',
                        style: textTheme.bodyLarge?.copyWith(height: 1.4),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _Section(
                    title: 'Experience',
                    children: [
                      _ExperienceCard(
                        title: 'Lead Mobile Engineer · Nova Labs',
                        timeframe: '2021 — Present',
                        points: const [
                          'Designed a modular architecture that reduced feature delivery time by 30%.',
                          'Implemented performance profiling and shader optimizations for a smoother 120fps experience.',
                          'Built design-system components with extensive unit and golden testing.',
                        ],
                      ),
                      const SizedBox(height: 12),
                      _ExperienceCard(
                        title: 'Senior Flutter Developer · Brightside',
                        timeframe: '2019 — 2021',
                        points: const [
                          'Shipped cross-platform onboarding with federated auth and analytics instrumentation.',
                          'Collaborated with designers to deliver pixel-perfect layouts using custom slivers and animations.',
                          'Championed CI/CD with automated code quality gates and staged rollouts.',
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _Section(
                    title: 'Selected Projects',
                    children: [
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: const [
                          _ProjectCard(
                            title: 'Wellness Companion',
                            description:
                                'Mindfulness and coaching app with offline-first architecture and crisp motion design.',
                            tech: 'Flutter · Riverpod · SQLite · Lottie',
                          ),
                          _ProjectCard(
                            title: 'On-Demand Courier',
                            description:
                                'Courier tracking experience with live maps, push notifications, and driver performance dashboards.',
                            tech: 'Flutter · Firebase · Maps SDK · Cloud Functions',
                          ),
                          _ProjectCard(
                            title: 'Retail Showcase',
                            description:
                                'Composable storefront experience with localized content and A/B-tested feature flags.',
                            tech: 'Flutter · GoRouter · GraphQL · LaunchDarkly',
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _Section(
                    title: 'Tooling & Practices',
                    children: [
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: const [
                          _Chip(label: 'Clean Architecture'),
                          _Chip(label: 'Riverpod'),
                          _Chip(label: 'Bloc'),
                          _Chip(label: 'Golden Tests'),
                          _Chip(label: 'Integration Tests'),
                          _Chip(label: 'Fastlane'),
                          _Chip(label: 'GitHub Actions'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Align(
                    child: Text(
                      'Let\'s build something great together.',
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ...children,
      ],
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  const _ExperienceCard({
    required this.title,
    required this.timeframe,
    required this.points,
  });

  final String title;
  final String timeframe;
  final List<String> points;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  timeframe,
                  style: textTheme.labelLarge?.copyWith(
                    color: Colors.blueGrey.shade600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...points.map(
              (point) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.check_circle, size: 18, color: Color(0xFF14B8A6)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        point,
                        style: textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({
    required this.title,
    required this.description,
    required this.tech,
  });

  final String title;
  final String description;
  final String tech;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: 280,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: textTheme.bodyMedium?.copyWith(height: 1.3),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.code, size: 18, color: Color(0xFF14B8A6)),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      tech,
                      style: textTheme.labelLarge?.copyWith(
                        color: Colors.blueGrey.shade700,
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

class _Chip extends StatelessWidget {
  const _Chip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: const Color(0xFFE0F2F1),
      labelStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        color: Color(0xFF0F172A),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

class _ContactActions extends StatelessWidget {
  const _ContactActions();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FilledButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.email_outlined),
          label: const Text('Email'),
          style: FilledButton.styleFrom(
            backgroundColor: colorScheme.primary,
            foregroundColor: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.link),
          label: const Text('LinkedIn'),
        ),
        const SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.code),
          label: const Text('GitHub'),
        ),
      ],
    );
  }
}
