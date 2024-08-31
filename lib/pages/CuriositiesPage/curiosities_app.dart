import 'package:age_pet/components/AccordionData/accordion_data_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:age_pet/components/DartkTheme/provider_app.dart';
import 'package:age_pet/components/AppTheme/app_theme.dart';

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
    return Consumer<UiProvider>(
      builder: (context, notifier, child) {
        return Scaffold(
          backgroundColor:
              notifier.isDark ? AppTheme.thirdColor : AppTheme.primaryColor,
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
                        collapsedTitleBackgroundColor: notifier.isDark
                            ? ButtonColor.secondaryColor
                            : ButtonColor.primaryColor,
                        contentBackgroundColor: notifier.isDark
                            ? ButtonColor.primaryColor
                            : ButtonColor.secondaryColor,
                        expandedTitleBackgroundColor: notifier.isDark
                            ? ButtonColor.secondaryColor
                            : ButtonColor.primaryColor,
                        collapsedIcon: Icon(
                          Icons.keyboard_double_arrow_down,
                          color: notifier.isDark
                              ? IconColor.primaryColor
                              : IconColor.thirdColor,
                          semanticLabel: 'openbutton'.tr(),
                        ),
                        expandedIcon: Icon(
                          Icons.keyboard_double_arrow_up,
                          color: notifier.isDark
                              ? IconColor.primaryColor
                              : IconColor.thirdColor,
                          semanticLabel: 'closebutton'.tr(),
                        ),
                        title: item['title'],
                        content: item['content'],
                        textStyle: GoogleFonts.jetBrainsMono(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: notifier.isDark
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
      },
    );
  }
}
