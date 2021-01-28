import 'package:flutter/material.dart';

import 'common_size.dart';

InputDecoration textInputDecor(String hintText) {
  return InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: Colors.grey[100],
      enabledBorder: activeInputBorder(),
      focusedBorder: activeInputBorder(),
      errorBorder: errorInputBorder(),
      focusedErrorBorder: errorInputBorder());
}

OutlineInputBorder activeInputBorder() {
  return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(common_s_gap));
}
OutlineInputBorder errorInputBorder() {
  return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.redAccent),
      borderRadius: BorderRadius.circular(common_s_gap));
}
