import 'package:age_pet/components/AppAssets/app_assets.dart';
import 'package:age_pet/components/AppTheme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

class CatPage extends StatefulWidget {
  const CatPage({super.key});

  @override
  State<CatPage> createState() => _CatPageState();
}

class _CatPageState extends State<CatPage> {
  TextEditingController humanAgeController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  int? felineAge;

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: SizedBox(
        height: myHeight,
        width: myWidth,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ImageTwo.asset(),
                const SizedBox(height: 20),
                Text(
                  'textcat'.tr(),
                  style: GoogleFonts.jetBrainsMono(
                    textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: FontTextColor.primaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: humanAgeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'labelcat'.tr(),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'secondlabelcat'.tr(),
                  ),
                ),
                const SizedBox(height: 10),
                GFButton(
                  onPressed: () {
                    if (humanAgeController.text.isEmpty ||
                        weightController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'validatecat'.tr(),
                            style: GoogleFonts.jetBrainsMono(
                              textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: FontTextColor.secondaryColor,
                              ),
                            ),
                          ),
                        ),
                      );
                      return;
                    }
                    setState(() {
                      int humanAge = int.parse(humanAgeController.text);
                      double weight = double.parse(weightController.text);
                      felineAge = calculateFelineAge(humanAge, weight).round();
                    });
                  },
                  color: ButtonColor.primaryColor,
                  shape: GFButtonShape.pills,
                  fullWidthButton: true,
                  text: "buttoncat".tr(),
                  textStyle: TextStyle(
                    color: FontTextColor.secondaryColor,
                    fontFamily: GoogleFonts.jetBrainsMono().fontFamily,
                    fontSize: 12,
                  ),
                  size: GFSize.LARGE,
                ),
                if (felineAge != null)
                  Text(
                  '${'responsecat'.tr()}: $felineAge',
                    style: GoogleFonts.jetBrainsMono(
                      textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: FontTextColor.primaryColor,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double calculateFelineAge(int humanAge, double weight) {
    double felineAge;
    double ageFactor = humanAge <= 2 ? 24 : 24 + (humanAge - 2) * 4;
    double weightFactor = weight <= 5
        ? 4
        : weight <= 10
            ? 6
            : 8;
    felineAge = ageFactor + weightFactor * (humanAge - 2);
    return felineAge;
  }
}
