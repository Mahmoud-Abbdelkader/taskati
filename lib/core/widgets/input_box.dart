import 'package:flutter/material.dart';

class InputBox extends StatefulWidget {
  const InputBox({
    super.key,
    required this.hint,
    this.validator,
    this.keyboardtype,
    this.ontap,
    this.enable = true,
  });
  final String hint;
  final String? Function(String?)? validator;
  final TextInputType? keyboardtype;
  final bool enable;
  final Function()? ontap;
  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enable,
      onTap: widget.ontap,
      validator: widget.validator,
      keyboardType: widget.keyboardtype,
      decoration: InputDecoration(
        hintText: widget.hint,
        
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(15),
        //   borderSide: BorderSide.none,
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(15),
        //   borderSide: BorderSide.none,
        // ),
        // errorBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(15),
        //   borderSide: BorderSide.none,
        // ),
        // disabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(15),
        //   borderSide: BorderSide.none,
        // ),
      ),
    );
  }
}
