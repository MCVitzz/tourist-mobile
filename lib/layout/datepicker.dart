import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tourist/layout/text_box.dart';

class DatePicker extends StatefulWidget {
  final TextEditingController controller;
  final String placeholder;

  DatePicker({this.controller, this.placeholder});

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextBox(
        placeholder: widget.placeholder,
        focusNode: AlwaysDisabledFocusNode(),
        controller: widget.controller,
        onTap: () => _selectDate(context),
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime newDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());

    if (newDate != null) {
      _selectedDate = newDate;
      widget.controller
        ..text = DateFormat('yyyy/MM/dd').format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: widget.controller.text.length,
            affinity: TextAffinity.upstream));
    }
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
