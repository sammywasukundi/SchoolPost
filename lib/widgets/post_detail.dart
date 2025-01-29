import 'package:flutter/material.dart';

class PostDetail extends StatelessWidget {
  final Map post;

  const PostDetail({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post['pseudo']),
      ),
      body: Column(
        children: [
          Image.asset(post['photo']),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(post['description']),
          ),
          Expanded(
            child: ListView(
              children: [
                // Placeholder for comments
                ListTile(
                  title: Text('User1'),
                  subtitle: Text('Nice post!'),
                ),
                ListTile(
                  title: Text('User2'),
                  subtitle: Text('Great travel!'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Add a comment...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Handle comment submission
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}