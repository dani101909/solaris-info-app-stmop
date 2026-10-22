import 'package:flutter/material.dart';

import '../theme.dart';
import '../data/content.dart';
import '../models/topic.dart';

class AppDrawer extends StatelessWidget {
  final String selectedId;
  final ValueChanged<Topic> onSelect;

  const AppDrawer({
    super.key,
    required this.selectedId,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
              child: Container(
                width: double.infinity,
                color: solarisBlue,
                padding: EdgeInsets.fromLTRB(
                  16,
                  MediaQuery.paddingOf(context).top + 24,
                  16,
                  24,
                ),
                child: Text(
                  'Solaris',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Divider(),
            for (final topic in appTopics) _buildItem(context, topic),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, Topic topic, {int depth = 0}) {
    final padding = depth == 0
        ? null
        : EdgeInsets.only(left: 16.0 + 16 * depth, right: 16);

    if (!topic.hasSubtopics) {
      return ListTile(
        contentPadding: padding,
        title: Text(topic.title),
        selected: topic.id == selectedId,
        onTap: () => _select(context, topic),
      );
    }

    return ExpansionTile(
      tilePadding: padding,
      title: Text(topic.title),
      subtitle: topic.subtitle == null ? null : Text(topic.subtitle!),
      initiallyExpanded: _containsSelected(topic),
      children: [
        for (final sub in topic.subtopics)
          _buildItem(context, sub, depth: depth + 1),
      ],
    );
  }

  bool _containsSelected(Topic topic) {
    return topic.subtopics.any(
      (t) => t.id == selectedId || _containsSelected(t),
    );
  }

  void _select(BuildContext context, Topic topic) {
    Navigator.of(context).pop();
    onSelect(topic);
  }
}