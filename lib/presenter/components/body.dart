import 'package:flutter/material.dart';
import 'package:target/constants.dart';

class Body extends StatelessWidget {
  final Widget child;
  const Body({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.gradientStartColor,
            AppColors.gradientEndColor,
          ],
        ),
      ),
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height,
        minWidth: MediaQuery.of(context).size.width,
      ),
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 64,
          ),
          child: child,
        ),
      ),
    );
  }
}
