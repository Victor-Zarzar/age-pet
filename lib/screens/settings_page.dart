import 'package:age_pet/features/app_theme.dart';
import 'package:age_pet/features/theme_provider.dart';
import 'package:age_pet/screens/about_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? AppTheme.thirdColor : AppTheme.primaryColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(),
                  Image.asset(
                    'assets/imgs/pets.png',
                    height: 160,
                    width: 160,
                    semanticLabel: 'image_pet'.tr(),
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            ListTile(
              trailing: Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) {
                  return Switch(
                    value: themeProvider.isDarkMode,
                    onChanged: (value) => themeProvider.toggleTheme(),
                    activeColor: SwitchColor.primaryColor,
                    inactiveTrackColor: SwitchColor.secondaryColor,
                  );
                },
              ),
              leading: Icon(
                Icons.dark_mode,
                semanticLabel: 'darkmode'.tr(),
              ),
              title: Text(
                'darkmode'.tr(),
                style: GoogleFonts.jetBrainsMono(
                  textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode
                        ? FontTextColor.secondaryColor
                        : FontTextColor.primaryColor,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.info,
                semanticLabel: 'informationicon'.tr(),
              ),
              title: Text(
                'about'.tr(),
                style: GoogleFonts.jetBrainsMono(
                  textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode
                        ? FontTextColor.secondaryColor
                        : FontTextColor.primaryColor,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
