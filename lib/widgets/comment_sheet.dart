import 'package:flutter/material.dart';

class CommentSheet extends StatefulWidget {
  @override
  _CommentSheetState createState() => _CommentSheetState();
}

class _CommentSheetState extends State<CommentSheet> {
  final List<Map<String, dynamic>> comments = [
    {
      "id": 1,
      "user": "Andrew",
      "avatar": "assets/images/photo/4.jpg",
      "comment": "C'est une belle photo ! 😍",
      "likes": 5,
      "loved": 2,
      "replies": [
        {
          "user": "Jacob",
          "avatar": "assets/images/photo/2.jpg",
          "comment": "Je suis d'accord ! 🔥",
        },
      ]
    },
    {
      "id": 2,
      "user": "Majaliwa",
      "avatar": "assets/images/photo/7.jpg",
      "comment": "Super endroit !",
      "likes": 2,
      "loved": 1,
      "replies": [],
    },
  ];

  void _likeComment(int index) {
    setState(() {
      comments[index]["likes"] += 1;
    });
  }

  void _loveComment(int index) {
    setState(() {
      comments[index]["loved"] += 1;
    });
  }

  void _replyToComment(int index, String replyText) {
    if (replyText.isNotEmpty) {
      setState(() {
        comments[index]["replies"].add({
          "user": "Vous",
          "avatar": "assets/images/photo/default.jpg",
          "comment": replyText,
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Commentaires",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                var comment = comments[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(comment["avatar"]),
                      ),
                      title: Text(
                        comment["user"],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(comment["comment"]),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.thumb_up_alt_outlined, color: Colors.blue),
                          onPressed: () => _likeComment(index),
                        ),
                        Text("${comment["likes"]}"),
                        SizedBox(width: 10),
                        IconButton(
                          icon: Icon(Icons.favorite_border, color: Colors.red),
                          onPressed: () => _loveComment(index),
                        ),
                        Text("${comment["loved"]}"),
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            _showReplyDialog(context, index);
                          },
                          child: Text("Répondre", style: TextStyle(color: Colors.blue)),
                        ),
                      ],
                    ),
                    if (comment["replies"].isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Column(
                          children: comment["replies"].map<Widget>((reply) {
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage(reply["avatar"]),
                                radius: 15,
                              ),
                              title: Text(reply["user"], style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                              subtitle: Text(reply["comment"]),
                            );
                          }).toList(),
                        ),
                      ),
                    Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showReplyDialog(BuildContext context, int index) {
    TextEditingController replyController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Répondre au commentaire"),
          content: TextField(
            controller: replyController,
            decoration: InputDecoration(hintText: "Votre réponse..."),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _replyToComment(index, replyController.text);
                Navigator.pop(context);
              },
              child: Text("Envoyer"),
            ),
          ],
        );
      },
    );
  }
}
