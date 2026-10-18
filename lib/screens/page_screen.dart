import 'package:flutter/material.dart';
import 'package:pdfrx/pdfrx.dart' show PdfViewer, PdfViewerParams;
import '../models/topic.dart';
import '../widgets/app_drawer.dart';

class PageScreen extends StatelessWidget {
  final Topic topic;
  final ValueChanged<Topic> onSelect;

  const PageScreen({super.key, required this.topic, required this.onSelect});

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Solaris')),
      drawer: AppDrawer(selectedId: topic.id, onSelect: onSelect),
      body: topic.pdfAsset == null
          ? _content(context)
          : _pdf(context, topic.pdfAsset!),
    );
  }

    Widget _content(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(topic.title, style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 16),
        for (final block in topic.blocks) _buildBlock(context, block),
      ],
    );
  }

  Widget _pdf(BuildContext context, String asset) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              topic.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ),
        Expanded(
  child: PdfViewer.asset(
    asset,
    params: PdfViewerParams(
      errorBannerBuilder: (context, error, stackTrace, documentRef) =>
          Center(child: Text('$error')),
    ),
  ),
),
      ],
    );
  }

  Widget _buildBlock(BuildContext context, ContentBlock block) {
    return switch (block) {
      HeadingBlock(:final text) => _heading(context, text),
      ParagraphBlock(:final text) => _paragraph(context, text),
      BulletListBlock(:final items) => _bullets(context, items),
      ImageBlock(:final asset, :final caption) => _image(context, asset, caption),
      TableBlock(:final headers, :final rows) => _table(context, headers, rows),
    };
  }

  Widget _heading(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _paragraph(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.5),
      ),
    );
  }

  Widget _bullets(BuildContext context, List<BulletItem> items) {
    final style = Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.5);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          for (final item in items)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('•', style: style),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          if (item.label != null)
                            TextSpan(
                              text: '${item.label} ',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          TextSpan(text: item.text),
                        ],
                      ),
                      style: style,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _image(BuildContext context, String asset, String? caption) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          Image.asset(asset),
          if (caption != null)
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                caption,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }

  Widget _table(
    BuildContext context,
    List<String> headers,
    List<List<String>> rows,
  ) {
    final colors = Theme.of(context).colorScheme;
    final style = Theme.of(context).textTheme.bodyMedium;

    TableRow buildRow(List<String> cells, {bool header = false}) {
      return TableRow(
        decoration:
            header ? BoxDecoration(color: colors.surfaceContainerHighest) : null,
        children: [
          for (final cell in cells)
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                cell,
                style: header
                    ? style?.copyWith(fontWeight: FontWeight.bold)
                    : style,
              ),
            ),
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Table(
          defaultColumnWidth: const FixedColumnWidth(150),
          defaultVerticalAlignment: TableCellVerticalAlignment.top,
          border: TableBorder.all(color: colors.outlineVariant),
          children: [
            buildRow(headers, header: true),
            for (final row in rows) buildRow(row),
          ],
        ),
      ),
    );
  }
}