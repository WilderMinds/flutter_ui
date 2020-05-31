import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_player/common/custom_colors.dart';
import 'package:music_player/common/images.dart';
import 'package:music_player/common/size_config.dart';

class PlayPauseBtn extends StatelessWidget {
  final bool play;
  const PlayPauseBtn({@required this.play});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: SizeConfig.scaledWidth(60),
      // height: SizeConfig.scaledWidth(80),
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.scaledHeight(15),
        horizontal: SizeConfig.scaledHeight(15),
      ),
      decoration: BoxDecoration(
        color: CustomColors.accentColor,
        borderRadius: BorderRadius.circular(
          SizeConfig.scaledWidth(10),
        ),
      ),
      child: SvgPicture.asset(
        play ? Images.PAUSE : Images.PLAY,
        height: SizeConfig.scaledWidth(26),
      ),
    );
  }
}
