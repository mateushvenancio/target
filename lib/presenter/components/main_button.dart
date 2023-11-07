import 'package:flutter/material.dart';
import 'package:target/constants.dart';

class MainButton extends StatelessWidget {
  final String label;
  final Function() onPressed;

  const MainButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        elevation: MaterialStatePropertyAll(
          AppConstants.elevation,
        ),
        backgroundColor: MaterialStatePropertyAll(
          AppColors.green,
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(45),
            ),
          ),
        ),
        padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 48),
        ),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
