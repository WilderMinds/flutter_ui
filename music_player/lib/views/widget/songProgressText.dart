import 'package:flutter/material.dart';
import 'package:music_player/common/size_config.dart';

class SongProgressText extends StatelessWidget {
  final String text;
  final bool dark;
  const SongProgressText({@required this.text, @required this.dark});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color:
            dark ? Colors.black.withOpacity(.7) : Colors.white.withOpacity(.7),
        fontSize: SizeConfig.scaledFontSize(10),
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
