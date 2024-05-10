import 'package:age_pet/components/AppTheme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

class CatPage extends StatefulWidget {
  const CatPage({super.key});

  @override
  State<CatPage> createState() => _CatPageState();
}

class _CatPageState extends State<CatPage> {
  TextEditingController humanAgeController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  int? felineAge;

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
            Image.asset(
              'lib/assets/cat.png',
              height: myHeight * 0.15,
              width: myWidth * 0.40,
            ),
            const SizedBox(height: 20),
            Text(
              'Idade do Gato',
              style: GoogleFonts.jetBrainsMono(),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: humanAgeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Idade Humana',
              ),
            ),
            TextFormField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Peso (kg)',
              ),
            ),
            const SizedBox(height: 10),
            GFButton(
              onPressed: () {
                setState(() {
                  int humanAge = int.parse(humanAgeController.text);
                  double weight = double.parse(weightController.text);
                  felineAge = calculateFelineAge(humanAge, weight).round();
                });
              },
              color: ButtonColor.primaryColor,
              shape: GFButtonShape.pills,
              text: "Calcular",
              size: GFSize.LARGE,
            ),
            if (felineAge != null)
              Text(
                'Idade do Gato: $felineAge anos',
                style: const TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }

  double calculateFelineAge(int humanAge, double weight) {
    double felineAge;
    double ageFactor = humanAge <= 2 ? 24 : 24 + (humanAge - 2) * 4;
    double weightFactor = weight <= 5
        ? 4
        : weight <= 10
            ? 6
            : 8;
    felineAge = ageFactor + weightFactor * (humanAge - 2);
    return felineAge;
  }
}
