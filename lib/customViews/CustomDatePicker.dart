import 'package:flutter/material.dart';
import '../utils/create_event_utils.dart';


class CustomDatePicker extends StatelessWidget {
  final DateTime? selectedDate;
  final void Function(DateTime) onDateSelected;

  const CustomDatePicker({
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Date',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        InkWell(
          onTap: () => EventUtils.selectDate(
            context,
            selectedDate!,
                (DateTime date) {
              onDateSelected(date);
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
              selectedDate != null
                  ? '${selectedDate?.day}/${selectedDate?.month}/${selectedDate?.year}'
                  : 'Select date',
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
