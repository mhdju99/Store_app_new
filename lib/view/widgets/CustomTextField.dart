// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final String? initial;
  Icon prefixIcon;
  Widget? suffixIcon;
  String? Function(String?)? validate;
  void Function(String?)? onSave;
  void Function(String?)? onchange;
  TextInputType? type;
  CustomTextField(
      {Key? key,
      required this.text,
      this.prefixIcon = const Icon(Icons.person),
      this.suffixIcon ,
      this.type,
      this.initial,
      this.validate,
      this.onchange,
      this.onSave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      onChanged: onchange,
      initialValue: initial,
      keyboardType: type,
      obscureText: type == TextInputType.visiblePassword ? true : false,
      decoration: InputDecoration(
        
        suffixIcon:suffixIcon,
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        prefixIcon: prefixIcon,
        labelText: text,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        labelStyle: const TextStyle(
          fontSize: 14,
          fontFamily: "Metropolis",
          fontWeight: FontWeight.w200,
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(18)),
        filled: true,
        fillColor: Colors.grey[300],
      ),
      validator: validate,
      onSaved: onSave,
      autovalidateMode: AutovalidateMode.disabled,
    );
  }
}
