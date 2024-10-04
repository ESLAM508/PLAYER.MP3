import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/my_drawer.dart';
import 'package:flutter_application_1/models/playlist_provider.dart';
import 'package:flutter_application_1/models/song_page.dart';
import 'package:provider/provider.dart';
import 'models/song.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // get the Playlist Provider
  // ignore: non_constant_identifier_names
  late final dynamic playlistProvider;

  @override
  void initState() {
    super.initState();

    // get Playlist provider
    playlistProvider = Provider.of<PlayListProvider>(context, listen: false);
  }

  // go to song
  void goToSong(int songIndex) {
    // update current song
    playlistProvider.currentSongIndex = songIndex;

    // navigate to song page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SongPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: deprecated_member_use
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(title: const Text('P L A Y E R')),
      drawer: const MyDrawer(),
      body: Consumer<PlayListProvider>(
        builder: (context, value, child) {
          // get  the playList
          final List<Song> playList = value.playList;
          // return List view UI
          return ListView.builder(
              itemCount: playList.length,
              itemBuilder: (
                context,
                index,
              ) {
                final Song song = playList[index];

                // return List tile UI
                return ListTile(
                  title: Text(song.songName),
                  subtitle: Text(song.artistName),
                  leading: Image.asset(song.artImagePath),
                  onTap: () => goToSong(index),
                );
              });
        },
      ),
    );
  }
}
