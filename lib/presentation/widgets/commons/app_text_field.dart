import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String label;
  final String hintText;
  final bool? obscureText;
  final bool? isPassword;

  const AppTextField({
    super.key,
    this.controller,
    required this.label,
    required this.hintText,
    this.obscureText = false,
    this.isPassword = false,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isObscureText = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: 15),
        TextFormField(
          controller: widget.controller,

          obscureText: widget.isPassword!
              ? isObscureText
              : false, // Conditionally set obscureText
          cursorColor: Theme.of(context).colorScheme.secondary,
          decoration: InputDecoration(
            hintText: widget.hintText,
            suffixIcon: widget.isPassword!
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObscureText = !isObscureText;
                      });
                    },
                    icon: isObscureText
                        ? Icon(
                            Icons.visibility_off,
                            size: 24,
                            color: Theme.of(context).iconTheme.color,
                          )
                        : const Icon(Icons.visibility),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
