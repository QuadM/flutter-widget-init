import 'package:flutter/material.dart';

Color kTextColor = Colors.black87;
Color kSecondaryColor = Colors.blueGrey.shade900;

var kTextFieldDecoration = InputDecoration(
  helperMaxLines: 1,
  hintStyle: TextStyle(color: kTextColor),
  labelStyle: TextStyle(color: kTextColor),
  fillColor: kTextColor,
  focusColor: kTextColor,
  hoverColor: kTextColor,
  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
  border: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black),
    borderRadius: BorderRadius.all(Radius.circular(999.0)),
  ),
  enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFF6F6F6), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kSecondaryColor, width: 2.0),
    borderRadius: const BorderRadius.all(Radius.circular(999.0)),
  ),
);
