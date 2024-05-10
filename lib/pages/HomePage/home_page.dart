import 'package:age_pet/components/AppTheme/app_theme.dart';
import 'package:age_pet/pages/CatPage/cat_page.dart';
import 'package:age_pet/pages/DogPage/dog_page.dart';
import "package:flutter/material.dart";
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
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
          'Calculadora Pet',
          style: GoogleFonts.jetBrainsMono(
            textStyle: TextStyle(
              fontSize: 17,
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
        controller: tabController,
        tabBarColor: TabBarColor.primaryColor,
        labelColor: FontTextColor.thirdColor,
        indicatorColor: FontTextColor.primaryColor,
        labelStyle: GoogleFonts.jetBrainsMono(
          textStyle: const TextStyle(fontSize: 13),
        ),
        tabs: const [
          Tab(
            icon: Icon(Icons.pets),
            child: Text(
              'Gato',
            ),
          ),
          Tab(
            icon: Icon(Icons.pets),
            child: Text(
              'Cachorro',
            ),
          ),
        ],
      ),
    );
  }
}
