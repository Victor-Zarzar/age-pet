import 'package:age_pet/components/AppTheme/app_theme.dart';
import 'package:age_pet/components/DartkTheme/provider_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw '${'launch_error'.tr()} $url';
    }
  }

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
            child: Column(
              children: [
                SizedBox(
                  width: myWidth,
                  child: GFAppBar(
                    centerTitle: true,
                    backgroundColor: notifier.isDark
                        ? AppTheme.thirdColor
                        : AppTheme.primaryColor,
                    title: Text(
                      "about".tr(),
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
                    leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: notifier.isDark
                            ? FontTextColor.secondaryColor
                            : FontTextColor.primaryColor,
                        semanticLabel: 'backtopage'.tr(),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.info,
                              color: IconColor.secondaryColor,
                              semanticLabel: 'informationicon'.tr(),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                "abouttext".tr(),
                                style: GoogleFonts.jetBrainsMono(
                                  textStyle: TextStyle(
                                    fontSize: 13,
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
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        _launchURL('https://www.victorzarzar.com.br');
                      },
                      child: Flexible(
                        child: Text(
                          'developed'.tr(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.jetBrainsMono(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: notifier.isDark
                                  ? FontTextColor.secondaryColor
                                  : FontTextColor.primaryColor,
                              decoration: TextDecoration.underline,
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
      },
    );
  }
}
