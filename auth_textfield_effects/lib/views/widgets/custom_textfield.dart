import 'package:auth_textfield_effects/common/custom_colors.dart';
import 'package:auth_textfield_effects/controller/size_config.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool obscureText;
  const CustomTextField({
    @required this.label,
    @required this.controller,
    this.obscureText,
    this.textInputType,
  }); //, Key key})
  // : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String _label;
  TextEditingController _controller;
  TextInputType _textInputType;
  double _elevation = 0;
  bool _obscureText;

  FocusNode _fieldFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    // get args
    _label = widget.label;
    _controller = widget.controller;

    // optionals
    _obscureText = widget.obscureText ?? false;
    _textInputType = widget.textInputType ?? TextInputType.text;

    // set listeners to focus nodes
    _fieldFocusNode.addListener(_onFieldFocusChanged);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onFieldFocusChanged() {
    print('phone has focus => ${_fieldFocusNode.hasFocus}');
    setState(() {
      _elevation = _fieldFocusNode.hasFocus ? 15.0 : 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      animationDuration: Duration(
        milliseconds: 500,
      ),
      color: Colors.white,
      shadowColor: CustomColors.textfieldShadowColor,
      elevation: _elevation,
      borderOnForeground: true,
      borderRadius: BorderRadius.circular(
        SizeConfig.scaledWidth(5),
      ),
      child: TextField(
        controller: _controller,
        focusNode: _fieldFocusNode,
        obscureText: _obscureText,
        keyboardType: _textInputType,
        style: TextStyle(
          color: CustomColors.headerTextColor,
          fontWeight: FontWeight.w700,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: SizeConfig.scaledHeight(10),
            horizontal: SizeConfig.scaledWidth(10),
          ),
          // suffix: Text(
          //   'FORGOT',
          //   style: TextStyle(
          //     color: CustomColors.headerTextColor,
          //     fontWeight: FontWeight.w700,
          //     fontSize: SizeConfig.scaledFontSize(12),
          //   ),
          // ),
          labelText: _label,
          labelStyle: TextStyle(
            color: CustomColors.defaultTextColor,
            fontWeight: FontWeight.w700,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: CustomColors.textfieldShadowColor,
              width: 1,
            ),
          ),
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
