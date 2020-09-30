import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final int maxLines;
  final bool obscure;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String errorText;
  final List<TextInputFormatter> maskFormatter;
  final FocusNode focusNode;
  final Function(String) onChanged;
  final bool showCursor;

  CustomTextField({@required this.label,
    this.hintText,
    this.maxLines,
    this.obscure,
    this.keyboardType,
    @required this.controller,
    this.errorText,
    this.maskFormatter, this.focusNode,this.onChanged,this.showCursor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(label,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        TextFormField(
          cursorColor: Colors.orange,
          controller: controller,
          keyboardType:
          keyboardType != null ? keyboardType : TextInputType.text,
          maxLines: maxLines != null ? maxLines : 1,
          obscureText: obscure,
          inputFormatters: maskFormatter,
          focusNode: focusNode,
          showCursor: showCursor != null ? showCursor : true,
          readOnly: showCursor != null ? true: false,
          decoration: InputDecoration(
            hintText: hintText,
            errorText: errorText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
          onChanged: (value){
            if(onChanged != null){
              onChanged(value);
            }
          },
        ),
      ],
    );
  }
}
