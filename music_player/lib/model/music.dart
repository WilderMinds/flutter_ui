import 'package:music_player/common/images.dart';

class Music {
  String title;
  String artist;
  double duration;
  String albumArt;
  String albumTitle;
  bool isFavorite;

  Music({
    this.title,
    this.artist,
    this.duration,
    this.albumArt,
    this.albumTitle,
    this.isFavorite,
  });

  static List<Music> getFavoritesSongList() {
    return [
      Music(
        title: 'I Know You Got Soul',
        artist: 'Eric B & Rakin',
        duration: 254,
        albumArt: '',
        albumTitle: '',
        isFavorite: false,
      ),
      Music(
        title: 'Baby',
        artist: 'Justin Beiber & Ludacris',
        duration: 254,
        albumArt: '',
        albumTitle: 'My World 2.0',
        isFavorite: false,
      ),
      Music(
        title: 'In My Feelings',
        artist: 'Drake',
        duration: 254,
        albumArt: '',
        albumTitle: 'Scorpion',
        isFavorite: false,
      ),
    ];
  }

  static List<Music> getNewAlbumSongList() {
    return [
      Music(
        title: 'This One\'s For You',
        artist: 'Luke Combs',
        duration: 254,
        albumArt: Images.COMBS,
        albumTitle: '',
        isFavorite: false,
      ),
      Music(
        title: 'Die A Legend',
        artist: 'Polo G',
        duration: 254,
        albumArt: Images.POLO_G,
        albumTitle: '',
        isFavorite: false,
      ),
      Music(
        title: 'Tears Don\'t Fall',
        artist: 'Bullet For My Valentine',
        duration: 254,
        albumArt: Images.BULLET_FOR_MY_VALENTINE,
        albumTitle: '',
        isFavorite: true,
      ),
    ];
  }
}
