import 'package:flutter/material.dart';
import 'package:music_player/common/custom_colors.dart';
import 'package:music_player/common/size_config.dart';
import 'package:music_player/controller/utils.dart';
import 'package:music_player/model/music.dart';

class FavoriteMusic extends StatefulWidget {
  final Music music;
  const FavoriteMusic({@required this.music});

  @override
  _FavoriteMusicState createState() => _FavoriteMusicState();
}

class _FavoriteMusicState extends State<FavoriteMusic> {
  Music _music;
  bool _isPlaying = false;
  bool _isSelected = false;
  

  @override
  void initState() {
    _music = widget.music;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //

    final _coverArt = Material(
      elevation: SizeConfig.scaledHeight(10),
      borderRadius: BorderRadius.circular(
        SizeConfig.scaledWidth(10),
      ),
      child: Container(
        width: SizeConfig.scaledWidth(45),
        height: SizeConfig.scaledWidth(45),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            SizeConfig.scaledWidth(10),
          ),
          image: DecorationImage(
            image: AssetImage(
              _music.albumArt,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );

    Widget _durationAndPlayingAnimation() {
      return Container(
        child: Visibility(
          child: Text(
            Utils.formatSongDuration(_music.duration),
            style: TextStyle(
              fontSize: SizeConfig.scaledFontSize(13),
              fontWeight: FontWeight.w500,
              color: CustomColors.textHeader.withOpacity(.5),
            ),
          ),
          visible: !_isSelected,
          replacement: Container(
            child: Text('animate'),
          ),
        ),
      );
    }

    final _songTitleAndArtist = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Text(
                  _music.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: SizeConfig.scaledFontSize(15),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(width: SizeConfig.scaledWidth(20)),
              _durationAndPlayingAnimation(),
            ],
          ),
          Text(
            '${_music.artist}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: SizeConfig.scaledFontSize(12),
              fontWeight: FontWeight.w500,
              color: CustomColors.textHeader.withOpacity(.5),
            ),
          ),
        ],
      ),
    );

    return Container(
      child: Row(
        children: <Widget>[
          _coverArt,
          SizedBox(width: SizeConfig.scaledWidth(20)),
          Expanded(
            child: _songTitleAndArtist,
          ),
        ],
      ),
    );
  }
}
