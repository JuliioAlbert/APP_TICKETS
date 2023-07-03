import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomSelectField<T> extends StatelessWidget {
  const CustomSelectField({
    Key? key,
    required this.name,
    required this.label,
    required this.items,
  }) : super(key: key);

  final String name;
  final String label;
  final List<DropdownMenuItem<T>> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormBuilderDropdown(
          alignment: Alignment.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: label,
          ),
          name: name,
          items: items,
        ),
      ],
    );
  }
}
