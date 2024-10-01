import 'package:age_pet/features/app_theme.dart';
import 'package:age_pet/screens/carousel_page.dart';
import 'package:age_pet/screens/cat_page.dart';
import 'package:age_pet/screens/curiosities_app.dart';
import 'package:age_pet/screens/dog_page.dart';
import 'package:age_pet/screens/settings_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: GFAppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor:
            isDarkMode ? AppTheme.thirdColor : AppTheme.primaryColor,
        title: Text(
          'text_appbar'.tr(),
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
      body: SizedBox(
        height: myHeight,
        width: myWidth,
        child: GFTabBarView(
          controller: tabController,
          children: const <Widget>[
            CatPage(),
            DogPage(),
            CarouselPage(),
            CuriositiesPage(),
            SettingPage(),
          ],
        ),
      ),
      bottomNavigationBar: GFTabBar(
        length: 5,
        tabBarHeight: 60,
        controller: tabController,
        tabBarColor: isDarkMode ? AppTheme.thirdColor : AppTheme.primaryColor,
        labelColor: isDarkMode
            ? FontTextColor.secondaryColor
            : FontTextColor.primaryColor,
        indicatorColor: isDarkMode
            ? FontTextColor.secondaryColor
            : FontTextColor.primaryColor,
        labelStyle: GoogleFonts.jetBrainsMono(
          textStyle: const TextStyle(fontSize: 8),
        ),
        tabs: [
          Tab(
            icon: const Icon(
              Icons.pets,
              size: 16,
            ),
            child: Text(
              'cat'.tr(),
              style: GoogleFonts.jetBrainsMono(),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Tab(
            icon: const Icon(
              Icons.pets,
              size: 16,
            ),
            child: Text(
              'dog'.tr(),
              style: GoogleFonts.jetBrainsMono(),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Tab(
            icon: const Icon(
              Icons.photo,
              size: 16,
            ),
            child: Text(
              'photos'.tr(),
              style: GoogleFonts.jetBrainsMono(),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Tab(
            icon: const Icon(
              Icons.question_answer,
              size: 16,
            ),
            child: Text(
              'curiosities'.tr(),
              style: GoogleFonts.jetBrainsMono(),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Tab(
            icon: const Icon(
              Icons.settings,
              size: 16,
            ),
            child: Text(
              'settings'.tr(),
              style: GoogleFonts.jetBrainsMono(),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
