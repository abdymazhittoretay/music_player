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

        final SongModel selectedSong = playlist[value.selectedSong ?? 0];
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.grey[300],
            foregroundColor: Colors.black,
            surfaceTintColor: Colors.grey[300],
            title: Text("P L A Y L I S T"),
            centerTitle: true,
          ),
          body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 45.0),
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            selectedSong.imagePath,
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    selectedSong.songName,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    selectedSong.artistName,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            ],
                          ),
                        )
                      ],
                    )),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("0:00"),
                      Icon(Icons.shuffle),
                      Icon(Icons.repeat),
                      Text("0:00"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Slider(
                    min: 0,
                    max: 100,
                    value: 30,
                    activeColor: Colors.black,
                    onChanged: (value) {}),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.skip_previous)),
                    ),
                    Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                              )),
                        )),
                    Expanded(
                        child: IconButton(
                            onPressed: () {}, icon: Icon(Icons.skip_next))),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
