import 'package:age_pet/features/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarouselPage extends StatefulWidget {
  const CarouselPage({super.key});

  @override
  State<CarouselPage> createState() => _CarouselPageState();
}

List<String> images = [
  "assets/imgs/image-1.png",
  "assets/imgs/image-2.png",
  "assets/imgs/image-3.png",
  "assets/imgs/image-4.png",
  "assets/imgs/image-5.png",
  "assets/imgs/image-6.png",
  "assets/imgs/image-7.png",
  "assets/imgs/image-8.png",
  "assets/imgs/image-9.png",
  "assets/imgs/image-10.png",
  "assets/imgs/image-11.png",
  "assets/imgs/image-12.png",
  "assets/imgs/image-13.png",
  "assets/imgs/image-14.png",
  "assets/imgs/image-15.png",
  "assets/imgs/image-16.png",
];

class _CarouselPageState extends State<CarouselPage> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      height: myHeight,
      width: myWidth,
      child: Scaffold(
        backgroundColor:
            isDarkMode ? AppTheme.thirdColor : AppTheme.primaryColor,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Text(
                "explore_pets_title".tr(),
                textAlign: TextAlign.center,
                style: GoogleFonts.jetBrainsMono(
                  textStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode
                        ? FontTextColor.secondaryColor
                        : FontTextColor.primaryColor,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: SizedBox(
                    height: 240,
                    width: myWidth * 0.9,
                    child: CarouselView(
                      itemExtent: 200,
                      children: List.generate(
                        images.length,
                        (index) => Image.asset(
                          images[index],
                          fit: BoxFit.cover,
                          semanticLabel: "image_${index + 1}_label".tr(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
