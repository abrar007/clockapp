import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonWidget extends StatelessWidget {
  String title = "";
  Color textColor = const Color.fromRGBO(255, 255, 255, 1.00);
  double radius = 0.0;
  Color bgColor = const Color.fromRGBO(241, 119, 82, 1.00);
  double height = 0.0;
  double width = 0.0;
  Gradient gradient =
      LinearGradient(colors: [Color(0x00fc0441), Color(0x000f6da8)]);
  final VoidCallback onButtonPressed;

  ButtonWidget(
      {Key? key,
      required this.gradient,
      required this.title,
      required this.radius,
      required this.height,
      required this.width,
      required this.bgColor,
      required this.onButtonPressed,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(radius),
        ),
        height: height,
        width: width,
        child: ButtonTheme(
          //buttonColor: this.bgColor,
          child: ElevatedButton(
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius)),

                //side: BorderSide(color: Colors.red)
              )),
              backgroundColor: MaterialStateProperty.all(bgColor),
            ),
            onPressed: () => onButtonPressed(),
          ),
        ));
  }
}
