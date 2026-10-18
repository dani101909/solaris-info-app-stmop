sealed class ContentBlock {
  const ContentBlock();
}

class HeadingBlock extends ContentBlock {
  final String text;

  const HeadingBlock(this.text);
}

class ParagraphBlock extends ContentBlock {
  final String text;

  const ParagraphBlock(this.text);
}

class BulletItem {
  final String? label;
  final String text;

  const BulletItem(this.text, {this.label});
}

class BulletListBlock extends ContentBlock {
  final List<BulletItem> items;

  const BulletListBlock(this.items);
}

class ImageBlock extends ContentBlock {
  final String asset;
  final String? caption;

  const ImageBlock(this.asset, {this.caption});
}

class TableBlock extends ContentBlock {
  final List<String> headers;
  final List<List<String>> rows;

  const TableBlock({required this.headers, required this.rows});
}

class Topic {
  final String id;
  final String title;
  final String? subtitle;
  final String? pdfAsset;
  final List<ContentBlock> blocks;
  final List<Topic> subtopics;

  const Topic({
    required this.id,
    required this.title,
    this.subtitle,
    this.pdfAsset,
    this.blocks = const [],
    this.subtopics = const [],
  });

  bool get hasSubtopics => subtopics.isNotEmpty;
}