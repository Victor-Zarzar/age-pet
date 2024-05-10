import 'package:age_pet/components/AppTheme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

class DogPage extends StatefulWidget {
  const DogPage({super.key});

  @override
  State<DogPage> createState() => _DogPageState();
}

class _DogPageState extends State<DogPage> {
  TextEditingController humanAgeController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  int? canineAge;

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
              'lib/assets/dog.png',
              height: myHeight * 0.15,
              width: myWidth * 0.40,
            ),
            const SizedBox(height: 20),
            Text(
              'Idade do Cachorro',
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
                if (humanAgeController.text.isEmpty ||
                    weightController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Por favor, preencha todos os campos.'),
                    ),
                  );
                  return;
                }
                setState(() {
                  int humanAge = int.parse(humanAgeController.text);
                  double weight = double.parse(weightController.text);
                  canineAge = calculateCanineAge(humanAge, weight).round();
                });
              },
              color: ButtonColor.primaryColor,
              shape: GFButtonShape.pills,
              text: "Calcular",
              size: GFSize.LARGE,
            ),
            if (canineAge != null)
              Text(
                'Idade do Cachorro: $canineAge anos',
                style: const TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }

  double calculateCanineAge(int humanAge, double weight) {
    double canineAge;

    if (humanAge <= 5) {
      canineAge = humanAge * 7.2;
    } else {
      double ageFactor;
      double weightFactor;

      if (weight <= 10) {
        weightFactor = 4;
      } else if (weight <= 25) {
        weightFactor = 5;
      } else {
        weightFactor = 6;
      }

      if (humanAge <= 10) {
        ageFactor = humanAge - 5;
      } else {
        ageFactor = 5 + (humanAge - 10) * 0.5;
      }

      canineAge = 35 + (ageFactor * weightFactor);
    }

    return canineAge;
  }
}
