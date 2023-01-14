import 'package:flutter/material.dart';
import 'package:ved_foodish/cards/components/circle_image.dart';
import 'package:ved_foodish/fooderlich_theme.dart';

class AuthorCard extends StatelessWidget {
  const AuthorCard({
    Key? key,
    required this.authorName,
    required this.title,
    this.imageProvider,
  }) : super(key: key);

  final String authorName;
  final String title;
  final ImageProvider? imageProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // AuthorCard(
          //   authorName: "Maui VED",
          //   title: "Software Engineer",
          //   imageProvider: AssetImage("assets/author_katz.jpeg"),
          // ),

          CircleImage(
            imageProvider: imageProvider,
            imageRadius: 28,
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                authorName,
                style: FooderlichTheme.lightTextTheme.headline2,
              ),
              Text(
                title,
                style: FooderlichTheme.lightTextTheme.headline3,
              ),
            ],
          ),

          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
