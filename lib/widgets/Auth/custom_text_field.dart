import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? isObscureText;
  final String? obscureCharactere;
  final String hintText;
  final Widget? suffixIcon;
  const CustomTextField({
    super.key,
    required this.controller,
    this.keyboardType = TextInputType.name,
    this.isObscureText = false,
    this.obscureCharactere = '*',
    required this.hintText,
    this.suffixIcon,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: TextFormField(
        obscureText: _obscureText,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscuringCharacter: widget.obscureCharactere!,
        style: Theme.of(context).textTheme.titleMedium,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          constraints: BoxConstraints(
            maxHeight: height * 0.065,
            maxWidth: width,
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: widget.hintText,
          hintStyle: Theme.of(context).textTheme.bodySmall,
          suffixIcon: widget.hintText == 'Password'
              ? IconButton(
                  icon: Icon(
                    _obscureText == true  ? Icons.visibility : Icons.visibility_off,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : widget.suffixIcon,
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
