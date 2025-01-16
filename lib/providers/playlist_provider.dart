import 'package:flutter/material.dart';
import 'package:music_player/models/song_model.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<SongModel> _playlist = [
    SongModel(
        songName: "1 Song",
        artistName: "1 Artist",
        imagePath: "assets/images/future.png",
        audioPath: "assets/images/song.mp3"),
    SongModel(
        songName: "2 Song",
        artistName: "2 Artist",
        imagePath: "assets/images/future.png",
        audioPath: "assets/images/song.mp3"),
    SongModel(
        songName: "3 Song",
        artistName: "3 Artist",
        imagePath: "assets/images/future.png",
        audioPath: "assets/images/song.mp3"),
  ];
  int? _selectedSong;

  List<SongModel> get playlist => _playlist;
  int? get selectedSong => _selectedSong;

  set changeSongIndex(int? newSongIndex) {
    _selectedSong = newSongIndex;

    notifyListeners();
  }
}
