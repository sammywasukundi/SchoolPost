import 'dart:math';
import 'package:flutter/material.dart';
import 'package:comment_sheet/comment_sheet.dart';
import 'package:school_post/theme/app_colors.dart';

class PostDetail extends StatefulWidget {
  const PostDetail({super.key, required this.title, required this.post});

  final String title;
  final Map post;

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  final CommentSheetController commentSheetController = CommentSheetController();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          /// 📌 Affichage de l'image du post
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.post["photo"]),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// 📌 Icônes d'interaction
          SizedBox(
            height: 50,
            child: Row(
              children: [
                IconButton(
                  color: blueColor,
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_outline),
                ),
                IconButton(
                  color: blueColor,
                  onPressed: () => _openCommentSheet(context),
                  icon: const Icon(Icons.message_outlined),
                ),
                IconButton(
                  color: blueColor,
                  onPressed: () {},
                  icon: const Icon(Icons.send_outlined),
                ),
                Expanded(child: Container()),
                IconButton(
                  color: blueColor,
                  onPressed: () {},
                  icon: const Icon(Icons.bookmark_outline),
                ),
              ],
            ),
          ),

          /// 📌 Informations du post
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundImage: AssetImage(widget.post['photProfil']),
                ),
                const SizedBox(width: 10),
                RichText(
                  text: TextSpan(
                    text: 'Aimé par ',
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                        text: widget.post['pseudo'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(text: ' et '),
                      const TextSpan(
                        text: '123 autres personnes',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 📌 Fonction pour afficher la bottom sheet des commentaires
  void _openCommentSheet(BuildContext context) {
    showBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return CommentSheet(
          slivers: [buildSliverList()],
          grabbingPosition: WidgetPosition.above,
          initTopPosition: 200,
          calculateTopPosition: calculateTopPosition,
          scrollController: scrollController,
          grabbing: buildGrabbing(),
          topWidget: (info) {
            return Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: max(0, info.currentTop),
              child: const Placeholder(color: Colors.green),
            );
          },
          topPosition: WidgetPosition.below,
          bottomWidget: buildBottomWidget(),
          commentSheetController: commentSheetController,
          child: const Placeholder(),
          backgroundBuilder: (context) {
            return Container(
              color: const Color(0xFF0F0F0F),
              margin: const EdgeInsets.only(top: 20),
            );
          },
        );
      },
    );
  }

  /// 📌 Widget du bouton de fermeture
  Widget buildGrabbing() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF0F0F0F),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Commentaires",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close, size: 26, color: Colors.white),
              ),
            ],
          ),
          Container(
            color: const Color(0xFF292929),
            width: double.infinity,
            height: 1,
          ),
        ],
      ),
    );
  }

  /// 📌 Liste des commentaires affichés dans la bottom sheet
  Widget buildSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return const ListItemWidget();
        },
        childCount: 10,
      ),
    );
  }

  /// 📌 Widget en bas de la bottom sheet (peut être une barre de saisie)
  Widget buildBottomWidget() {
    return Container(
      color: Colors.transparent,
      height: 50,
      child: const Placeholder(color: Colors.blue),
    );
  }

  /// 📌 Calcul de la position de la sheet
  double calculateTopPosition(CommentSheetInfo info) {
    final vy = info.velocity.getVelocity().pixelsPerSecond.dy;
    final top = info.currentTop;
    double p0 = 0;
    double p1 = 200;
    double p2 = info.size.maxHeight - 100;

    if (top > p1) {
      return (vy > 0) ? p2 : p1;
    } else {
      return (vy > 0) ? p1 : p0;
    }
  }
}

/// 📌 Widget d'un commentaire dans la liste
class ListItemWidget extends StatelessWidget {
  const ListItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF0F0F0F),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(
                  "https://yt3.ggpht.com/yti/AJo0G0kUnHqoybmWPJG4GNm0G-lfCiCPbEP62v5tq9PZsA=s48-c-k-c0x00ffffff-no-rj",
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Utilisateur * il y a 2 heures',
                      style: TextStyle(fontSize: 10, color: Colors.white70),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Super publication, j\'adore !',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
