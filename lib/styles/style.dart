import 'package:ecloudatm/assets/assets.dart';
import 'package:flutter/material.dart';

styleText(double size, var color, bool bold) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontWeight: bold != true ? FontWeight.normal : FontWeight.bold,
  );
}

background() {
  return BoxDecoration(
    image: DecorationImage(
      image: AssetImage(assetsBackgroundLogin),
      fit: BoxFit.fill,
    ),
  );
}

decorationTextfield(String title) {
  return new InputDecoration(
    labelText: title,
    fillColor: Colors.white,
    hintStyle: TextStyle(fontSize: 17.0, color: Colors.white60),
    labelStyle: TextStyle(fontSize: 17.0, color: Colors.white60),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white60),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
  );
}

decorationContainer() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    border: Border.all(
      color: Colors.grey, //                   <--- border color
      width: 1.0,
    ),
  );
}

decorationTextfield1(String title) {
  return new InputDecoration(
    labelText: title,
    fillColor: Colors.grey,
    border: new OutlineInputBorder(
      borderRadius: new BorderRadius.circular(5),
      borderSide: BorderSide(color: Colors.grey),
    ),
    hintStyle: TextStyle(fontSize: 17.0, color: Colors.grey),
    labelStyle: TextStyle(fontSize: 17.0, color: Colors.grey),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: new BorderRadius.circular(5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: new BorderRadius.circular(5),
      borderSide: BorderSide(color: Colors.grey),
    ),
  );
}
