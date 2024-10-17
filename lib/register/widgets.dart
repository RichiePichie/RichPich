import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  final double edgeInset;
  CustomWidget({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
    required this.edgeInset,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Call the onTap function passed from the parent widget
      child: Padding(
        padding: EdgeInsets.only(top: edgeInset),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.05,
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          width: MediaQuery.of(context).size.width * 0.7,
          child: Center(child: Text(title)),
        ),
      ),
    );
  }
}
