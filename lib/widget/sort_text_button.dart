import 'package:flutter/material.dart';

class SortTextButton extends StatelessWidget {
  final bool isSelected;
  final String buttonText;
  const SortTextButton({Key? key, required this.buttonText,required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      buttonText,
      style: TextStyle(
        color: isSelected
            ? Theme.of(context).textSelectionTheme.selectionColor
            : Theme.of(context).disabledColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
