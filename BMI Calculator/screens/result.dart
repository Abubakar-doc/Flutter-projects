import 'package:flutter/material.dart';
import '../widgets/appbar.dart';

class Result extends StatefulWidget {
  final double selectedHeight;
  final double selectedWeight;

  const Result({
    Key? key,
    required this.selectedHeight,
    required this.selectedWeight,
  }) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    // Calculate BMI using selectedHeight and selectedWeight
    double bmi = widget.selectedWeight / (widget.selectedHeight * widget.selectedHeight);

    // Determine BMI category based on its value
    String bmiCategory;
    Color bmiColor;
    if (bmi < 18.5) {
      bmiCategory = 'Underweight';
      bmiColor = Colors.blue; // Example color for underweight
    } else if (bmi >= 18.5 && bmi < 25) {
      bmiCategory = 'Normal weight';
      bmiColor = Colors.green; // Example color for normal weight
    } else if (bmi >= 25 && bmi < 30) {
      bmiCategory = 'Overweight';
      bmiColor = Colors.yellow; // Example color for overweight
    } else if (bmi >= 30 && bmi < 35) {
      bmiCategory = 'Obese at level 1';
      bmiColor = Colors.orange; // Example color for obesity (class 1)
    } else if (bmi >= 35 && bmi < 40) {
      bmiCategory = 'Obese at level 2';
      bmiColor = Colors.deepOrange; // Example color for obesity (class 2)
    } else {
      bmiCategory = 'Obese at level 3';
      bmiColor = Colors.red; // Example color for obesity (class 3)
    }

    return Scaffold(
      appBar: CustomAppBar(title: 'BMI CALCULATOR'),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(50.0),
                decoration: BoxDecoration(
                  color: bmiColor, // Use calculated color
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  'Your BMI Result: ${bmi.toStringAsFixed(2)}', // Display BMI result
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              RichText(
                text: TextSpan(
                  text: 'You are ',
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: bmiCategory,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: bmiColor, // Use calculated color
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
