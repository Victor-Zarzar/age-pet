import 'package:age_pet/pages/components/AppTheme/app_theme.dart';
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
    return Scaffold(
      appBar: GFAppBar(
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
        iconTheme: IconThemeData(color: FontTextColor.primaryColor),
      ),
      body: GFTabBarView(controller: tabController, children: <Widget>[
        Container(color: AppTheme.primaryColor),
        Container(color: AppTheme.primaryColor),
      ]),
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
