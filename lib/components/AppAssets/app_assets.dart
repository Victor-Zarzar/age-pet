import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ImageOne {
  ImageOne._();

  static Image asset() {
    return Image.asset(
      'assets/imgs/pets.png',
      height: 210,
      width: 310,
      semanticLabel: 'image_pet'.tr(),
    );
  }
}

class ImageTwo {
  ImageTwo._();

  static Image asset() {
    return Image.asset(
      'assets/imgs/cat.png',
      height: 90,
      width: 110,
      semanticLabel: 'image_cat'.tr(),
    );
  }
}

class ImageThree {
  ImageThree._();

  static Image asset() {
    return Image.asset(
      'assets/imgs/dog.png',
      height: 90,
      width: 110,
      semanticLabel: 'image_dog'.tr(),
    );
  }
}
