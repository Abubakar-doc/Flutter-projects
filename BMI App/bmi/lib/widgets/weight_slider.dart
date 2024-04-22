import 'package:flutter/material.dart';

enum WeightUnit { kg, lb }

class WeightSlider extends StatefulWidget {
  final Function(double weight) updateSelectedWeight;
  final double initialWeight; // Initial value for weight
  final double maxWeight; // Maximum value for weight
  final WeightUnit unit; // Unit for weight (kg or lb)

  const WeightSlider({
    required this.updateSelectedWeight,
    required this.initialWeight,
    required this.maxWeight,
    required this.unit,
  });

  @override
  _WeightSliderState createState() => _WeightSliderState();
}

class _WeightSliderState extends State<WeightSlider> {
  late double _weight;

  @override
  void initState() {
    super.initState();
    _weight = widget.initialWeight; // Initialize weight with provided initial value
  }

  @override
  Widget build(BuildContext context) {
    String unitLabel = widget.unit == WeightUnit.kg ? 'kg' : 'lb';
    double maxWeight = widget.maxWeight + 0.1; // Adjusted maximum weight

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFA1C3B9),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 10),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3D6054),
                  ),
                  children: [
                    const TextSpan(
                      text: 'Weight is ',
                    ),
                    TextSpan(
                      text: '${_weight.toInt()}',
                      style: const TextStyle(color: Color(0xFF142721)),
                    ),
                    TextSpan(
                      text: ' $unitLabel',
                      style: const TextStyle(color: Color(0xFF3D6054)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: const Color(0xFF284E42),
            inactiveTrackColor: Colors.grey.shade400,
            thumbColor: const Color(0xFF284E42),
            overlayColor: Colors.blue.withAlpha(32),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 20.0),
            tickMarkShape: const RoundSliderTickMarkShape(),
            activeTickMarkColor: const Color(0xFF284E42),
            inactiveTickMarkColor: const Color(0xFF284E42),
            valueIndicatorColor: const Color(0xFF284E42),
            valueIndicatorTextStyle: const TextStyle(color: Colors.white),
          ),
          child: Slider(
            value: _weight,
            min: 0,
            max: maxWeight,
            divisions: maxWeight.toInt(),
            onChanged: (newValue) {
              setState(() {
                _weight = newValue;
                widget.updateSelectedWeight(_weight);
              });
            },
            label: '$_weight $unitLabel',
          ),
        ),
      ],
    );
  }
}
