import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:url_launcher/url_launcher.dart';


class EventUtils {
  static Future<void> selectDate(BuildContext context, DateTime selectedDate, void Function(DateTime) setDate) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setDate(pickedDate);
    }
  }

  static Future<void> selectTime(BuildContext context, TimeOfDay selectedTime, void Function(TimeOfDay) setTime) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (pickedTime != null) {
      setTime(pickedTime);
    }
  }

  static Future<void> uploadFile(void Function(String) setFilePath) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result != null) {
      setFilePath(result.files.single.path!);
    }
  }

  static void openMap(String address) async {
    String mapUrl = 'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(address)}';
    try {
      await launch(mapUrl);
    } catch (e) {
      print('Could not launch $mapUrl: $e');
    }
  }

}