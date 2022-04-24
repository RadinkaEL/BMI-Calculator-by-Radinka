import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/screen_result.dart';
import 'package:flutter/material.dart';
import 'package:weight_slider/weight_slider.dart';

class WeightScreen extends StatefulWidget {
  String gender;
  int feet;

  WeightScreen({required this.gender, required this.feet});

  @override
  _WeightScreenState createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  int weight = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select weight"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 8,
                child: Center(
                  child: Hero(
                    tag: widget.gender,
                    child: Image.asset("assets/images/${widget.gender}.png"),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 50,
                  ),
                  child: Hero(
                    tag: "weight",
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 5),
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          width: 50,
                          height: 50,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                if (!(weight < 1)) {
                                  weight--;
                                }
                              });
                            },
                            icon: Icon(
                              Icons.remove,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Height',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  weight.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  'kg',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 5),
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          width: 50,
                          height: 50,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            icon: Icon(
                              Icons.add,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () {
                    openScreen(
                      context,
                      ResultScreen(
                        gender: widget.gender,
                        height: widget.feet,
                        weight: weight,
                      ),
                    );
                  },
                  child: Text("Next"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
