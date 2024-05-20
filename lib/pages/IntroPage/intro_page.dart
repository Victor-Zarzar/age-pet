import "package:age_pet/pages/AppPage/app_page.dart";
import "package:age_pet/components/AppAssets/app_assets.dart";
import "package:age_pet/components/AppTheme/app_theme.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:getwidget/getwidget.dart';

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
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: SizedBox(
        height: myHeight,
        width: myWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ImageOne.asset(),
            Text(
              "Calcule a Idade do Seu Pet",
              style: GoogleFonts.jetBrainsMono(
                textStyle: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: FontTextColor.primaryColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: GFButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AppPage()),
                  );
                },
                text: "Iniciar",
                textStyle: TextStyle(
                  color: FontTextColor.secondaryColor,
                  fontFamily: GoogleFonts.jetBrainsMono().fontFamily,
                  fontSize: 14,
                ),
                color: ButtonColor.primaryColor,
                shape: GFButtonShape.pills,
                size: GFSize.LARGE,
                blockButton: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
