import 'package:flutter/material.dart';

class MainTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final Widget? icon;
  final bool? obscure;
  final Function(String value)? onSubmit;
  final FocusNode? focusNode;

  const MainTextField({
    super.key,
    this.label,
    this.hint,
    this.icon,
    this.obscure,
    this.controller,
    this.onSubmit,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Container(
            padding: const EdgeInsets.only(
              left: 8,
              bottom: 6,
            ),
            child: Text(
              label ?? '',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        TextField(
          focusNode: focusNode,
          obscureText: obscure ?? false,
          controller: controller,
          onSubmitted: onSubmit,
          decoration: InputDecoration(
            errorStyle: const TextStyle(color: Colors.white),
            fillColor: Colors.white,
            filled: true,
            prefixIconColor: Colors.black,
            hintText: hint,
            contentPadding: EdgeInsets.symmetric(
              horizontal: icon == null ? 8 : 0,
            ),
            prefixIcon: icon,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
