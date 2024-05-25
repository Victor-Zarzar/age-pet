import 'package:age_pet/components/AppTheme/app_theme.dart';
import 'package:age_pet/components/DartkTheme/provider_app.dart';
import 'package:age_pet/pages/AboutPage/about_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DrawerComponent extends StatefulWidget {
  const DrawerComponent({super.key});

  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UiProvider>(
      builder: (context, notifier, child) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Drawer(
            child: Container(
              color:
                  notifier.isDark ? AppTheme.thirdColor : AppTheme.primaryColor,
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: AppTheme.secondaryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: notifier.isDark
                                ? FontTextColor.secondaryColor
                                : FontTextColor.primaryColor,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        GFAvatar(
                          radius: 80.0,
                          backgroundColor: notifier.isDark
                              ? AppTheme.thirdColor
                              : AppTheme.primaryColor,
                          backgroundImage: const AssetImage(
                            "assets/pets.png",
                          ),
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
                    leading: const Icon(Icons.dark_mode),
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
                    leading: const Icon(Icons.info),
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
          ),
        );
      },
    );
  }
}
