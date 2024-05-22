import 'package:age_pet/components/AppTheme/app_theme.dart';
import 'package:age_pet/pages/CatPage/cat_page.dart';
import 'package:age_pet/pages/DogPage/dog_page.dart';
import 'package:easy_localization/easy_localization.dart';
import "package:flutter/material.dart";
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
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: GFAppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppTheme.primaryColor,
        title: Text(
          'text_appbar'.tr(),
          style: GoogleFonts.jetBrainsMono(
            textStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: FontTextColor.primaryColor,
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
          ],
        ),
      ),
      bottomNavigationBar: GFTabBar(
        length: 2,
        tabBarHeight: 60,
        controller: tabController,
        tabBarColor: TabBarColor.primaryColor,
        labelColor: FontTextColor.thirdColor,
        indicatorColor: FontTextColor.primaryColor,
        labelStyle: GoogleFonts.jetBrainsMono(
          textStyle: const TextStyle(fontSize: 11),
        ),
        tabs: [
          Tab(
            icon: const Icon(
              Icons.pets,
              size: 20,
            ),
            child: Text(
              'cat'.tr(),
            ),
          ),
          Tab(
            icon: const Icon(
              Icons.pets,
              size: 20,
            ),
            child: Text(
              'dog'.tr(),
            ),
          ),
        ],
      ),
    );
  }
}
