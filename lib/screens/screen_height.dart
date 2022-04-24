import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/screen_weight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale_ruler/flutter_scale_ruler.dart';

class HeightScreen extends StatefulWidget {
  String gender;

  HeightScreen(this.gender);

  @override
  _HeightScreenState createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  int? selectedNum = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select your height"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 12,
                child: Hero(
                  tag: widget.gender,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 11,
                        child: Image.asset(
                          "assets/images/${widget.gender}.png",
                        ),
                      ),
                      Expanded(flex: 11 - selectedNum!, child: SizedBox()),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        "$selectedNum cms",
                        style: textStyleNormal,
                      ),
                      Slider(
                        value: selectedNum!.toDouble(),
                        min: 100,
                        max: 220,
                        divisions: 220,
                        onChanged: (double value) {
                          setState(() {
                            selectedNum = value.toInt();
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                    onPressed: () {
                      openScreen(
                        context,
                        WeightScreen(
                          gender: widget.gender,
                          feet: selectedNum!,
                        ),
                      );
                    },
                    child: Text("Next")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
