import 'package:flutter/material.dart';
import 'package:music_player/common/size_config.dart';
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

    final _coverArt = Container(
      width: SizeConfig.scaledWidth(50),
      height: SizeConfig.scaledWidth(50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          SizeConfig.scaledWidth(20),
        ),
        image: DecorationImage(
          image: AssetImage(
            _music.albumArt,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );

    final _songTitleAndArtist = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(_music.title),
          Text(_music.artist),
        ],
      ),
    );

    Widget _durationAndPlayingAnimation() {
      return Container(
        child: Visibility(
          child: Text(_music.duration.toString()),
          visible: !_isSelected,
          replacement: Container(
            child: Text('animate'),
          ),
        ),
      );
    }

    return Container(
      child: Row(
        children: <Widget>[
          _coverArt,
          Expanded(
            child: _songTitleAndArtist,
          ),
          _durationAndPlayingAnimation(),
        ],
      ),
    );
  }
}
