import 'package:flutter/material.dart';

import 'app_colors.dart';

class TextStyles {
  TextStyles();

  static const TextStyle appBar = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 18.0,
    color: Colors.black,
  );

  static const TextStyle errorStyle =
      TextStyle(fontWeight: FontWeight.w300, fontSize: 12.0, color: Colors.red);

  static const TextStyle hintStyle =
      TextStyle(color: Colors.grey, fontSize: 14.0, fontWeight: FontWeight.w400);
}

class BoxDecorations {
  BoxDecorations();

  static const ContainerBoxDecoration = BoxDecoration(
    borderRadius: const BorderRadius.all(
      const Radius.circular(0.0),
    ),
    color: Color(0xFFf7f7f7),
  );
}

class BorderStyles {
  BorderStyles();

  static const OutlineInputBorder textFieldBorderStyle =
      const OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      const Radius.circular(25.0),
    ),
    borderSide: const BorderSide(
      color: Colors.white24,
      width: 0.0,
    ),
  );

  static const OutlineInputBorder auctionTextFieldBorderStyle =
      const OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      const Radius.circular(25.0),
    ),
    borderSide: const BorderSide(
      color: Colors.white24,
      width: 0.0,
    ),
  );

  static const OutlineInputBorder errorBorder = const OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      const Radius.circular(25.0),
    ),
    borderSide: const BorderSide(
      color: Colors.red,
      width: 0.5,
    ),
  );
}
