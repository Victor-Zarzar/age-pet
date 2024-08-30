import 'package:age_pet/components/AppAssets/app_assets.dart';
import 'package:age_pet/components/AppTheme/app_theme.dart';
import 'package:age_pet/components/DartkTheme/provider_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
    return Consumer<UiProvider>(
      builder: (context, notifier, child) {
        return Scaffold(
          backgroundColor:
              notifier.isDark ? AppTheme.thirdColor : AppTheme.primaryColor,
          body: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: SizedBox(
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
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: notifier.isDark
                                ? FontTextColor.secondaryColor
                                : FontTextColor.primaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        width: 180,
                        child: TextFormField(
                          cursorColor: notifier.isDark
                              ? FormColor.secondaryColor
                              : FormColor.primaryColor,
                          controller: humanAgeController,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r'[0-9.,]'),
                            ),
                          ],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'labelcat'.tr(),
                            labelStyle: TextStyle(
                              fontSize: 12,
                              color: notifier.isDark
                                  ? FontTextColor.secondaryColor
                                  : FontTextColor.primaryColor,
                            ),
                            border: const OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: notifier.isDark
                                    ? FormColor.secondaryColor
                                    : FormColor.primaryColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 50,
                        width: 180,
                        child: TextFormField(
                          cursorColor: notifier.isDark
                              ? FormColor.secondaryColor
                              : FormColor.primaryColor,
                          controller: weightController,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r'[0-9.,]'),
                            ),
                          ],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: notifier.isDark
                                    ? FormColor.secondaryColor
                                    : FormColor.primaryColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            labelText: 'secondlabelcat'.tr(),
                            labelStyle: TextStyle(
                              fontSize: 12,
                              color: notifier.isDark
                                  ? FontTextColor.secondaryColor
                                  : FontTextColor.primaryColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 35,
                        width: 180,
                        child: GFButton(
                          onPressed: () {
                            if (humanAgeController.text.isEmpty ||
                                weightController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: notifier.isDark
                                      ? SnackBarColor.secondColor
                                      : SnackBarColor.primaryColor,
                                  content: Text(
                                    'validatecat'.tr(),
                                    style: GoogleFonts.jetBrainsMono(
                                      textStyle: TextStyle(
                                        fontSize: 11,
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
                              double weight =
                                  double.parse(weightController.text);
                              felineAge =
                                  calculateFelineAge(humanAge, weight).round();
                            });
                          },
                          color: notifier.isDark
                              ? ButtonColor.secondaryColor
                              : ButtonColor.primaryColor,
                          fullWidthButton: true,
                          text: "buttoncat".tr(),
                          textStyle: TextStyle(
                            color: notifier.isDark
                                ? FontTextColor.primaryColor
                                : FontTextColor.secondaryColor,
                            fontFamily: GoogleFonts.jetBrainsMono().fontFamily,
                            fontSize: 11,
                          ),
                          size: GFSize.LARGE,
                        ),
                      ),
                      if (felineAge != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 14),
                          child: Text(
                            '${'responsecat'.tr()}: $felineAge',
                            style: GoogleFonts.jetBrainsMono(
                              textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: notifier.isDark
                                    ? FontTextColor.secondaryColor
                                    : FontTextColor.primaryColor,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
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
