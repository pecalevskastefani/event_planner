import '../utils/create_event_utils.dart';
import 'package:flutter/material.dart';


class CustomTimePicker extends StatelessWidget {
  final TimeOfDay? selectedTime;
  final void Function(TimeOfDay) onTimeSelected;

  const CustomTimePicker({
    required this.selectedTime,
    required this.onTimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Time',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        InkWell(
          onTap: () => EventUtils.selectTime(
            context,
            selectedTime!,
                (TimeOfDay time) {
              onTimeSelected(time);
            },
          ),
          child: InputDecorator(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            ),
            child: Text(
              selectedTime != null
                  ? '${selectedTime?.hour}:${selectedTime?.minute}'
                  : 'Select time',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
