import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/models/education.dart';

class EducationDetailScreen extends StatelessWidget {
  const EducationDetailScreen({required this.education, super.key});

  final Education education;

  @override
  Widget build(BuildContext context) {
    final periodText = education.endYear != null
        ? '${education.startYear} - ${education.endYear}'
        : '${education.startYear} - Sekarang';

    return Scaffold(
      appBar: AppBar(
        title: Text(education.institution),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              education.institution,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Degree: ${education.degree}',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.indigo[700],
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Period: $periodText',
              style: const TextStyle(fontSize: 15.0, color: Colors.black87),
            ),
            if (education.starCount > 0) ...[
              const SizedBox(height: 8.0),
              Row(
                children: [
                  const Icon(Icons.star, size: 18, color: Colors.amber),
                  const SizedBox(width: 4),
                  Text(
                    '${education.starCount} star${education.starCount > 1 ? 's' : ''}'
                    '${education.starredByNames.isNotEmpty ? ' (${education.starredByNames})' : ''}',
                    style: const TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 16.0),
            const Text(
              'Description:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4.0),
            Text(
              education.description.trim().isEmpty
                  ? '-'
                  : education.description,
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
