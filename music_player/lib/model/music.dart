import 'package:music_player/common/images.dart';

class Music {
  int id = -1;
  String title = '';
  String artist = '';
  double duration = 0;
  String albumArt = '';
  String albumTitle = '';
  bool isFavorite = false;

  Music({
    this.id,
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
        id: 1,
        title: 'I Know You Got Soul',
        artist: 'Eric B & Rakim',
        duration: 254,
        albumArt: Images.GOT_SOUL,
        albumTitle: '',
        isFavorite: false,
      ),
      Music(
        id: 2,
        title: 'Never Be Like You (feat. Kai)',
        artist: 'Flume',
        duration: 184,
        albumArt: Images.FLUME,
        albumTitle: 'Skin',
        isFavorite: false,
      ),
      Music(
        id: 3,
        title: 'In My Feelings',
        artist: 'Drake',
        duration: 164,
        albumArt: Images.SCORPION,
        albumTitle: 'Scorpion',
        isFavorite: false,
      ),
      Music(
        id: 4,
        title: 'ROCKSTAR (feat. Roddy Rich) ',
        artist: 'DaBaby',
        duration: 132,
        albumArt: Images.DABABY,
        albumTitle: 'BLAME IT ON BABY',
        isFavorite: false,
      ),
      Music(
        id: 5,
        title: 'Brighter Days (feat. Soweto Gospel Choir)',
        artist: 'Sauti Sol',
        duration: 264,
        albumArt: Images.SAUTI_SOL,
        albumTitle: 'Midnight Train',
        isFavorite: false,
      ),
    ];
  }

  static List<Music> getNewAlbumSongList() {
    return [
      Music(
        id: 6,
        title: 'This One\'s For You',
        artist: 'Luke Combs',
        duration: 254,
        albumArt: Images.COMBS,
        albumTitle: '',
        isFavorite: false,
      ),
      Music(
        id: 7,
        title: 'Die A Legend',
        artist: 'Polo G',
        duration: 254,
        albumArt: Images.POLO_G,
        albumTitle: '',
        isFavorite: false,
      ),
      Music(
        id: 8,
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
