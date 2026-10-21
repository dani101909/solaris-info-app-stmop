import 'package:flutter/material.dart';
import '../models/topic.dart';

String _letter(int index) => String.fromCharCode(65 + index);

class QuizScreen extends StatefulWidget {
  final String title;
  final List<QuizQuestion> questions;

  const QuizScreen({super.key, required this.title, required this.questions});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<int?> _answers;
  int _current = 0;
  bool _finished = false;

  @override
  void initState() {
    super.initState();
    _answers = List<int?>.filled(widget.questions.length, null);
  }

  int get _unanswered => _answers.where((a) => a == null).length;

  int get _correct {
    var count = 0;
    for (var i = 0; i < widget.questions.length; i++) {
      if (_answers[i] == widget.questions[i].correctIndex) count++;
    }
    return count;
  }

  void _select(int option) => setState(() => _answers[_current] = option);

  void _restart() {
    setState(() {
      _answers = List<int?>.filled(widget.questions.length, null);
      _current = 0;
      _finished = false;
    });
  }

  Future<void> _finish() async {
    if (_unanswered > 0) {
      final confirm = await showDialog<bool>(
        context: context,
        builder: (dialogContext) => AlertDialog(
          title: const Text('Terminar el examen'),
          content: Text(
            _unanswered == 1
                ? 'Falta 1 pregunta por responder. Las preguntas sin responder cuentan como incorrectas.'
                : 'Faltan $_unanswered preguntas por responder. Las preguntas sin responder cuentan como incorrectas.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, false),
              child: const Text('Seguir respondiendo'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(dialogContext, true),
              child: const Text('Terminar'),
            ),
          ],
        ),
      );
      if (confirm != true) return;
    }
    if (!mounted) return;
    setState(() => _finished = true);
  }

  @override
  Widget build(BuildContext context) {
    return _finished ? _results(context) : _question(context);
  }

  Widget _question(BuildContext context) {
    final theme = Theme.of(context);
    final question = widget.questions[_current];
    final total = widget.questions.length;
    final isLast = _current == total - 1;

    return Column(
      children: [
        Expanded(
          child: ListView(
            key: ValueKey('question-$_current'),
            padding: const EdgeInsets.all(16),
            children: [
              Text(widget.title, style: theme.textTheme.headlineSmall),
              const SizedBox(height: 16),
              Text(
                'Pregunta ${_current + 1} de $total',
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              LinearProgressIndicator(value: (_current + 1) / total),
              const SizedBox(height: 20),
              Text(
                question.text,
                style: theme.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold, height: 1.4),
              ),
              const SizedBox(height: 16),
              for (var i = 0; i < question.options.length; i++)
                _option(context, i, question.options[i]),
            ],
          ),
        ),
        SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed:
                        _current == 0 ? null : () => setState(() => _current--),
                    child: const Text('Anterior'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton(
                    onPressed:
                        isLast ? _finish : () => setState(() => _current++),
                    child: Text(isLast ? 'Terminar' : 'Siguiente'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _option(BuildContext context, int index, String text) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final selected = _answers[_current] == index;
    final radius = BorderRadius.circular(12);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: selected ? colors.primaryContainer : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: radius,
          side: BorderSide(
            color: selected ? colors.primary : colors.outlineVariant,
            width: selected ? 2 : 1,
          ),
        ),
        child: InkWell(
          borderRadius: radius,
          onTap: () => _select(index),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${_letter(index)})',
                  style: theme.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    text,
                    style: theme.textTheme.bodyLarge?.copyWith(height: 1.4),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _results(BuildContext context) {
    final theme = Theme.of(context);
    final total = widget.questions.length;
    final correct = _correct;
    final incorrect = total - correct;
    final unanswered = _unanswered;

    return ListView(
      key: const ValueKey('results'),
      padding: const EdgeInsets.all(16),
      children: [
        Text(widget.title, style: theme.textTheme.headlineSmall),
        const SizedBox(height: 16),
        Text(
          'Resultados',
          style:
              theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text('Correctas: $correct de $total', style: theme.textTheme.bodyLarge),
        Text(
          unanswered > 0
              ? 'Incorrectas: $incorrect (incluye $unanswered sin responder)'
              : 'Incorrectas: $incorrect',
          style: theme.textTheme.bodyLarge,
        ),
        const SizedBox(height: 16),
        FilledButton(onPressed: _restart, child: const Text('Intentar de nuevo')),
        const SizedBox(height: 24),
        Text(
          'Detalle por pregunta',
          style:
              theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        for (var i = 0; i < total; i++) _review(context, i),
      ],
    );
  }

  Widget _review(BuildContext context, int index) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final question = widget.questions[index];
    final answer = _answers[index];
    final isCorrect = answer == question.correctIndex;
    final bodyStyle = theme.textTheme.bodyMedium?.copyWith(height: 1.4);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  isCorrect ? Icons.check_circle : Icons.cancel,
                  color: isCorrect ? Colors.green.shade700 : colors.error,
                ),
                const SizedBox(width: 8),
                Text(
                  'Pregunta ${index + 1}',
                  style: theme.textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              question.text,
              style: bodyStyle?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              answer == null
                  ? 'Tu respuesta: sin responder'
                  : 'Tu respuesta: ${_letter(answer)}) ${question.options[answer]}',
              style: bodyStyle,
            ),
            if (!isCorrect) ...[
              const SizedBox(height: 4),
              Text(
                'Respuesta correcta: ${_letter(question.correctIndex)}) ${question.options[question.correctIndex]}',
                style: bodyStyle,
              ),
            ],
            const SizedBox(height: 8),
            Text('Explicación: ${question.explanation}', style: bodyStyle),
          ],
        ),
      ),
    );
  }
}