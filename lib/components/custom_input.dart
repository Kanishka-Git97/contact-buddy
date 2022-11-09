import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key? key,
      required this.hintTxt,
      required this.lableTxt,
      required this.mode,
      required this.controller})
      : super(key: key);

  final String hintTxt;
  final String lableTxt;
  final bool mode;
  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(40, 74, 74, 74),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              labelText: widget.lableTxt,
              hintText: widget.hintTxt,
              hintStyle: const TextStyle(
                fontSize: 15,
              ),
              suffixIcon: IconButton(
                onPressed: () =>
                    setState(() => isHiddenPassword = !isHiddenPassword),
                icon: Icon(
                    isHiddenPassword ? Icons.visibility : Icons.visibility_off),
                color: widget.mode
                    ? const Color.fromARGB(255, 96, 96, 96)
                    : Colors.transparent,
              )),
          obscureText: widget.mode ? isHiddenPassword : false,
        ),
      ),
    );
  }
}
