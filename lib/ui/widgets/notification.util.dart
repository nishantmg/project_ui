
import 'package:flutter/material.dart';

class MessageBox extends SnackBar {
  static showMessage(message)
  {
    return SnackBar(
      content: Text(
          message,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
      ),
      backgroundColor: Colors.green,
    );
  }

  static showError(errorMessage) {
    return SnackBar(
      content: Text(errorMessage,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
        ),
      ),
      backgroundColor: Colors.red,

    );
  }
}
