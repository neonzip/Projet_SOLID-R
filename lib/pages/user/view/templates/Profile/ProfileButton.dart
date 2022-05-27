import 'package:flutter/material.dart';

class ProfileButton extends StatefulWidget {
  final double widthButton;
  final String textButton;
  final int positionButton;
  final IconData iconButton;
  final bool? isSelected;
  final void Function()? onPressedButton;

  const ProfileButton({Key? key, required this.widthButton, required this.textButton, required this.positionButton, required this.iconButton, required this.onPressedButton, this.isSelected}) : super(key: key);
  @override
  _ProfileButtonState createState() => _ProfileButtonState();
}

class _ProfileButtonState extends State<ProfileButton> {
  IconData? get iconButton => null;

  @override
  Widget build(BuildContext context) {
    return buttonTemplate();
  }

  /// Widget building the specific button.
  Widget buttonTemplate() {
    return Container(
      decoration: BoxDecoration(
        color: ((widget.isSelected == true) && (MediaQuery.of(context).orientation == Orientation.landscape)) ? const Color(0xFF0725A5) : Colors.white,
        borderRadius: chooseBorder(),
        boxShadow: const [BoxShadow(
          color: Color(0xFFAFC4FF),
          blurRadius: 2.0,
          spreadRadius: 0.05,
        )]
      ),
      width: widget.widthButton,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: widget.onPressedButton,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
            elevation: MaterialStateProperty.all(0),
        ),
        label: Text(
          widget.textButton,
          style: TextStyle(color: ((widget.isSelected == true) && (MediaQuery.of(context).orientation == Orientation.landscape)) ? Colors.white :Colors.black),
        ),
        icon: Icon(widget.iconButton, color: ((widget.isSelected == true) && (MediaQuery.of(context).orientation == Orientation.landscape)) ? Colors.white : Colors.black),
      ),
    );
  }

  BorderRadius chooseBorder() {
    if (widget.positionButton == 0) {
      return const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10));
    }
    if (widget.positionButton == 4) {
      return const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10));
    }
    else {
      return const BorderRadius.all(Radius.circular(0));
    }
  }
}