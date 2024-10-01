import 'package:flutter/material.dart';

import '../../../domain/entity/actor.dart';
import '../movie_image_item.dart';

class ActorCard extends StatelessWidget {
  final Actor actor;
  const ActorCard({super.key, required this.actor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 135,
      child: Card(
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: MovieImageItem(
                image: actor.photo!,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(vertical: 12,horizontal: 7.0),
              child: FittedBox(
                child: Text(
                  actor.name!,
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
