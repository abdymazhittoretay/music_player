import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player/models/song_model.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<SongModel> _playlist = [
    SongModel(
        songName: "1 Song",
        artistName: "1 Artist",
        imagePath: "assets/images/future.png",
        audioPath: "audios/song.mp3"),
    SongModel(
        songName: "2 Song",
        artistName: "2 Artist",
        imagePath: "assets/images/future.png",
        audioPath: "audios/song.mp3"),
    SongModel(
        songName: "3 Song",
        artistName: "3 Artist",
        imagePath: "assets/images/future.png",
        audioPath: "audios/song.mp3"),
  ];
  int? _selectedSong;

  final AudioPlayer _audioPlayer = AudioPlayer();

  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  bool _isPlaying = false;

  void play() async {
    final String pathToSong = _playlist[_selectedSong!].audioPath;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(pathToSong));
    _isPlaying = !_isPlaying;
    notifyListeners();
  }

  void pauseOrResume() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
      _isPlaying = !_isPlaying;
    } else {
      await _audioPlayer.resume();
      _isPlaying = !_isPlaying;
    }
    notifyListeners();
  }

  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  void nextSong() async {
    if (_selectedSong != null) {
      if (_selectedSong! + 1 == _playlist.length) {
        _selectedSong = 0;
      } else {
        _selectedSong = _selectedSong! + 1;
      }
    }
  }

  void previousSong() async {
    if (_selectedSong != null) {
      if (_currentDuration.inSeconds < 2) {
        _currentDuration = Duration.zero;
      }

      if (_selectedSong! - 1 == -1) {
        _selectedSong = _playlist.length - 1;
      } else {
        _selectedSong = _selectedSong! - 1;
      }
    }
  }

  PlaylistProvider() {
    listenDuration();
  }

  void listenDuration() {
    _audioPlayer.onDurationChanged.listen((duration) {
      _totalDuration = duration;
      notifyListeners();
    });

    _audioPlayer.onPositionChanged.listen((position) {
      _currentDuration = position;
      notifyListeners();
    });
  }

  List<SongModel> get playlist => _playlist;
  int? get selectedSong => _selectedSong;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;
  bool get isPlaying => _isPlaying;

  set changeSongIndex(int? newSongIndex) {
    _selectedSong = newSongIndex;

    if (_selectedSong != null) {
      play();
    }

    notifyListeners();
  }
}
