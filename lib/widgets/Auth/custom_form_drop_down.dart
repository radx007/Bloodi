import 'package:flutter/material.dart';

class CustomFormDropDown extends StatefulWidget {
  final List<String> items;
  final ValueChanged<String?>? onChanged;
  final String hintText;
  final Widget? suffixIcon;

  const CustomFormDropDown({
    super.key,
    this.onChanged,
    required this.hintText,
    this.suffixIcon,
    required this.items,
  });

  @override
  State<CustomFormDropDown> createState() => _CustomFormDropDownState();
}

class _CustomFormDropDownState extends State<CustomFormDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: DropdownButtonFormField(
        items: widget.items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Text(
                value,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        }).toList(),
        onChanged: (newValue) {
          // Notify the parent widget about the change
          if (widget.onChanged != null) {
            widget.onChanged!(newValue);
          }
        },
        isExpanded: true, // Ensures dropdown expands to fit content
        style: Theme.of(context).textTheme.titleMedium,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
         
          filled: true,
          fillColor: Colors.white,
          hintText: widget.hintText,
          hintStyle: Theme.of(context).textTheme.bodySmall,
          suffixIcon: widget.suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 230, 230, 230),
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 230, 230, 230),
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 230, 230, 230),
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}