import 'package:flutter/material.dart';

class CcardFilter extends StatelessWidget {
  final String filterText;
  final ValueChanged<String> onFilterChanged;

  const CcardFilter({
    Key? key,
    required this.filterText,
    required this.onFilterChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: onFilterChanged,
        decoration: InputDecoration(
          labelText: 'Filter your list!',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
    );
  }
}
