import 'package:flutter/material.dart';

class ImageOne {
  ImageOne._();

  static Image asset() {
    return Image.asset('assets/pets.png');
  }
}

class ImageTwo {
  ImageTwo._();

  static Image asset() {
    return Image.asset(
      'assets/cat.png',
      height: 130,
      width: 130,
    );
  }
}

class ImageThree {
  ImageThree._();

  static Image asset() {
    return Image.asset(
      'assets/dog.png',
      height: 130,
      width: 130,
    );
  }
}
