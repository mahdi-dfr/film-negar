import 'package:flutter/material.dart';

import '../images_path.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.title,
    required this.writer,
    required this.onItemClicked,
    this.showAuthor = true, required this.image,
  });

  final String title;
  final String? image;
  final bool showAuthor;
  final String writer;
  final Function() onItemClicked;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      onTap: onItemClicked,
      child: SizedBox(
        width: 130,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child:
              // image != null ? Image.network(
              //   UrlConstant.baseUrl+image!,
              //   height: 200,
              //   width: double.infinity,
              //   fit: BoxFit.cover,
              // ) :
              Image.asset(
                ImagesPath.filmTest,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            showAuthor
                ? Text(
              writer,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}