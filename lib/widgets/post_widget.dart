import 'package:flutter/material.dart';
import 'package:school_post/theme/app_colors.dart';
import 'package:school_post/widgets/post_detail.dart';
import 'package:school_post/widgets/comment_sheet.dart'; // Ajoute cette ligne

class PostWidget extends StatelessWidget {
  PostWidget({super.key});

  final List post_items = [
    {
      "pseudo": "andrew",
      "photo": "assets/images/post/1.png",
      "photProfil": "assets/images/photo/4.jpg",
      "description": "New travel",
    },
    {
      "pseudo": "Jacob",
      "photo": "assets/images/post/2.jpg",
      "photProfil": "assets/images/photo/2.jpg",
      "description": "New travel",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: post_items.map((post) {
        return Column(
          children: [
            // HEADER DU POST
            Container(
              height: 50,
              margin: const EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(post['photProfil']),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    post['pseudo'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: Container()),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz),
                  ),
                ],
              ),
            ),

            // IMAGE DU POST
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostDetail(post: post, title: post['pseudo']),
                  ),
                );
              },
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(post["photo"]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // ICONES D'ACTION (Like, Commentaire, Partage, Sauvegarde)
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  IconButton(
                    color: blueColor,
                    onPressed: () {},
                    icon: Icon(Icons.favorite_outline),
                  ),
                  IconButton(
                    color: blueColor,
                    onPressed: () {
                      // OUVRIR LE COMMENT SHEET ICI
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) => CommentSheet(),
                      );
                    },
                    icon: Icon(Icons.message_outlined),
                  ),
                  IconButton(
                    color: blueColor,
                    onPressed: () {},
                    icon: Icon(Icons.send_outlined),
                  ),
                  Expanded(child: Container()),
                  IconButton(
                    color: blueColor,
                    onPressed: () {},
                    icon: Icon(Icons.bookmark_outline),
                  ),
                ],
              ),
            ),

            // SECTION LIKES ET COMMENTAIRES
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundImage: AssetImage(post['photProfil']),
                  ),
                  const SizedBox(width: 10),
                  RichText(
                    text: TextSpan(
                      text: 'Aimé par ',
                      style: DefaultTextStyle.of(context).style,
                      children: [
                        TextSpan(
                          text: post['pseudo'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: ' et '),
                        TextSpan(
                          text: '123 autres personnes',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // DESCRIPTION DU POST
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        post['pseudo'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          post['description'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'See more',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: greyColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) => CommentSheet(),
                      );
                    },
                    child: Text(
                      'Voir tous les 123 commentaires',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: greyColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Translate',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
