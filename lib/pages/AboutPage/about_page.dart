import 'package:age_pet/components/AppTheme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: GFAppBar(
        centerTitle: true,
        backgroundColor: AppTheme.primaryColor,
        title: Text(
          "about".tr(),
          style: GoogleFonts.jetBrainsMono(
            textStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: FontTextColor.primaryColor,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: IconColor.primaryColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
