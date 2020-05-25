import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/common/custom_colors.dart';
import 'package:music_player/common/size_config.dart';
import 'package:music_player/model/music.dart';

class AlbumItem extends StatefulWidget {
  final Music music;
  const AlbumItem({@required this.music});

  @override
  _AlbumItemState createState() => _AlbumItemState();
}

class _AlbumItemState extends State<AlbumItem> {
  Music _music;

  @override
  void initState() {
    super.initState();
    _music = widget.music;
  }

  void _toggle() {
    setState(() {
      _music.isFavorite = !_music.isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    //

    Widget _favorite() {
      return GestureDetector(
        onTap: _toggle,
        child: Container(
          padding: EdgeInsets.all(
            SizeConfig.scaledWidth(7),
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white54,
          ),
          child: Icon(
            Icons.favorite,
            // CupertinoIcons.heart_solid,
            color: _music.isFavorite ? CustomColors.accentColor : Colors.white,
            size: SizeConfig.scaledWidth(16),
          ),
        ),
      );
    }

    return Stack(
      children: <Widget>[
        Material(
          elevation: SizeConfig.scaledHeight(10),
          borderRadius: BorderRadius.circular(
            SizeConfig.scaledWidth(25),
          ),
          child: Container(
            width: SizeConfig.scaledWidth(150),
            height: SizeConfig.scaledHeight(250),
            decoration: BoxDecoration(
              // boxShadow: <BoxShadow>[
              //   BoxShadow(
              //       color: Colors.black54,
              //       blurRadius: 15.0,
              //       offset: Offset(0.0, 0.75))
              // ],
              image: DecorationImage(
                image: AssetImage(
                  _music.albumArt,
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(
                SizeConfig.scaledWidth(25),
              ),
            ),
          ),
        ),
        Container(
          width: SizeConfig.scaledWidth(150),
          height: SizeConfig.scaledHeight(250),
          padding: EdgeInsets.symmetric(
            vertical: SizeConfig.scaledHeight(15),
            horizontal: SizeConfig.scaledHeight(10),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              SizeConfig.scaledWidth(25),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black87,
              ],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[_favorite()],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _music.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.w600,
                      fontSize: SizeConfig.scaledFontSize(18),
                    ),
                  ),
                  Text(
                    _music.artist,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.scaledFontSize(13),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
