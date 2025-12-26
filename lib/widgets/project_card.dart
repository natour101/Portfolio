import 'package:flutter/material.dart';

import '../services/projects_service.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project.title,
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              project.description,
              style: textTheme.bodyMedium?.copyWith(height: 1.5),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.memory, size: 18, color: Color(0xFF38BDF8)),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    project.techStack,
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
    );
  }
}
