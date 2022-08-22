import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final bool? estado;
  final TextEditingController? controller;
  final FocusNode? focus;

  const TextBox(
      {@required this.estado, @required this.controller, @required this.focus});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 800),
      width: estado! ? size.width * 0.45 : 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black12,
        ),
        height: 40,
        child: TextField(
          focusNode: focus,
          controller: controller,
          keyboardType: TextInputType.text,
          cursorColor: Colors.black,
          decoration: const InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding:
                EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            hintText: "Busca algun tema...",
          ),
        ),
      ),
    );
  }
}
