import 'package:auth_textfield_effects/common/custom_colors.dart';
import 'package:auth_textfield_effects/common/images.dart';
import 'package:auth_textfield_effects/controller/size_config.dart';
import 'package:auth_textfield_effects/views/widgets/custom_textfield.dart';
import 'package:auth_textfield_effects/views/widgets/footer.dart';
import 'package:auth_textfield_effects/views/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //

    Widget _backBtn = GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        margin: EdgeInsets.only(
          left: SizeConfig.scaledWidth(30),
        ),
        child: SvgPicture.asset(
          Images.BACK_ICON,
          height: SizeConfig.scaledHeight(28),
          fit: BoxFit.contain,
          color: CustomColors.defaultTextColor,
        ),
      ),
    );

    Widget _fullNameField = Container(
      margin: EdgeInsets.symmetric(
        horizontal: SizeConfig.scaledWidth(30),
      ),
      child: CustomTextField(
        label: 'FULL NAME',
        controller: _fullNameController,
        // key: UniqueKey(),
      ),
    );

    Widget _emailField = Container(
      margin: EdgeInsets.symmetric(
        horizontal: SizeConfig.scaledWidth(30),
      ),
      child: CustomTextField(
        label: 'EMAIL',
        controller: _emailController,
        textInputType: TextInputType.emailAddress,
        // key: UniqueKey(),
      ),
    );

    Widget _passwordField = Container(
      margin: EdgeInsets.symmetric(
        horizontal: SizeConfig.scaledWidth(30),
      ),
      child: CustomTextField(
        label: 'PASSWORD',
        controller: _passwordController,
        obscureText: true,
        // key: UniqueKey(),
      ),
    );

    Widget _confirmPasswordField = Container(
      margin: EdgeInsets.symmetric(
        horizontal: SizeConfig.scaledWidth(30),
      ),
      child: CustomTextField(
        label: 'CONFIRM PASSWORD',
        controller: _confirmPasswordController,
        obscureText: true,
        // key: UniqueKey(),
      ),
    );

    Widget _signupBtn = NextButton(
      onPressed: () {},
    );

    Widget _footer = Container(
      margin: EdgeInsets.only(
        top: SizeConfig.scaledHeight(20),
      ),
      child: Footer(onSigninPage: false),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: SizeConfig.scaledHeight(30),
          ),
          child: Column(
            children: <Widget>[
              Row(children: <Widget>[_backBtn]),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: SizeConfig.scaledHeight(60)),
                      Text(
                        'Create Account',
                        style: TextStyle(
                          color: CustomColors.headerTextColor,
                          fontSize: SizeConfig.scaledFontSize(28),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: SizeConfig.scaledHeight(30)),
                      _fullNameField,
                      SizedBox(height: SizeConfig.scaledHeight(40)),
                      _emailField,
                      SizedBox(height: SizeConfig.scaledHeight(40)),
                      _passwordField,
                      SizedBox(height: SizeConfig.scaledHeight(40)),
                      _confirmPasswordField,
                      SizedBox(height: SizeConfig.scaledHeight(50)),
                      _signupBtn,
                    ],
                  ),
                ),
              ),
              _footer
            ],
          ),
        ),
      ),
    );
  }
}
