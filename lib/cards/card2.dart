import 'package:flutter/material.dart';
import 'package:ved_foodish/cards/components/author_card.dart';

class Card2 extends StatelessWidget {
  const Card2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/mag5.png"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Column(
          children: const [
            AuthorCard(
              authorName: "Maui VED",
              title: "Software Engineer",
              imageProvider: AssetImage("assets/author_katz.jpeg"),
            ),
            // Stack(
            //   children: [],
            // ),
          ],
        ),
      ),
    );
  }
}
