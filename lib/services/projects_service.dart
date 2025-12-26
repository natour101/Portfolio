import 'package:cloud_firestore/cloud_firestore.dart';

class Project {
  const Project({
    required this.title,
    required this.description,
    required this.techStack,
  });

  final String title;
  final String description;
  final String techStack;

  factory Project.fromFirestore(Map<String, dynamic> data) {
    return Project(
      title: data['title'] as String? ?? '',
      description: data['description'] as String? ?? '',
      techStack: data['techStack'] as String? ?? '',
    );
  }
}

class ProjectsService {
  ProjectsService({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  Stream<List<Project>> watchProjects() {
    return _firestore.collection('projects').snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => Project.fromFirestore(doc.data()))
              .where((project) =>
                  project.title.isNotEmpty &&
                  project.description.isNotEmpty &&
                  project.techStack.isNotEmpty)
              .toList(),
        );
  }
}
