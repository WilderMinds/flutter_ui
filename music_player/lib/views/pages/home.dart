import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_player/common/custom_colors.dart';
import 'package:music_player/common/images.dart';
import 'package:music_player/common/size_config.dart';
import 'package:music_player/model/music.dart';
import 'package:music_player/views/widget/album_item.dart';
import 'package:music_player/views/widget/favorite_music.dart';
import 'package:music_player/views/widget/header_text.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isPlaying = true;
  List _newAlbumList = Music.getNewAlbumSongList();

  @override
  void initState() {
    super.initState();
  }

  void _togglePlay() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  final _appBar = Container(
    padding: EdgeInsets.only(
      top: SizeConfig.scaledWidth(20),
      left: SizeConfig.scaledWidth(20),
      right: SizeConfig.scaledWidth(20),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SvgPicture.asset(
          Images.MENU,
          height: SizeConfig.scaledHeight(24),
        ),
        SvgPicture.asset(
          Images.SEARCH,
          height: SizeConfig.scaledHeight(24),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    //

    final _nowPlaying = Container(
      padding: EdgeInsets.only(
        left: SizeConfig.scaledWidth(20),
        right: SizeConfig.scaledWidth(20),
        bottom: SizeConfig.scaledWidth(20),
        top: SizeConfig.scaledWidth(20),
      ),
      height: SizeConfig.scaledHeight(80),
      decoration: BoxDecoration(
          color: CustomColors.nowPlayingBg,
          borderRadius: BorderRadius.circular(
            SizeConfig.scaledWidth(20),
          )),
      child: Row(
        children: <Widget>[Text('asasa')],
      ),
    );

    final _albumRows = ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: _newAlbumList.length,
      itemBuilder: (context, index) {
        Music music = _newAlbumList[index];
        return Padding(
          padding: EdgeInsets.only(
            left: SizeConfig.scaledWidth(index == 0 ? 20 : 0),
            right: SizeConfig.scaledWidth(
                index == _newAlbumList.length - 1 ? 20 : 0),
          ),
          child: AlbumItem(
            music: music,
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          width: SizeConfig.scaledWidth(20),
        );
      },
    );

    Widget _albumSection() {
      return SliverToBoxAdapter(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: SizeConfig.scaledHeight(15)),
              Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.scaledHeight(10),
                  bottom: SizeConfig.scaledHeight(10),
                  left: SizeConfig.scaledWidth(20),
                ),
                child: HeaderText(text: 'New Album'),
              ),
              Container(
                height: SizeConfig.scaledHeight(270),
                child: _albumRows,
              ),
            ],
          ),
        ),
      );
    }

    Widget _buildFavoriteSongList() {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            Music _music = _newAlbumList[index];
            return FavoriteMusic(
              music: _music,
            );
          },
          childCount: _newAlbumList.length,
        ),
      );
    }

    Widget _favoriteTitle() {
      return SliverToBoxAdapter(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.scaledHeight(20),
                  bottom: SizeConfig.scaledHeight(10),
                  left: SizeConfig.scaledWidth(20),
                ),
                child: HeaderText(
                  text: 'Favorites',
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _appBar,
            Expanded(
              child: CustomScrollView(
                slivers: <Widget>[
                  _albumSection(),
                  _favoriteTitle(),
                  _buildFavoriteSongList(),
                ],
              ),
            ),
            Visibility(
              child: _nowPlaying,
              replacement: Container(),
              visible: _isPlaying,
            ),
          ],
        ),
      ),
    );
  }
}
