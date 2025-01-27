// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:school_post/theme/app_colors.dart';

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
    {
      "pseudo": "Majaliwa",
      "photo": "assets/images/post/3.jpg",
      "photProfil": "assets/images/photo/7.jpg",
      "description": "New travel",
    },
    {
      "pseudo": "andrew",
      "photo": "assets/images/post/3.jpg",
      "photProfil": "assets/images/photo/4.jpg",
      "description": "New travel lorem djejkfbejkfbkejqbfkbfejbjkbfejbj",
    },
    {
      "pseudo": "andrew",
      "photo": "assets/images/post/10.jfif",
      "photProfil": "assets/images/photo/3.jpg",
      "description": "New travel",
    },
    {
      "pseudo": "andrew",
      "photo": "assets/images/post/11.jpg",
      "photProfil": "assets/images/photo/1.jpg",
      "description": "New travel",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: post_items.map((post) {
        return Column(
          children: [
            Container(
                height: 50,
                // color: Colors.grey,
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
                    const SizedBox(width: 5),
                    Image.asset('assets/images/profil/instagram-logo.png',
                        height: 13),
                    Expanded(child: Container()),
                    IconButton(
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => IconButtonWithPopup()));
                        }, icon: const Icon(Icons.more_horiz)),
                  ],
                )),
            Container(
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(post["photo"]),
                    fit: BoxFit.cover,
                  ),
                )

                // color: Colors.red,
                // margin: EdgeInsets.only(top: 10),
                // child: Image.asset(
                //   post["photo"],),
                ),
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  IconButton(
                    color: blueColor,
                      onPressed: () {}, icon: Icon(Icons.favorite_outline)),
                  IconButton(
                    color: blueColor,
                      onPressed: () {}, icon: Icon(Icons.message_outlined)),
                  IconButton(
                    color: blueColor,
                    onPressed: () {}, icon: Icon(Icons.send_outlined)),
                  Expanded(child: Container()),
                  IconButton(
                    color: blueColor,
                      onPressed: () {}, icon: Icon(Icons.bookmark_outline)),
                ],
              ),
            ),
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
                        ]),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
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
                  Text(
                    'Voir tous les 123 commentaires',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: greyColor,
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
