import "package:age_pet/pages/HomePage/home_page.dart";
import "package:age_pet/pages/components/AppAssets/app_assets.dart";
import "package:age_pet/pages/components/AppTheme/app_theme.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

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
              padding: EdgeInsets.symmetric(horizontal: myWidth * 0.14),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: myWidth * 0.05, vertical: myHeight * 0.030),
                  child: Container(
                    width: myWidth * 0.4,
                    height: myHeight * 0.05,
                    decoration: BoxDecoration(
                      color: ButtonColor.primaryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        "Página Inicial",
                        style: GoogleFonts.jetBrainsMono(
                          textStyle: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: FontTextColor.secondaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
