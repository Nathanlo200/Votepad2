import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomSlider extends ConsumerStatefulWidget {
  final String title;
  final Function(double) onSliderChanged;
  final double value;

  const CustomSlider(
      {super.key,
        required this.title,
        required this.onSliderChanged,
        required this.value});

  @override
  ConsumerState createState() => _CustomSliderState();
}

class _CustomSliderState extends ConsumerState<CustomSlider> {
  double _currentSliderValue = 0;

  @override
  void initState() {
    super.initState();
    _currentSliderValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Slider(
        value: _currentSliderValue,
        max: 100,
        divisions: 5,
        label: _currentSliderValue.round().toString(),
        onChanged: (double value) {
          setState(() {
            _currentSliderValue = value;
          });
          {
            widget.onSliderChanged(value);
          }
        },
      ),
    );
  }
}
