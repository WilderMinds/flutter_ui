import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:music_player/common/custom_colors.dart';
import 'package:music_player/common/images.dart';
import 'package:music_player/common/size_config.dart';
import 'package:music_player/controller/utils.dart';
import 'package:music_player/model/music.dart';
import 'package:music_player/views/widget/header_text.dart';
import 'package:music_player/views/widget/playPauseBtn.dart';
import 'package:music_player/views/widget/songProgressText.dart';

class NowPlaying extends StatefulWidget {
  final Music music;
  final bool isPlaying;
  const NowPlaying({@required this.music, this.isPlaying});

  @override
  _NowPlayingState createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  Music _music;
  bool _isPlaying;
  double _progress = 0;
  List<Music> _musicList = Music.getFavoritesSongList();
  int _currentIndex;
  SwiperController _swiperController = SwiperController();

  @override
  void initState() {
    _music = widget.music;
    _isPlaying = widget.isPlaying ?? false;
    initPlaylist();
    super.initState();
  }

  void initPlaylist() {
    setState(() {
      _currentIndex = _musicList.indexWhere((m) => m.id == _music.id);
      _swiperController.index = _currentIndex;
    });
    print('current index = $_currentIndex');
  }

  void _prev() {
    _swiperController.previous(animation: true);
  }

  void _next() {
    _swiperController.next(animation: true);
  }

  void _songChanged(int index) {
    print('song changed => $index');
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //
    _music = _musicList[_currentIndex];

    final _swiper = Swiper(
      controller: _swiperController,
      itemCount: _musicList.length,
      viewportFraction: 0.8,
      scale: 0.9,
      index: _currentIndex,
      onIndexChanged: _songChanged,
      loop: true,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: SizeConfig.scaledHeight(20),
          ),
          child: Material(
            color: Colors.transparent,
            elevation: SizeConfig.scaledHeight(8),
            borderRadius: BorderRadius.circular(
              SizeConfig.scaledWidth(25),
            ),
            clipBehavior: Clip.antiAlias,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    _musicList[index].albumArt,
                  ),
                  fit: BoxFit.cover,
                ),
                color: Colors.transparent,
              ),
            ),
          ),
        );
      },
      autoplay: false,
    );

    final Widget _prevBtn = GestureDetector(
      onTap: _prev,
      child: SvgPicture.asset(
        Images.PREVIOUS,
        height: SizeConfig.scaledHeight(20),
        color: CustomColors.textHeader.withOpacity(.3),
      ),
    );

    final Widget _nextBtn = GestureDetector(
      onTap: _next,
      child: SvgPicture.asset(
        Images.NEXT,
        height: SizeConfig.scaledHeight(20),
        color: CustomColors.textHeader.withOpacity(.3),
      ),
    );

    _durationAndProgess() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.scaledWidth(40),
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: SizeConfig.scaledHeight(2),
              child: LinearProgressIndicator(
                backgroundColor: CustomColors.textHeader.withOpacity(.2),
                valueColor:
                    AlwaysStoppedAnimation<Color>(CustomColors.accentColor),
                value: _progress,
              ),
            ),
            SizedBox(height: SizeConfig.scaledHeight(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SongProgressText(
                  text: '123',
                  dark: true,
                ),
                SongProgressText(
                  text: Utils.formatSongDuration(_music.duration),
                  dark: true,
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: SizeConfig.scaledHeight(30)),
            HeaderText(text: 'Now Playing'),
            SizedBox(height: SizeConfig.scaledHeight(20)),
            Expanded(
              child: Container(
                child: _swiper,
              ),
            ),
            SizedBox(height: SizeConfig.scaledHeight(20)),
            Text(
              _music.title,
              style: TextStyle(
                color: CustomColors.textHeader,
                fontSize: SizeConfig.scaledFontSize(17),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: SizeConfig.scaledHeight(5)),
            Text(
              _music.artist,
              style: TextStyle(
                color: CustomColors.textHeader.withOpacity(.5),
                fontSize: SizeConfig.scaledFontSize(14),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: SizeConfig.scaledHeight(35)),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _prevBtn,
                SizedBox(width: SizeConfig.scaledWidth(50)),
                PlayPauseBtn(
                  play: _isPlaying,
                ),
                SizedBox(width: SizeConfig.scaledWidth(50)),
                _nextBtn,
              ],
            ),
            SizedBox(height: SizeConfig.scaledHeight(35)),
            _durationAndProgess(),
            SizedBox(height: SizeConfig.scaledHeight(15)),
          ],
        ),
      ),
    );
  }
}
