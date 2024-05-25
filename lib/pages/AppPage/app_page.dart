import 'package:age_pet/components/AppTheme/app_theme.dart';
import 'package:age_pet/components/DartkTheme/provider_app.dart';
import 'package:age_pet/components/Drawer/drawer_app.dart';
import 'package:age_pet/pages/CatPage/cat_page.dart';
import 'package:age_pet/pages/CuriositiesPage/curiosities_app.dart';
import 'package:age_pet/pages/DogPage/dog_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Consumer<UiProvider>(
      builder: (context, notifier, child) {
        return Scaffold(
          appBar: GFAppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor:
                notifier.isDark ? AppTheme.thirdColor : AppTheme.primaryColor,
            title: Text(
              'text_appbar'.tr(),
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
            actions: [
              Builder(
                builder: (context) => IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: notifier.isDark
                        ? IconColor.thirdColor
                        : IconColor.primaryColor,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
            ],
          ),
          drawer: const DrawerComponent(),
          body: SizedBox(
            height: myHeight,
            width: myWidth,
            child: GFTabBarView(
              controller: tabController,
              children: const <Widget>[
                CatPage(),
                DogPage(),
                CuriositiesPage(),
              ],
            ),
          ),
          bottomNavigationBar: GFTabBar(
            length: 3,
            tabBarHeight: 60,
            controller: tabController,
            tabBarColor:
                notifier.isDark ? AppTheme.thirdColor : AppTheme.primaryColor,
            labelColor: notifier.isDark
                ? FontTextColor.secondaryColor
                : FontTextColor.primaryColor,
            indicatorColor: notifier.isDark
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
                ),
              ),
              Tab(
                icon: const Icon(
                  Icons.pets,
                  size: 16,
                ),
                child: Text(
                  'dog'.tr(),
                ),
              ),
              Tab(
                icon: const Icon(
                  Icons.question_answer,
                  size: 16,
                ),
                child: Text(
                  'curiosities'.tr(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
