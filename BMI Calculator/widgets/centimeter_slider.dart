import 'package:flutter/material.dart';

class CM_HeightSlider extends StatefulWidget {
  final Function(double cm) updateSelectedHeight;
  final double initialCM; // Initial value for centimeters
  final double maxCM; // Maximum value for centimeters

  const CM_HeightSlider({
    required this.updateSelectedHeight,
    required this.initialCM,
    required this.maxCM,
  });

  @override
  _HeightSliderState createState() => _HeightSliderState();
}

class _HeightSliderState extends State<CM_HeightSlider> {
  late double _cm;

  @override
  void initState() {
    super.initState();
    _cm = widget.initialCM; // Initialize centimeters with provided initial value
  }

  @override
  Widget build(BuildContext context) {
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
                      text: 'Height is ',
                    ),
                    TextSpan(
                      text: '${_cm.toInt()}',
                      style: const TextStyle(color: Color(0xFF142721)),
                    ),
                    const TextSpan(
                      text: ' cm',
                      style: TextStyle(color: Color(0xFF3D6054)),
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
            value: _cm,
            min: 0,
            max: widget.maxCM,
            divisions: widget.maxCM.toInt(),
            onChanged: (newValue) {
              setState(() {
                _cm = newValue;
                widget.updateSelectedHeight(_cm);
              });
            },
            label: '$_cm cm',
          ),
        ),
      ],
    );
  }
}
