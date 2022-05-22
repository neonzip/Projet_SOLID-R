import 'package:flutter/material.dart';

/// Widget which builds an item for the filters used in the projects list.
class ItemFilter extends StatefulWidget {
  final bool? isSelected;
  final void Function(bool?)? onChanged;
  final String textItem;

  const ItemFilter({Key? key, required this.isSelected, required this.onChanged, required this.textItem}) : super(key: key);
  @override
  _ItemFilterState createState() => _ItemFilterState();
}

class _ItemFilterState extends State<ItemFilter> {

  @override
  Widget build(BuildContext context) {
    return item();
  }

  /// Widget building the item.
  Widget item() {
    return SizedBox(
      height: 35,
      child: CheckboxListTile(
        side: const BorderSide(color: Color(0xFF0725A5)),
        activeColor: const Color(0xFF0725A5),
        checkColor: Colors.yellow,
        title: Text(widget.textItem, style: const TextStyle(color: Color(0xFF0725A5))),
        value: widget.isSelected,
        onChanged: widget.onChanged,
      ),
    );
  }
}