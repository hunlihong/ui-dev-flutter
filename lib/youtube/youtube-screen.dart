import 'package:flutter/material.dart';
import 'package:mad_1/widgets/sidebar.dart';

class YouTubeScreen extends StatelessWidget {
  final List<String> categories = ["All", "Mixes", "Music", "Playlists", "Cars", "Sports"];
  final List<Map<String, String>> videos = List.generate(10, (index) => {
    "thumbnail": "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/e6e19e182737087.6532a67541256.jpg",
    "title": "Video Title $index",
    "channel": "Channel Name $index",
    "views": "${(index + 1) * 10}K Views",
    "time": "${index + 1} days ago",
    "duration": "${(index + 1) * 5}:00"
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text(
          "YouTube",
          style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {}),
        ],
      ),
      drawer: Sidebar(activeIndex: 0),
      body: Column(
        children: [
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                double left = index == 0 ? 20 : 10;
                double right = index == categories.length - 1 ? 20 : 0;
                return Padding(
                  padding: EdgeInsets.only(left: left, right: right),
                  child: Chip(
                    label: Text(
                      categories[index],
                      style: const TextStyle(color: Colors.black),
                    ),
                    backgroundColor: Colors.white60
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: videos.length,
              itemBuilder: (context, index) {
                final video = videos[index];
                return Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Image.network(video["thumbnail"]!, fit: BoxFit.cover),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            color: Colors.black87,
                            child: Text(
                              video["duration"]!,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Icon(Icons.verified_user, size: 18.0,),
                      ),
                      title: Text(video["title"]!,
                          style: const TextStyle(color: Colors.black)),
                      subtitle: Text(
                        "${video["channel"]} • ${video["views"]} • ${video["time"]}",
                        style: TextStyle(color: Colors.black45, fontSize: 12),
                      ),
                      trailing:
                      const Icon(Icons.more_vert, color: Colors.white),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Shorts"),
          BottomNavigationBarItem(icon: Icon(Icons.subscriptions), label: "Subscriptions"),
          BottomNavigationBarItem(icon: Icon(Icons.video_library), label: "You"),
        ],
      ),
    );
  }
}