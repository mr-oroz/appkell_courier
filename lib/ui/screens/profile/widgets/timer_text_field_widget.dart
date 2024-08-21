import 'package:appkel_for_courier_flutter/helpers/formatter.dart';
import 'package:flutter/material.dart';

class TimerTextFieldWidget extends StatelessWidget {
  const TimerTextFieldWidget({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      
      height: 50,
      child: TextField(
        controller: controller,
        style: const TextStyle(
          color: Color(0xFF222222),
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        inputFormatters: [
          timerFormatter,
        ],
        decoration: const InputDecoration(
          hintStyle: TextStyle(
            color: Color(0xFF222222),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          hintText: '08:00-23:00',
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black26),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black26),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black26),
              borderRadius: BorderRadius.all(Radius.circular(12))),
        ),
      ),
    );
  }
}
