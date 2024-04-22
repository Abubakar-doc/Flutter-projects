import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/description.dart';
import '../widgets/heightFormatCard.dart';
import '../widgets/weight_slider.dart';
import 'Height_Selection.dart';

class WeightSelection extends StatefulWidget {
  const WeightSelection({Key? key}) : super(key: key);

  @override
  _WeightSelectionState createState() => _WeightSelectionState();
}

class _WeightSelectionState extends State<WeightSelection> {
  bool isKilogramsSelected = true;
  double selectedWeight = 70.0; // Default weight value in kilograms

  void _toggleSelected() {
    setState(() {
      isKilogramsSelected = !isKilogramsSelected;
      if (!isKilogramsSelected) {
        // Convert weight from pounds to kilograms if switching to kilograms
        selectedWeight *= 0.453592;
      } else {
        // Convert weight from kilograms to pounds if switching to pounds
        selectedWeight /= 0.453592;
      }
    });
  }

  void updateSelectedWeight(double weight, WeightUnit unit) {
    setState(() {
      if (unit == WeightUnit.lb) {
        selectedWeight = weight * 0.453592; // Convert pounds to kilograms
      } else {
        selectedWeight = weight; // Already in kilograms
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget sliderWidget;
    if (isKilogramsSelected) {
      sliderWidget = WeightSlider(
        updateSelectedWeight: (weight) =>
            updateSelectedWeight(weight, WeightUnit.kg),
        initialWeight: selectedWeight,
        maxWeight: 330, // Maximum weight in kilograms
        unit: WeightUnit.kg,
      );
    } else {
      sliderWidget = WeightSlider(
        updateSelectedWeight: (weight) =>
            updateSelectedWeight(weight, WeightUnit.lb),
        initialWeight: selectedWeight,
        maxWeight: 330, // Maximum weight in pounds
        unit: WeightUnit.lb,
      );
    }

    return Scaffold(
      appBar: const CustomAppBar(title: 'BMI CALCULATOR'),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Column(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'How ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'much do you',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: ' weigh?',
                            style: TextStyle(
                              color: Color(0xFF59AF94),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    description(),
                  ],
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: _toggleSelected,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SelectionItem(
                          label: 'kg',
                          isSelected: isKilogramsSelected,
                          onTap: () {
                            if (!isKilogramsSelected) _toggleSelected();
                          },
                        ),
                        const SizedBox(width: 10),
                        SelectionItem(
                          label: 'lb',
                          isSelected: !isKilogramsSelected,
                          onTap: () {
                            if (isKilogramsSelected) _toggleSelected();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_drop_down_rounded,
                  size: 80,
                  color: Color(0xFF59AF94),
                ),
                sliderWidget,
                const SizedBox(height: 20,),
                GestureDetector(
                  onTap: () {
                    // Inside the onTap of the "Next" button
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Height_Selection(selectedWeight: selectedWeight),
                      ),
                    );

                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 120),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
