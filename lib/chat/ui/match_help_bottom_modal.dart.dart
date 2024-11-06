import 'package:flutter/material.dart';
import 'package:speed_bate_frontend/primitives/text.dart';

class MatchHelpBottomModal extends StatelessWidget {
  const MatchHelpBottomModal({
    required this.debateTopic,
    super.key,
  });

  final String debateTopic;

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Topic',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(debateTopic, style: const TextStyle(fontSize: 16)),
            const SizedBox(
              height: 16,
            ),
            const Divider(),
            const SizedBox(height: 16),
            const Text(
              'How to play',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(MATCH_DESCRIPTION),
            const SizedBox(height: 16),
          ],
        ),
      );
}
