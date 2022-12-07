import 'package:flutter/material.dart';

class CustomInputPass extends StatefulWidget {
  const CustomInputPass({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.suffixIcon,
    this.keyBoardType,
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
  final IconData? suffixIcon;

  @override
  State<CustomInputPass> createState() => _CustomInputPassState();
}

class _CustomInputPassState extends State<CustomInputPass> {
  late bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autofocus: true,
        keyboardType: widget.keyBoardType,
        obscureText: obscureText,
        initialValue: '',
        textCapitalization: TextCapitalization.words,
        onChanged: (value) => widget.formValues[widget.formProperty] = value,
        // validator: (value) {
        //   if (value!.isEmpty) return 'Este campo es requerido';
        //   return value.length < 0 ? 'Minimo 3 letras' : null;
        // },
        autovalidateMode: AutovalidateMode.always,
        decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: widget.labelText,
          helperText: widget.helperText,
          suffixIcon: IconButton(
              icon: Icon(
                obscureText ? Icons.visibility : Icons.visibility_off,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              }),
          icon: widget.icon == null ? null : Icon(widget.icon),
        ));
  }
}
