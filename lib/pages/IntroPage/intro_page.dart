import "package:age_pet/components/DartkTheme/provider_app.dart";
import "package:age_pet/pages/AppPage/app_page.dart";
import "package:age_pet/components/AppAssets/app_assets.dart";
import "package:age_pet/components/AppTheme/app_theme.dart";
import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:getwidget/getwidget.dart';
import "package:provider/provider.dart";

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Consumer<UiProvider>(
      builder: (context, notifier, child) {
        return Scaffold(
          backgroundColor:
              notifier.isDark ? AppTheme.thirdColor : AppTheme.primaryColor,
          body: SizedBox(
            height: myHeight,
            width: myWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ImageOne.asset(),
                Text(
                  "intro_title".tr(),
                  style: GoogleFonts.jetBrainsMono(
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: notifier.isDark
                          ? FontTextColor.secondaryColor
                          : FontTextColor.primaryColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: SizedBox(
                    height: 35,
                    width: 180,
                    child: GFButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AppPage(),
                          ),
                        );
                      },
                      text: "intro_button".tr(),
                      textStyle: TextStyle(
                        color: notifier.isDark
                            ? FontTextColor.primaryColor
                            : FontTextColor.secondaryColor,
                        fontFamily: GoogleFonts.jetBrainsMono().fontFamily,
                        fontSize: 11,
                      ),
                      color: notifier.isDark
                          ? ButtonColor.secondaryColor
                          : ButtonColor.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
