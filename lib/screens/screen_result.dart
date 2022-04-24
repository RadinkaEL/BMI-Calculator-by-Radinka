import 'dart:math';

import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/screen_home.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  int weight, height;
  String gender;

  @override
  _ResultScreenState createState() => _ResultScreenState();

  ResultScreen({
    required this.weight,
    required this.height,
    required this.gender,
  });
}

class _ResultScreenState extends State<ResultScreen> {
  //BMI = weight (kg) ÷ height2 (m)

  double bmi = 0;
  String message = '';
  List<String> messages = [
    'Badan mu sedikit kurus,\nmakan yang banyak yah',
    'BMI kamu normal,\ntetap jaga yah',
    'Badan mu agak berisi,\nimbangi sama olahraga yah',
    'BMI mu Obese, diet yah, sekalian\nolahraga suapaya badan kamu bagus',
  ];

  @override
  void initState() {
    bmi = calculateBMI(widget.height, widget.weight);
    message = calculateMessage(bmi);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(child: Image.asset("assets/images/result.png")),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(20),
                  child: Hero(
                    tag: "weight",
                    child: Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              calculateStatus(bmi),
                              style: textStyleNormal,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "${bmi.toStringAsPrecision(4)}",
                              style: textStyleLarge,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(message, textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => false);
                  openScreen(context, HomeScreen());
                },
                child: Text("Recheck"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double calculateBMI(int height, int weight) {
    double BMI = (weight / pow((height / 100), 2))
        .toDouble(); //100 dari konversi cm ke m
    return BMI;
  }

  String calculateMessage(double bmi) {
    if (widget.gender == 'male') {
      if (bmi < 18) {
        return messages[0];
      } else if (bmi < 25) {
        return messages[1];
      } else if (bmi < 27) {
        return messages[2];
      } else {
        return messages[3];
      }
    } else {
      if (bmi < 17) {
        return messages[0];
      } else if (bmi < 23) {
        return messages[1];
      } else if (bmi < 27) {
        return messages[2];
      } else {
        return messages[3];
      }
    }
  }

  String calculateStatus(double bmi) {
    /*BMI classification
  BMI	Category
  < 17 kg/m^2	    Underweight
  17 - 23 kg/m^2  Normal
  23 - 27 kg/m^2  Overweight
  > 27 kg/m^2	    Obese */
    if (widget.gender == 'male') {
      if (bmi < 18) {
        return 'Underweight';
      } else if (bmi < 25) {
        return 'Normal';
      } else if (bmi < 27) {
        return 'Overweight';
      } else {
        return 'Obese';
      }
    } else {
      if (bmi < 17) {
        return 'Underweight';
      } else if (bmi < 23) {
        return 'Normal';
      } else if (bmi < 27) {
        return 'Overweight';
      } else {
        return 'Obese';
      }
    }
  }
}
