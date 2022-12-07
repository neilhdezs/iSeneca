import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.suffixIcon,
    this.keyBoardType,
    this.obscureText = false,
    required this.formProperty,
    required this.formValues,
  }) : super(key: key);

  final String formProperty;
  final Map<String, String> formValues;
  final String? helperText; // Lo que sale dabajo
  final String? hintText; // Lo que sale sombreado
  final IconData? icon;
  final TextInputType? keyBoardType;
  final String? labelText; // Cuando no hay nada lo muestra encima
  final bool obscureText;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      keyboardType: keyBoardType,
      obscureText: obscureText,
      initialValue: '',
      textCapitalization: TextCapitalization.words,
      onChanged: (value) => formValues[formProperty] = value,
      // validator: (value) {
      //   if (value!.isEmpty) return 'Este campo es requerido';
      //   return value.length < 3 ? 'Minimo 3 letras' : null;
      // },
      autovalidateMode: AutovalidateMode.always,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
        // prefixIcon:
        icon: icon == null ? null : Icon(icon),
      ),
    );
  }
}
