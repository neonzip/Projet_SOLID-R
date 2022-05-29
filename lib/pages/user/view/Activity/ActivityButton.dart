import 'package:flutter/material.dart';

class ActivityButton extends StatefulWidget {
  final void Function()? onPressedButton;
  final IconData icon;
  final Color? color;
  final String? tooltip;

  const ActivityButton({Key? key, required this.icon, required this.onPressedButton, required this.color, required this.tooltip}) : super(key: key);
  @override
  _ActivityButtonState createState() => _ActivityButtonState();
}

class _ActivityButtonState extends State<ActivityButton> {
  @override
  Widget build(BuildContext context) {
    return button();
  }

  /// Button to donate to the specific project.
  /// Called "Donner".
  Widget button() {
    return IconButton(
      tooltip: widget.tooltip,
      onPressed: widget.onPressedButton,
      iconSize: 100,
      icon: Icon(
        widget.icon,
        color: widget.color,
      ),
    );
  }
}