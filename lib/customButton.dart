import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  Function onCliked;
  CustomButton({required this.title,required this.onCliked});
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: ElevatedButton(
        onPressed: () {onCliked(title);},
        child: Text(title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
    ));
  }
}
