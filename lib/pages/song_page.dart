import 'package:flutter/material.dart';
import 'package:music_player/models/song_model.dart';
import 'package:music_player/providers/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatefulWidget {
  const SongPage({super.key});

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {
        final List<SongModel> playlist = value.playlist;

        final int? selectedSong = value.selectedSong;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.grey[300],
            foregroundColor: Colors.black,
            surfaceTintColor: Colors.grey[300],
            title: Text("P L A Y L I S T"),
            centerTitle: true,
          ),
        );
      },
    );
  }
}
