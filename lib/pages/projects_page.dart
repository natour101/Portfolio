import 'package:flutter/material.dart';

import '../core/localization/app_localizations.dart';
import '../services/projects_service.dart';
import '../widgets/project_card.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final service = ProjectsService();

    final fallbackProjects = [
      Project(
        title: localization.projectFallbackTitleOne,
        description: localization.projectFallbackDescOne,
        techStack: localization.projectFallbackTechOne,
      ),
      Project(
        title: localization.projectFallbackTitleTwo,
        description: localization.projectFallbackDescTwo,
        techStack: localization.projectFallbackTechTwo,
      ),
      Project(
        title: localization.projectFallbackTitleThree,
        description: localization.projectFallbackDescThree,
        techStack: localization.projectFallbackTechThree,
      ),
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                localization.projectsTitle,
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              StreamBuilder<List<Project>>(
                stream: service.watchProjects(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text(
                      localization.projectsLoading,
                      style: textTheme.bodyLarge?.copyWith(color: const Color(0xFF94A3B8)),
                    );
                  }

                  final data = snapshot.hasError ? <Project>[] : snapshot.data ?? [];
                  final projects = data.isNotEmpty ? data : fallbackProjects;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (data.isEmpty)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Text(
                            localization.projectsEmpty,
                            style: textTheme.bodyMedium?.copyWith(
                              color: const Color(0xFF94A3B8),
                            ),
                          ),
                        ),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final isCompact = constraints.maxWidth < 760;
                          final cardWidth = isCompact ? constraints.maxWidth : 340;

                          return Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            children: projects
                                .map((project) => SizedBox(
                                      width: cardWidth,
                                      child: ProjectCard(project: project),
                                    ))
                                .toList(),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
