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
        toolbarHeight: 0, // biar header manual aja
      ),
      body: Column(
        children: [
          // 🔹 Header (avatar + filter chip)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                SizedBox(width: 12),
                ChoiceChip(
                  label: Text("All", style: TextStyle(color: Colors.black)),
                  selected: true,
                  selectedColor: Colors.green,
                  backgroundColor: Colors.grey[800],
                  onSelected: (_) {},
                ),
                SizedBox(width: 8),
                ChoiceChip(
                  label: Text("Music", style: TextStyle(color: Colors.white)),
                  selected: false,
                  backgroundColor: Colors.grey[800],
                  onSelected: (_) {},
                ),
                SizedBox(width: 8),
                ChoiceChip(
                  label: Text("Podcasts", style: TextStyle(color: Colors.white)),
                  selected: false,
                  backgroundColor: Colors.grey[800],
                  onSelected: (_) {},
                ),
              ],
            ),
          ),

          // 🔹 Konten scrollable
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Grid Playlist
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
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[850],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(12),
                          alignment: Alignment.centerLeft,
                          child: Text("Lill B", style: TextStyle(color: Colors.white)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[850],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(12),
                          alignment: Alignment.centerLeft,
                          child: Text("GD", style: TextStyle(color: Colors.white)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[850],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(12),
                          alignment: Alignment.centerLeft,
                          child: Text("POP", style: TextStyle(color: Colors.white)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[850],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(12),
                          alignment: Alignment.centerLeft,
                          child: Text("FAMILLAGHER'S", style: TextStyle(color: Colors.white)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[850],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(12),
                          alignment: Alignment.centerLeft,
                          child: Text("LKL", style: TextStyle(color: Colors.white)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[850],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(12),
                          alignment: Alignment.centerLeft,
                          child: Text("Blonde", style: TextStyle(color: Colors.white)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[850],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(12),
                          alignment: Alignment.centerLeft,
                          child: Text("ngantuk, mau bobok", style: TextStyle(color: Colors.white)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[850],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(12),
                          alignment: Alignment.centerLeft,
                          child: Text("channel ORANGE", style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),

                  // New Release Card
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
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
                                child: const Icon(Icons.music_note, color: Colors.white, size: 40),
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
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "New Release Song",
                                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
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
                  ),

                  // Recent Rotation
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
                      ListTile(
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
                        title: Text("GBP (feat. 21 Savage)", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
                        subtitle: Text("Central Cee, 21 Savage", style: TextStyle(color: Colors.grey[400], fontSize: 12)),
                        trailing: Icon(Icons.more_vert, color: Colors.grey[400]),
                      ),
                      ListTile(
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
                        title: Text("Seberapa Pantas", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
                        subtitle: Text("Sheila On 7", style: TextStyle(color: Colors.grey[400], fontSize: 12)),
                        trailing: Icon(Icons.more_vert, color: Colors.grey[400]),
                      ),
                      ListTile(
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
                        title: Text("That's What I Like", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
                        subtitle: Text("Bruno Mars", style: TextStyle(color: Colors.grey[400], fontSize: 12)),
                        trailing: Icon(Icons.more_vert, color: Colors.grey[400]),
                      ),
                      ListTile(
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
                        title: Text("Levitating", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
                        subtitle: Text("Dua Lipa", style: TextStyle(color: Colors.grey[400], fontSize: 12)),
                        trailing: Icon(Icons.more_vert, color: Colors.grey[400]),
                      ),
                      ListTile(
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
                        title: Text("Until I Found You", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
                        subtitle: Text("Stephen Sanchez", style: TextStyle(color: Colors.grey[400], fontSize: 12)),
                        trailing: Icon(Icons.more_vert, color: Colors.grey[400]),
                      ),
                    ],
                  ),

                  SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),

      // 🔹 Bottom Nav
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.library_music), label: "Your Library"),
          BottomNavigationBarItem(icon: Icon(Icons.workspace_premium), label: "Premium"),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: "Create"),
        ],
      ),
    );
  }
}
