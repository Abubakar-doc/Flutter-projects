import 'package:flutter/material.dart';

class HeightData {
  final double feet;
  final double inches;

  HeightData(this.feet, this.inches);
}

class FT_HeightSlider extends StatefulWidget {
  final Function(HeightData heightData) updateSelectedHeight;
  final double initialFeet;
  final double initialInches;
  final double maxFeet;
  final double maxInches;

  const FT_HeightSlider({
    required this.updateSelectedHeight,
    required this.initialFeet,
    required this.initialInches,
    required this.maxFeet,
    required this.maxInches,
  });

  @override
  _HeightSliderState createState() => _HeightSliderState();
}

class _HeightSliderState extends State<FT_HeightSlider> {
  late double _feet;
  late double _inches;

  @override
  void initState() {
    super.initState();
    _feet = widget.initialFeet;
    _inches = widget.initialInches;
  }

  // Function to return the current selected height
  HeightData getSelectedHeight() {
    return HeightData(_feet, _inches);
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
                      text: '${_feet.toInt()}',
                      style: const TextStyle(color: Color(0xFF142721)),
                    ),
                    const TextSpan(
                      text: ' ft',
                      style: TextStyle(color: Color(0xFF3D6054)),
                    ),
                    TextSpan(
                      text: ' ${_inches.toInt()}',
                      style: const TextStyle(color: Color(0xFF142721)),
                    ),
                    const TextSpan(
                      text: ' inches',
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
            value: _feet,
            min: 0,
            max: widget.maxFeet,
            divisions: widget.maxFeet.toInt(),
            onChanged: (newValue) {
              setState(() {
                _feet = newValue;
                widget.updateSelectedHeight(HeightData(_feet, _inches));
              });
            },
            label: '$_feet ft',
          ),
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
            value: _inches,
            min: 0,
            max: widget.maxInches,
            divisions: widget.maxInches.toInt(),
            onChanged: (newValue) {
              setState(() {
                _inches = newValue;
                widget.updateSelectedHeight(HeightData(_feet, _inches));
              });
            },
            label: '$_inches inches',
          ),
        ),
      ],
    );
  }
}