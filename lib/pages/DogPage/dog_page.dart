import "package:age_pet/components/AppTheme/app_theme.dart";
import "package:flutter/material.dart";

class DogPage extends StatefulWidget {
  const DogPage({super.key});

  @override
  State<DogPage> createState() => _DogPageState();
}

class _DogPageState extends State<DogPage> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: SizedBox(
        height: myHeight,
        width: myWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Image.asset('lib/assets/dog.png',
            height: myHeight * 0.15,
            width: myWidth * 0.40,
            ),
            const SizedBox(height: 20),
            const Text('Idade do Cachorro'),
          ],
        ),
      ),
    );
  }
}
