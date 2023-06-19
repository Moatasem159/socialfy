import 'package:flutter/material.dart';

class MainTextFormField extends StatelessWidget {
  final TextEditingController ?controller;
  final String? Function(String ?value)? validator;
  final TextInputType? inputType;
  final String? hintText;
  final bool obscure;
  final ValueChanged<String> ?onChange;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  const MainTextFormField({
    Key? key,
    this.controller,
    this.validator,
    this.inputType,
    this.obscure=false,
    this.suffixIcon,
    this.hintText,
    this.prefixIcon,
    this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width-50,
      child: TextFormField(
        onChanged: onChange,
        style: TextStyle(
          color: Theme.of(context).primaryColor
        ),
      controller: controller,
      validator: validator,
      obscureText: obscure,
      keyboardType: inputType,
      cursorColor: Theme.of(context).primaryColor,
      textAlignVertical: TextAlignVertical.center,
        decoration:  InputDecoration(
            suffixIcon: suffixIcon,
            hintText: hintText,
          prefixIcon:prefixIcon,
        ),),);
  }
}





class NoneBorderTextFormField extends StatelessWidget {
  final TextEditingController ?controller;
  final double size;
  final String? hintText;
  const NoneBorderTextFormField({Key? key,required this.controller, required this.size, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width - size,
        child: TextFormField(
          controller: controller,
          cursorColor: Theme.of(context).primaryColor,
          style: const TextStyle(height: 1.5),
          textInputAction: TextInputAction.newline,
          maxLines: null,
          decoration:  InputDecoration(
            hintText: hintText,
            focusedBorder: const UnderlineInputBorder(
                borderSide:
                BorderSide(style: BorderStyle.none)),
            enabledBorder: const UnderlineInputBorder(
                borderSide:
                BorderSide(style: BorderStyle.none)),
            errorBorder: const UnderlineInputBorder(
                borderSide:
                BorderSide(style: BorderStyle.none)),
          ),
        ));
  }
}

