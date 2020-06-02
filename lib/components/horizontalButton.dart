import 'package:flutter/material.dart';

class HorizontalButton extends StatelessWidget {
  const HorizontalButton({this.color, this.buttonText, this.onPress});

  final Color color;
  final String buttonText;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: this.color,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            this.buttonText,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
