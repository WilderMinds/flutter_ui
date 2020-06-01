import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_player/common/custom_colors.dart';
import 'package:music_player/common/images.dart';
import 'package:music_player/common/size_config.dart';
import 'package:music_player/controller/router.dart';
import 'package:music_player/controller/utils.dart';
import 'package:music_player/model/music.dart';
import 'package:music_player/views/widget/album_item.dart';
import 'package:music_player/views/widget/customDrawer.dart';
import 'package:music_player/views/widget/favorite_music.dart';
import 'package:music_player/views/widget/header_text.dart';
import 'package:music_player/views/widget/playPauseBtn.dart';
import 'package:music_player/views/widget/songProgressText.dart';

class Home extends StatefulWidget {
  final ValueChanged<void> onMenuPressed;
  const Home({this.onMenuPressed, Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _aSongIsSelected = false;
  bool _songIsPlaying = false;
  List _newAlbumList = Music.getNewAlbumSongList();
  List _favoritesList = Music.getFavoritesSongList();
  Music _selectedSong = Music();
  double _progress = 0;

  // GlobalKey<CustomDrawerState> _customDrawerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  // the play/pause toggle for the now playing section
  void _togglePlay() {
    setState(() {
      _songIsPlaying = !_songIsPlaying;
    });
  }

  void _toggleNavDrawer() {
    widget.onMenuPressed(null);
  }

  String _songDuration() {}

  String _songProgress() {}

  void calculateProgress(int position) {
    setState(() {
      _progress = (position / _selectedSong.duration);
      print(_progress);
    });
  }

  @override
  Widget build(BuildContext context) {
    //

    final _appBar = Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.scaledWidth(20),
        vertical: SizeConfig.scaledWidth(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: _toggleNavDrawer,
            child: SvgPicture.asset(
              Images.MENU,
              height: SizeConfig.scaledHeight(24),
            ),
          ),
          SvgPicture.asset(
            Images.SEARCH,
            height: SizeConfig.scaledHeight(24),
          ),
        ],
      ),
    );

    _durationAndProgess() {
      return Column(
        children: <Widget>[
          Container(
            height: SizeConfig.scaledHeight(2),
            child: LinearProgressIndicator(
              backgroundColor: Colors.white,
              valueColor:
                  AlwaysStoppedAnimation<Color>(CustomColors.accentColor),
              value: _progress,
            ),
          ),
          SizedBox(height: SizeConfig.scaledHeight(3)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SongProgressText(
                text: '123',
                dark: false,
              ),
              SongProgressText(
                text: Utils.formatSongDuration(_selectedSong.duration),
                dark: false,
              ),
            ],
          ),
        ],
      );
    }

    final _nowPlaying = Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '${_selectedSong.title} - ${_selectedSong.artist}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: SizeConfig.scaledFontSize(13),
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
        _durationAndProgess(),
      ],
    );

    final _nowPlayingSection = Container(
      margin: EdgeInsets.fromLTRB(
        SizeConfig.scaledWidth(20),
        0,
        SizeConfig.scaledWidth(20),
        SizeConfig.scaledWidth(20),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.scaledWidth(7),
        vertical: SizeConfig.scaledWidth(5),
      ),
      height: SizeConfig.scaledHeight(70),
      decoration: BoxDecoration(
        color: CustomColors.nowPlayingBg,
        borderRadius: BorderRadius.circular(
          SizeConfig.scaledWidth(15),
        ),
        image: _selectedSong.albumArt == null || _selectedSong.albumArt.isEmpty
            ? null
            : DecorationImage(
                image: AssetImage(
                  _selectedSong.albumArt,
                ),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  CustomColors.nowPlayingBg.withOpacity(.5),
                  BlendMode.srcOver,
                ),
              ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Router.nowPlayingRoute,
                  arguments: [_selectedSong, _songIsPlaying],
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.scaledWidth(15),
                  vertical: SizeConfig.scaledHeight(5),
                ),
                child: _nowPlaying,
              ),
            ),
          ),
          GestureDetector(
            onTap: _togglePlay,
            child: PlayPauseBtn(
              play: _songIsPlaying,
            ),
          ),
        ],
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
              Padding(
                padding: EdgeInsets.only(
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
            Music _music = _favoritesList[index];
            return GestureDetector(
              onTap: () {
                print('selected song => ${_music.title}');
                setState(() {
                  _selectedSong = _music;
                  _aSongIsSelected = true;
                  _songIsPlaying = true;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  // vertical: SizeConfig.scaledHeight(10),
                  horizontal: SizeConfig.scaledWidth(20),
                ),
                child: Column(
                  children: <Widget>[
                    Divider(),
                    SizedBox(height: SizeConfig.scaledHeight(5)),
                    FavoriteMusic(
                      music: _music,
                    ),
                    SizedBox(height: SizeConfig.scaledHeight(5)),
                    Visibility(
                      visible: index == _favoritesList.length - 1,
                      child: Divider(),
                    ),
                  ],
                ),
              ),
            );
          },
          childCount: _favoritesList.length,
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

    Widget _navMenu = Container(color: CustomColors.navDrawerBg);
    Widget _home = Container(color: Colors.yellow);

    Widget _body() {
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
                child: _nowPlayingSection,
                replacement: Container(),
                visible: _aSongIsSelected,
              ),
            ],
          ),
        ),
      );
    }

    // return Scaffold(
    //   body: CustomDrawer(
    //     navMenu: _navMenu,
    //     homeScreen: _body(),
    //     key: _customDrawerKey,
    //   ),
    // );

    return Scaffold(
      body: SafeArea(
        child: _body(),
      ),
    );
  }
}
