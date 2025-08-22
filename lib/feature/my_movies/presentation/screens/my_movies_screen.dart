import 'package:flutter/material.dart';

import '../../../../core/colors.dart';
import '../../../../core/widgets/movie_card.dart';


class SavedMoviesPage extends StatelessWidget {
  SavedMoviesPage({super.key});

  // دیتا تستی (لیست فیلم‌های ذخیره‌شده کاربر)
  final List<Map<String, String>> savedMovies = [
    {"title": "Inception", "writer": "Christopher Nolan"},
    {"title": "The Matrix", "writer": "Wachowski Sisters"},
    {"title": "Interstellar", "writer": "Christopher Nolan"},
    {"title": "Fight Club", "writer": "David Fincher"},
    {"title": "The Dark Knight", "writer": "Christopher Nolan"},
    {"title": "Parasite", "writer": "Bong Joon-ho"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            itemCount: savedMovies.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.4,
            ),
            itemBuilder: (context, index) {
              final movie = savedMovies[index];
              return MovieCard(
                title: movie["title"]!,
                writer: movie["writer"]!,
                image: null,
                onItemClicked: () {
                  debugPrint("Clicked on ${movie["title"]}");
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
