import 'package:age_pet/components/AppTheme/app_theme.dart';
import 'package:age_pet/pages/AboutPage/about_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class DrawerComponent extends StatefulWidget {
  const DrawerComponent({super.key});

  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Drawer(
        child: Container(
          color: AppTheme.primaryColor,
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
                      icon:
                          Icon(Icons.arrow_back, color: IconColor.primaryColor),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    GFAvatar(
                      radius: 80.0,
                      backgroundColor: AppTheme.primaryColor,
                      backgroundImage: const AssetImage(
                        "assets/pets.png",
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text(
                  'darkmode'.tr(),
                  style: TextStyle(color: FontTextColor.primaryColor),
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  'about'.tr(),
                  style: TextStyle(color: FontTextColor.primaryColor),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
