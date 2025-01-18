import 'package:flutter/material.dart';
import 'package:music_player/models/song_model.dart';
import 'package:music_player/pages/song_page.dart';
import 'package:music_player/providers/playlist_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PlaylistProvider playlistProvider;

  @override
  void initState() {
    super.initState();

    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        foregroundColor: Colors.black,
        surfaceTintColor: Colors.grey[300],
        title: Text("P L A Y L I S T"),
        centerTitle: true,
      ),
      body: Consumer<PlaylistProvider>(
        builder: (context, value, child) {
          final List<SongModel> playlist = value.playlist;
          return ListView.builder(
              itemCount: playlist.length,
              itemBuilder: (context, index) {
                final SongModel song = playlist[index];
                return ListTile(
                  title: Text(song.songName),
                  subtitle: Text(song.artistName),
                  leading: Image.asset(
                    song.imagePath,
                    width: 50,
                    height: 50,
                  ),
                  onTap: () => goToSong(index),
                );
              });
        },
      ),
    );
  }

  // Functions
  void goToSong(int? index) {
    playlistProvider.changeSongIndex = index;

    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return SongPage();
      },
    ));
  }
}
