import 'package:age_pet/features/accordion_data_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:age_pet/features/app_theme.dart';

class CuriositiesPage extends StatefulWidget {
  const CuriositiesPage({super.key});

  @override
  State<CuriositiesPage> createState() => _CuriositiesPageState();
}

class _CuriositiesPageState extends State<CuriositiesPage> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? AppTheme.thirdColor : AppTheme.primaryColor,
      body: SizedBox(
        height: myHeight,
        width: myWidth,
        child: SingleChildScrollView(
          child: Column(
            children: AccordionData.accordionItems.map(
              (item) {
                return Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: GFAccordion(
                    collapsedTitleBackgroundColor: isDarkMode
                        ? ButtonColor.secondaryColor
                        : ButtonColor.primaryColor,
                    expandedTitleBackgroundColor: isDarkMode
                        ? ButtonColor.secondaryColor
                        : ButtonColor.primaryColor,
                    contentBackgroundColor: isDarkMode
                        ? ButtonColor.secondaryColor
                        : ButtonColor.primaryColor,
                    contentChild: Text(
                      item['content']!,
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: isDarkMode
                            ? FontTextColor.primaryColor
                            : FontTextColor.secondaryColor,
                      ),
                    ),
                    collapsedIcon: Icon(
                      Icons.keyboard_double_arrow_down,
                      color: isDarkMode
                          ? IconColor.primaryColor
                          : IconColor.thirdColor,
                      semanticLabel: 'openbutton'.tr(),
                    ),
                    expandedIcon: Icon(
                      Icons.keyboard_double_arrow_up,
                      color: isDarkMode
                          ? IconColor.primaryColor
                          : IconColor.thirdColor,
                      semanticLabel: 'closebutton'.tr(),
                    ),
                    title: item['title'],
                    textStyle: GoogleFonts.jetBrainsMono(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode
                          ? FontTextColor.primaryColor
                          : FontTextColor.secondaryColor,
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
