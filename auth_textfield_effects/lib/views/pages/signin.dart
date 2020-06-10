
import 'package:auth_textfield_effects/common/custom_colors.dart';
import 'package:auth_textfield_effects/common/images.dart';
import 'package:auth_textfield_effects/controller/size_config.dart';
import 'package:auth_textfield_effects/views/widgets/custom_textfield.dart';
import 'package:auth_textfield_effects/views/widgets/footer.dart';
import 'package:auth_textfield_effects/views/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  double _elevation = 0;
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Widget _userAvatar = CircleAvatar(
    radius: SizeConfig.scaledWidth(55),
    backgroundImage: AssetImage(
      Images.AVATAR,
    ),
  );

  @override
  Widget build(BuildContext context) {
    //

    Widget _phoneTextField = Container(
      margin: EdgeInsets.symmetric(
        horizontal: SizeConfig.scaledWidth(30),
      ),
      child: CustomTextField(
        label: 'PHONE',
        controller: _phoneController,
        textInputType: TextInputType.phone,
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

    Widget _loginBtn = NextButton(
      onPressed: (){},
    );

    Widget _footer = Container(
      margin: EdgeInsets.only(
        top: SizeConfig.scaledHeight(20),
      ),
      child: Footer(onSigninPage: true),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            // horizontal: SizeConfig.scaledWidth(30),
            vertical: SizeConfig.scaledHeight(30),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      SizedBox(height: SizeConfig.scaledHeight(60)),
                      _userAvatar,
                      SizedBox(height: SizeConfig.scaledHeight(10)),
                      Text(
                        'Welcome Back',
                        style: TextStyle(
                          color: CustomColors.headerTextColor,
                          fontSize: SizeConfig.scaledFontSize(26),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: SizeConfig.scaledHeight(30)),
                      _phoneTextField,
                      SizedBox(height: SizeConfig.scaledHeight(50)),
                      _passwordField,
                      SizedBox(height: SizeConfig.scaledHeight(50)),
                      _loginBtn,
                    ],
                  ),
                ),
              ),
              _footer,
            ],
          ),
        ),
      ),
    );
  }
}
