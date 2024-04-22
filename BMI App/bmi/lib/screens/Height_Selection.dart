import 'package:flutter/material.dart';
import 'package:bmi/screens/result.dart';
import 'package:bmi/screens/weight_Selection.dart';
import '../widgets/appbar.dart';
import '../widgets/centimeter_slider.dart';
import '../widgets/description.dart';
import '../widgets/heightFormatCard.dart';
import '../widgets/ft_slider.dart';

class Height_Selection extends StatefulWidget {
  final double selectedWeight;

  const Height_Selection({Key? key, required this.selectedWeight})
      : super(key: key);

  @override
  _Height_SelectionState createState() => _Height_SelectionState();
}

class _Height_SelectionState extends State<Height_Selection> {
  bool isFeetSelected = true;
  late double _feet; // Declare _feet
  late double _inches; // Declare _inches
  double selectedHeight = 162.0;

  @override
  void initState() {
    super.initState();
    _feet = 5; // Initial feet value
    _inches = 6; // Initial inches value
  }

  void _toggleSelected() {
    setState(() {
      isFeetSelected = !isFeetSelected;
      if (!isFeetSelected && _feet > 7) {
        // Convert the value to maximum feet value
        _feet = 7;
        // Reset inches to 0 when converting to feet
        _inches = 0;
      } else if (isFeetSelected && _feet > 7) {
        // If the user switches back to feet and the feet value is greater than 7,
        // reset it to 7 feet.
        _feet = 7;
        _inches = 11;

      }
    });
  }

  void updateSelectedHeight(HeightData heightData) {
    setState(() {
      _feet = heightData.feet;
      _inches = heightData.inches;
    });
  }

  void updateSelectedCM(double cm) {
    setState(() {
      _feet = cm;
      _inches = 0; // Assuming no inches are provided directly in cm
    });
  }

  HeightData getSelectedHeight() {
    return HeightData(_feet, _inches);
  }

  @override
  Widget build(BuildContext context) {
    print('Received Weight in height screen: ${widget.selectedWeight}');
    print(
        'Selected height: ${getSelectedHeight().feet} feet, ${getSelectedHeight().inches} inches');
    Widget sliderWidget;
    if (isFeetSelected) {
      sliderWidget = FT_HeightSlider(
        initialFeet: _feet,
        initialInches: _inches,
        updateSelectedHeight: updateSelectedHeight,
        maxFeet: 7,
        maxInches: 11,
      );
    } else {
      sliderWidget = CM_HeightSlider(
        updateSelectedHeight: updateSelectedCM,
        initialCM: _feet, // Assuming cm represents feet directly
        maxCM: 217,
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
                            text: 'tall ',
                            style: TextStyle(
                              color: Color(0xFF59AF94),
                            ),
                          ),
                          TextSpan(
                            text: 'are you?',
                            style: TextStyle(
                              color: Colors.black,
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
                          label: 'ft',
                          isSelected: isFeetSelected,
                          onTap: () {
                            if (!isFeetSelected) _toggleSelected();
                          },
                        ),
                        const SizedBox(width: 10),
                        SelectionItem(
                          label: 'cm',
                          isSelected: !isFeetSelected,
                          onTap: () {
                            if (isFeetSelected) _toggleSelected();
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
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    double heightInMeters;
                    if (isFeetSelected) {
                      // Convert feet and inches to meters
                      heightInMeters = (_feet * 0.3048) + (_inches * 0.0254);
                    } else {
                      // Height is already in centimeters, so convert directly to meters
                      heightInMeters = _feet / 100.0;
                    }

                    // Navigate to the result screen and pass selected height and weight
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Result(
                          selectedHeight: heightInMeters,
                          selectedWeight: widget.selectedWeight,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 120),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Get Result',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
