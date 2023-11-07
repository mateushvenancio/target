import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AlertDialogType {
  info,
  error,
  success,
}

showAlertDialog(BuildContext context, String content, [AlertDialogType type = AlertDialogType.info]) {
  final result = switch (type) {
    AlertDialogType.info => _InfoMainDialog(text: content),
    AlertDialogType.error => _ErrorMainDialog(text: content),
    AlertDialogType.success => _SuccessMainDialog(text: content),
  };
  showDialog(
    context: context,
    builder: (_) => result,
  );
}

abstract class _MainDialog extends StatelessWidget {
  final String text;
  const _MainDialog({required this.text});

  Widget get icon;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          icon,
          const SizedBox(width: 8),
          const Text('Atenção'),
        ],
      ),
      content: Text(text),
      actions: [
        ElevatedButton(
          onPressed: () => context.pop(),
          child: const Text('OK'),
        ),
      ],
    );
  }
}

class _InfoMainDialog extends _MainDialog {
  const _InfoMainDialog({required super.text});
  @override
  Widget get icon => const Icon(Icons.info, color: Colors.indigo);
}

class _ErrorMainDialog extends _MainDialog {
  const _ErrorMainDialog({required super.text});
  @override
  Widget get icon => const Icon(Icons.error, color: Colors.deepOrange);
}

class _SuccessMainDialog extends _MainDialog {
  const _SuccessMainDialog({required super.text});
  @override
  Widget get icon => const Icon(Icons.check, color: Colors.green);
}
