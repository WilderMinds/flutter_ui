
import 'package:auth_textfield_effects/common/custom_colors.dart';
import 'package:auth_textfield_effects/controller/router.dart';
import 'package:auth_textfield_effects/controller/size_config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final bool onSigninPage;
  const Footer({@required this.onSigninPage});

  @override
  Widget build(BuildContext context) {
    void _onPressed() {
      if (onSigninPage) {
        Navigator.pushNamed(context, Router.signupRoute);
      } else {
        Navigator.pop(context);
      }
    }

    return RichText(
      text: TextSpan(
        style:
            TextStyle(fontFamily: 'BalsamiqSans'),
        children: [
          TextSpan(
            text: onSigninPage
                ? 'Don\'t have an account? '
                : 'Already have an account? ',
            style: TextStyle(
              color: CustomColors.defaultTextColor,
              fontSize: SizeConfig.scaledFontSize(14),
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            text: onSigninPage ? 'Sign up' : 'Sign in',
            style: TextStyle(
              color: CustomColors.headerTextColor,
              fontSize: SizeConfig.scaledFontSize(15),
              fontWeight: FontWeight.w700,
            ),
            recognizer: TapGestureRecognizer()..onTap = _onPressed,
          ),
        ],
      ),
    );
  }
}
