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

class QuizQuestion {
  final String text;
  final List<String> options;
  final int correctIndex;
  final String explanation;
  const QuizQuestion({
    required this.text,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });
}

class Topic {
  final String id;
  final String title;
  final String? subtitle;
  final String? pdfAsset;
  final List<ContentBlock> blocks;
  final List<QuizQuestion> quiz;
  final List<Topic> subtopics;

  const Topic({
    required this.id,
    required this.title,
    this.subtitle,
    this.pdfAsset,
    this.blocks = const [],
    this.quiz = const [],
    this.subtopics = const [],
  });

  bool get hasSubtopics => subtopics.isNotEmpty;
  bool get hasQuiz => quiz.isNotEmpty;
}