import 'package:age_and_land_calculation/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../widgets/text_styles.dart';

class AgeCalculation extends StatefulWidget {
  const AgeCalculation({Key? key}) : super(key: key);

  @override
  State<AgeCalculation> createState() => _AgeCalculationState();
}

class _AgeCalculationState extends State<AgeCalculation> {
  DateTime? _selectedDate;
  String _age = '';

  // Method to show DatePicker and calculate age
  Future<void> _pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _age = _calculateAge(pickedDate);
      });
    }
  }

// Method to calculate full age (years, months, days) from birthdate
  String _calculateAge(DateTime birthDate) {
    DateTime today = DateTime.now();

    int years = today.year - birthDate.year;
    int months = today.month - birthDate.month;
    int days = today.day - birthDate.day;

    // If the current month is before the birth month, subtract one year
    if (months < 0) {
      years--;
      months += 12; // Adjust months
    }

    // If the current day is before the birth day, subtract one month
    if (days < 0) {
      months--;

      // Calculate the number of days in the previous month
      int prevMonth = (today.month - 1) == 0 ? 12 : (today.month - 1);
      int daysInPrevMonth = DateTime(today.year, prevMonth + 1, 0).day;
      days += daysInPrevMonth; // Adjust days
    }

    return '$years years, $months months, $days days';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.primaryBlue,
        centerTitle: true,
        title:  Text("Age Calculation Screen",
          style:CustomTextStyles.mediumText(18.sp,color: Colors.white),),
      ),
      body: Column(
        children: [
          const Text(
            'Select your birthdate:',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _pickDate(context),
            child: Text(
              _selectedDate == null
                  ? 'Choose Date'
                  : DateFormat('dd/MM/yyyy').format(_selectedDate!),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            _age.isNotEmpty ? 'Your age is: $_age years' : 'Your age will appear here',
            style: CustomTextStyles.mediumText(12.sp,color: Colors.black),
          ),
        ],
      ),
    );
  }
}
