import 'package:flutter/material.dart';

class CustomDropDownFormField extends StatelessWidget {
  final String? value;
  final List<String> items;
  final String label;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final bool validated;
  final bool isMandate;
  final String textFormLabel;
  final VoidCallback? onTap;
  final List<String>? disabledItems;

  const CustomDropDownFormField({
    super.key,
    this.value,
    required this.items,
    required this.label,
    this.onChanged,
    this.validator,
    this.onSaved,
    this.validated = false,
    this.isMandate = false,
    this.textFormLabel = "Comment",
    this.onTap,
    this.disabledItems,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField<String>(
          borderRadius: BorderRadius.circular((10)),
          value: value,
          icon: const Icon(Icons.keyboard_arrow_down_outlined),
          onChanged: onChanged,
          validator: validator,
          autovalidateMode: validated
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          onTap: onTap,
          items: items.map<DropdownMenuItem<String>>((String value) {
            bool isDisabled = disabledItems?.contains(value) ?? false;
            return DropdownMenuItem<String>(
              value: value,
              enabled: !isDisabled,
              child: Text(
                value,
                style: TextStyle(
                  color: isDisabled ? Colors.grey : Colors.black,
                ),
              ),
            );
          }).toList(),
          decoration: InputDecoration(
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(label),
                if (isMandate)
                  const Text(
                    " *",
                    style: TextStyle(color: Colors.red),
                  ),
              ],
            ),
            hintText: "Select $label",
          ),
        ),
        Visibility(
          visible: value == "Other" || value == "Problem (Entry)",
          child: SizedBox(height: (10)),
        ),
        Visibility(
          visible: value == "Other" || value == "Problem (Entry)",
          child: TextFormField(
            validator: validator,
            onSaved: onSaved,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            autovalidateMode: validated
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,
            decoration: InputDecoration(
              label: Row(
                children: [
                  Text(textFormLabel),
                  if (isMandate)
                    const Text(
                      " *",
                      style: TextStyle(color: Colors.red),
                    ),
                ],
              ),
              hintText: "Enter $textFormLabel",
            ),
          ),
        ),
      ],
    );
  }
}
