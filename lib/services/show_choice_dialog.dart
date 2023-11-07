import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

showChoiceDialog({
  required BuildContext context,
  required String text,
  required Function() onYes,
}) {
  return showDialog(
    context: context,
    builder: (_) => _ChoiceDialog(
      text: text,
      onYes: onYes,
    ),
  );
}

class _ChoiceDialog extends StatelessWidget {
  final String text;
  final Function() onYes;

  const _ChoiceDialog({
    required this.text,
    required this.onYes,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Atenção'),
      content: Text(text),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: const Text('NÃO'),
        ),
        ElevatedButton(
          onPressed: () {
            context.pop();
            onYes();
          },
          child: const Text('SIM'),
        ),
      ],
    );
  }
}
