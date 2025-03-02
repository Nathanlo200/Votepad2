import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomSlider extends ConsumerStatefulWidget {
  final String title;
  final Function(double) onSliderChanged;
  final double value;
  final bool isEnabled;

  const CustomSlider(
      {super.key,
        required this.title,
        required this.onSliderChanged,
        required this.value,
        this.isEnabled = true});

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
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Colors.orange,
        inactiveTrackColor: Colors.grey,
        trackShape: RectangularSliderTrackShape(),
        trackHeight: 7.0,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20.0),
        thumbColor: Colors.white,
      ),
      child: Container(
        child:
        Slider(
          value: _currentSliderValue,
          max: 100,
          divisions: 100,
          label: _currentSliderValue.round().toString(),
          onChanged: widget.isEnabled
            ? (double value) {
      setState(() {
      _currentSliderValue = value;
      });
      widget.onSliderChanged(value);
      }
        : null,
      ),
    ),
    );
  }
}
