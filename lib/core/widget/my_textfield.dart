import 'package:flutter/material.dart';

Widget myTextFormField(
    {required String hintText,
      required IconData icon,
      required TextInputType textInputType,
      required int maxLine,
      required int maxLength,
      required TextEditingController textEditingController,
      required bool enable, required String? Function(dynamic value) validator}) {
  return TextFormField(
    validator: validator,
    textAlign: TextAlign.right,
    maxLength: maxLength,
    maxLines: maxLine,
    cursorColor: Colors.grey,
   // textInputAction: TextInputAction.go,
    controller: textEditingController,
    keyboardType: textInputType,
    decoration: InputDecoration(
      counterText: "",
      hintText: hintText,
      hintStyle: const TextStyle(fontFamily: 'cairo'),
      suffixIcon: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: const Color(0xff657c90)),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      prefixIcon: enable
          ? SizedBox(
          width: 20,
          height: 20,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("asset/images/img_5.png"),
          ))
          : null,
      prefixText: enable ? "+963" : null,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.transparent)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.transparent)),
      //errorText: " Error ",
      errorBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.transparent)) ,
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.transparent)),
      fillColor: Colors.blueGrey.shade50,
      filled: true,
      alignLabelWithHint: true,
      border: InputBorder.none,
    ),
  );
}