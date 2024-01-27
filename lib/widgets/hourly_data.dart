import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HourlyDataWidget extends StatelessWidget {
  const HourlyDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          alignment: Alignment.topCenter,
          child: const Text(
            'Today',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
