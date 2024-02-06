import 'package:flutter/material.dart';

class InputPaintStore extends StatelessWidget {
  final TextEditingController _controller;
  final String _hintText;
  final Widget? _sifix;
  final String? Function(String?)? _validators;
  const InputPaintStore({
    super.key,
    required TextEditingController controller,
    required String hintText,
    Widget? sufix,
    String? Function(String?)? validators,
  })  : _controller = controller,
        _hintText = hintText,
        _sifix = sufix,
        _validators = validators;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _controller,
          validator: _validators,
          style: const TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            suffix: _sifix,
            border: InputBorder.none,
            hintText: _hintText,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
            ),
            errorStyle: const TextStyle(
              color: Colors.red,
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 2.0,
              ),
            ),
            hintStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}
