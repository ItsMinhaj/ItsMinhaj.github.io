import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMeText extends StatelessWidget {
  final TextAlign textAlign;
  final double fontSize;

  const AboutMeText({Key key, this.textAlign, this.fontSize}) : super(key: key);

  TextStyle _textStyle(double fSize, bool bold) {
    return GoogleFonts.montserrat(
      fontSize: fSize ?? 14,
      fontWeight: !bold ? FontWeight.w100 : FontWeight.w400,
      letterSpacing: 1.0,
      height: 2.0,
      color: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign ?? TextAlign.left,
      text: TextSpan(children: [
        TextSpan(
            text:
                "Hi There! This is Minhajul Islam, a Flutter developer and UI Designer from Bangladesh.",
            style: MediaQuery.of(context).size.width < 600
                ? _textStyle(fontSize, true)
                : _textStyle(fontSize + 6, true)),
        TextSpan(
          text:
              "\n\nBefore starting flutter development I worked on Android development. I worked on it around one year with native android. After that I decided to shift on the flutter. I have been practicing with flutter for One year by myself..I am working with a team for enriching my knowledge and experience so that i can serve myself at best and try to contribute at GitHub as a open source contributor and getting valuable learning experiences.\n\nI have completed Bsc in Computer Science & Engineering Degree from ",
          style: MediaQuery.of(context).size.width < 600
              ? _textStyle(fontSize, false)
              : _textStyle(fontSize + 2, false),
        ),
        TextSpan(
          text: "City University Of Bangladesh",
          style: MediaQuery.of(context).size.width < 600
              ? _textStyle(fontSize, true)
              : _textStyle(fontSize + 2, true),
        ),
        TextSpan(
          text: ", Founder/CEO of ",
          style: MediaQuery.of(context).size.width < 600
              ? _textStyle(fontSize, false)
              : _textStyle(fontSize + 2, false),
        ),
        TextSpan(
          text: "Flutter Mates,",
          style: MediaQuery.of(context).size.width < 600
              ? _textStyle(fontSize, true)
              : _textStyle(fontSize + 2, true),
        ),
        TextSpan(
          text: " and",
          style: MediaQuery.of(context).size.width < 600
              ? _textStyle(fontSize, false)
              : _textStyle(fontSize + 2, false),
        ),
        TextSpan(
          text: " Leading Instructor !",
          style: MediaQuery.of(context).size.width < 600
              ? _textStyle(fontSize, true)
              : _textStyle(fontSize + 2, true),
        )
      ]),
    );
  }
}
