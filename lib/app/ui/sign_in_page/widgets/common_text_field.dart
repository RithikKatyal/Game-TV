import 'package:flutter/material.dart';
import 'package:game_tv/core_utils/screenutil.dart';
import 'package:game_tv/utils/strings/app_translations.dart';

class CommonTextField extends StatefulWidget {
  final String displayName;
  final bool isObscure;
  final String labelText;
  final TextEditingController controller;
  final Function? callback;
  const CommonTextField(
      {Key? key,
      required this.displayName,
      required this.isObscure,
      required this.labelText,
      required this.controller,
      this.callback})
      : super(key: key);

  @override
  _CommonTextFieldState createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  bool _validate = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.displayName),
        TextField(
          controller: widget.controller,
          obscureText: widget.isObscure,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.toHeight)),
              labelText: widget.labelText,
              errorText: _validate
                  ? null
                  : Translations.getInstance.text(Translations.kErrorText)!),
          autofocus: false,
          onEditingComplete: () {
            FocusScope.of(context).unfocus();
            String value = widget.controller.text;
            if (value.isEmpty || value.length < 3 || value.length > 11) {
              setState(() {
                _validate = false;
              });
            } else {
              setState(() {
                _validate = true;
              });
            }
            widget.callback!(_validate);
          },
          onChanged: (value) {
            if (value.isEmpty || value.length < 3 || value.length > 11) {
              setState(() {
                _validate = false;
              });
            } else {
              setState(() {
                _validate = true;
              });
            }
            widget.callback!(_validate);
          },
        ),
      ],
    );
  }
}
