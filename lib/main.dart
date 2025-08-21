import 'package:flutter/material.dart';

void main() {
  runApp(SpotifyClone());
}

class SpotifyClone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SpotifyHome(),
    );
  }
}

class SpotifyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Filter Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  ChoiceChip(
                    label: Text("All",
                        style: TextStyle(color: Colors.black)),
                    selected: true,
                    selectedColor: Colors.green,
                    backgroundColor: Colors.grey[800],
                    onSelected: (_) {},
                  ),
                  SizedBox(width: 8),
                  ChoiceChip(
                    label: Text("Music",
                        style: TextStyle(color: Colors.white)),
                    selected: false,
                    backgroundColor: Colors.grey[800],
                    onSelected: (_) {},
                  ),
                  SizedBox(width: 8),
                  ChoiceChip(
                    label: Text("Podcasts",
                        style: TextStyle(color: Colors.white)),
                    selected: false,
                    backgroundColor: Colors.grey[800],
                    onSelected: (_) {},
                  ),
                ],
              ),
            ),

            // 🔹 Grid Playlist
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 3,
                children: [
                  playlistCard("Lill B"),
                  playlistCard("GD"),
                  playlistCard("POP"),
                  playlistCard("FAMILLAGHER'S"),
                  playlistCard("LKL"),
                  playlistCard("Blonde"),
                  playlistCard("ngantuk, mau bobok"),
                  playlistCard("channel ORANGE"),
                ],
              ),
            ),

            // 🔹 New Release Card
            buildNewReleaseCard(),

            // 🔹 Recent Rotation
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Your recent rotation",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Column(
              children: [
                recentSong("GBP (feat. 21 Savage)", "Central Cee, 21 Savage"),
                recentSong("Seberapa Pantas", "Sheila On 7"),
                recentSong("That's What I Like", "Bruno Mars"),
                recentSong("Levitating", "Dua Lipa"),
                recentSong("Until I Found You", "Stephen Sanchez"),
              ],
            ),

            SizedBox(height: 80),
          ],
        ),
      ),

      // 🔹 Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_music), label: "Your Library"),
          BottomNavigationBarItem(
              icon: Icon(Icons.workspace_premium), label: "Premium"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined), label: "Create"),
        ],
      ),
    );
  }

  // 🔹 Playlist Card
  Widget playlistCard(String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(12),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  // 🔹 Recent Song Tile
  Widget recentSong(String title, String artist) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(Icons.play_arrow, color: Colors.white),
      ),
      title: Text(
        title,
        style: TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        artist,
        style: TextStyle(color: Colors.grey[400], fontSize: 12),
      ),
      trailing: Icon(Icons.more_vert, color: Colors.grey[400]),
    );
  }

  // 🔹 Widget New Release
  Widget buildNewReleaseCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Album cover + Play button
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.music_note,
                      color: Colors.white, size: 40),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.play_arrow, color: Colors.white),
                    onPressed: () {
                      print("Play New Release");
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),

            // Info lagu/artis
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "New Release Song",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Artist Name",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
