import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/song.dart';

// ignore: camel_case_types
class PlayListProvider extends ChangeNotifier {
  final List<Song> _playList = [
    //Song 1
    Song(
      songName: ' سورة الفاتحة',
      artistName: ' محمد صديق المنشاوي ',
      artImagePath: 'assets/image/1.jpg',
      audioPath: 'assets/audio/1.mp3',
    ),
    //SOng 2
    Song(
      songName: ' سورة البقرة',
      artistName: ' ياسر الدوسري  ',
      artImagePath: 'assets/image/2.jpg',
      audioPath: 'assets/audio/2.mp3',
    ),
    // Song 3
    Song(
      songName: ' سورة آل عمران',
      artistName: ' ماهر المعيقلى',
      artImagePath: 'assets/image/3.jpg',
      audioPath: 'assets/audio/3.mp3',
    ),
  ];
/*
************* audio player***********
*/

//*********** */ audio player **************
  final AudioPlayer _audioplayer = AudioPlayer();

//**************duration******************
  Duration _currentDuration = Duration.zero;
// ignore: prefer_final_fields
  Duration _totalDuration = Duration.zero;
//*****************constructor *************
  PlayListProvider() {
    listenToDuration();
  }
//initialliy not playing
  bool _isPlaying = false;
//****************play the song *******************
// ignore: non_constant_identifier_names
  void Play() async {
    // ignore: no_leading_underscores_for_local_identifiers
    final _audioPlayer = _playList[_currentSongIndex!].audioPath;
    await _audioplayer.stop(); // stop current song
    await _audioplayer.play(AssetSource(_audioPlayer));
    _isPlaying = true;
    notifyListeners();
  }

//*************pause current song************
  void pause() async {
    await _audioplayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

//************resume playing************
  void resume() async {
    await _audioplayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

//***********pause or resume***********
  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

//**************seek specific position in the current song**********
  void seek(Duration position) async {
    await _audioplayer.seek(position);
  }

//************play next song**********
  void playNextSong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playList.length) {
        seek(Duration.zero);
        // go to the next song if  it's not the last song
        currentSongIndex = _currentSongIndex! + 1;
      } else {
        // if it's the last song then go back to the first song
        currentSongIndex = 0;
      }
    }
  }

//**************play previous***********
  void playPreviousSong() {
    // if more tha 2 seconds have pause, restart the current song
    if (_currentDuration.inSeconds > 2) {
    }
// if it's within 2 second of te song , go the previous song
    else {
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      } else {
        // if it's the first song, loop back to last song
        currentSongIndex = _playList.length - 1;
      }
    }
  }

//**************list and duration**********
  void listenToDuration() {
    // listen for total duration
    _audioplayer.onDurationChanged.listen((newDuration) {
      _currentDuration = newDuration;
      notifyListeners();
    });

//************listen for current Duration*********
    _audioplayer.onPositionChanged.listen((newopoistion) {
      _currentDuration = newopoistion;
      notifyListeners();
    });

//**********listen for song completion*********
    _audioplayer.onPlayerComplete.listen((even) {
      playNextSong();
    });
  }
//*********dispose player*********

  int? _currentSongIndex;

//*******getter**********
  List<Song> get playList => _playList;
// ignore: non_constant_identifier_names
  int? get currentSongIndex => _currentSongIndex;
bool get isPlaying => _isPlaying;
 Duration get currentDuration => _currentDuration;
Duration get totalDuration => _totalDuration;

  
// setter
// ignore: non_constant_identifier_names
  set currentSongIndex(int? newindex) {
    _currentSongIndex = newindex;


    if(newindex != null){ 
      Play();
    }
    notifyListeners();
  }
}
