import 'package:flutter/material.dart';

const kButtonTextStyle = TextStyle(
  fontSize: 18.0,
  color: Colors.white,
  fontFamily: "Varela Round",
  fontWeight: FontWeight.bold
);

const kLogoTextStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 100.0,
  fontFamily: "Italianno",
);

const kRobotoTextStyle = TextStyle(
  color: Color(0xFF69c730),
  fontWeight: FontWeight.bold,
  fontSize: 20.0,
  fontFamily: "Roboto",
);

const kRoundedTextStyle = TextStyle(
  color: Color(0xFF69c730),
  fontWeight: FontWeight.bold,
  fontSize: 20.0,
  fontFamily: "Varela Round",
);

const kInputFieldDecoration = InputDecoration(
    labelText: "First Name",
    hintText: "First name",
    labelStyle: TextStyle(
      color: Color(0xFF69c730),
    ),
    enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white30)
    ),
    focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white54)
    )
);