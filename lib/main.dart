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
  final List<String> filters = ["All", "Music", "Podcasts"];
  final List<String> playlists = [
    "Lill B",
    "GD",
    "POP",
    "FAMILLAGHER'S",
    "LKL",
    "Blonde",
    "ngantuk, mau bobok",
    "channel ORANGE"
  ];

  final List<Map<String, String>> recents = [
    {"title": "GBP (feat. 21 Savage)", "artist": "Central Cee, 21 Savage"},
    {"title": "Seberapa Pantas", "artist": "Sheila On 7"},
    {"title": "That's What I Like", "artist": "Bruno Mars"},
    {"title": "Levitating", "artist": "Dua Lipa"},
    {"title": "Until I Found You", "artist": "Stephen Sanchez"},
  ];

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
                children: filters.map((filter) {
                  bool isActive = filter == "All";
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      label: Text(
                        filter,
                        style: TextStyle(
                          color: isActive ? Colors.black : Colors.white,
                        ),
                      ),
                      selected: isActive,
                      selectedColor: Colors.green,
                      backgroundColor: Colors.grey[800],
                      onSelected: (_) {},
                    ),
                  );
                }).toList(),
              ),
            ),

            // 🔹 Grid Playlist
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: playlists.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 3,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(12),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      playlists[index],
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ),

            // 🔹 New Release Card (gede)
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

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: recents.length,
              itemBuilder: (context, index) {
                final song = recents[index];
                return ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
                    song["title"]!,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    song["artist"]!,
                    style: TextStyle(color: Colors.grey[400], fontSize: 12),
                  ),
                  trailing: Icon(Icons.more_vert, color: Colors.grey[400]),
                );
              },
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

  // 🔹 Widget New Release gede
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
                // 🔹 Tombol Play di atas album cover
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
