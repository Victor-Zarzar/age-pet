import 'package:age_pet/features/app_theme.dart';
import 'package:age_pet/features/provider_app.dart';
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
    return Consumer<UiProvider>(
      builder: (context, notifier, child) {
        return Scaffold(
          backgroundColor:
              notifier.isDark ? AppTheme.thirdColor : AppTheme.primaryColor,
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: AppTheme.secondaryColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/imgs/pets.png',
                        semanticLabel: 'image_pet'.tr(),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  trailing: Switch(
                    activeColor: SwitchColor.primaryColor,
                    inactiveTrackColor: SwitchColor.secondaryColor,
                    value: notifier.isDark,
                    onChanged: (value) => notifier.changeTheme(),
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
                        color: notifier.isDark
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
                        color: notifier.isDark
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
      },
    );
  }
}
