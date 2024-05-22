import 'package:flutter/material.dart';

class ImageOne {
  ImageOne._();

  static Image asset() {
    return Image.asset(
      'assets/pets.png',
      height: 210,
      width: 310,
    );
  }
}

class ImageTwo {
  ImageTwo._();

  static Image asset() {
    return Image.asset(
      'assets/cat.png',
      height: 90,
      width: 110,
    );
  }
}

class ImageThree {
  ImageThree._();

  static Image asset() {
    return Image.asset(
      'assets/dog.png',
      height: 90,
      width: 110,
    );
  }
}
