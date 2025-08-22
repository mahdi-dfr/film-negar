import 'package:film_negar/core/colors.dart';
import 'package:film_negar/core/images_path.dart';
import 'package:film_negar/core/widgets/movie_card.dart';
import 'package:film_negar/feature/home/presentation/screens/movie_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _HeaderImage(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 25),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return CategorySection(
                  title: 'اکشن',
                  movies: List.generate(
                    8,
                        (i) => MovieCard(
                      title: 'بتمن 2012',
                      writer: 'کریستوفر نولان',
                      image: ImagesPath.filmTest,
                      onItemClicked: () {
                        Get.to(MovieScreen());
                      },
                    ),
                  ),
                );
              },
              childCount: 3,
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Stack(
        children: [
          Image.asset(
            ImagesPath.filmTest,
            height: MediaQuery.sizeOf(context).height / 1.7,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppColors.backgroundColor,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategorySection extends StatelessWidget {
  final String title;
  final List<Widget> movies;

  const CategorySection({
    super.key,
    required this.title,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 300,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => movies[index],
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemCount: movies.length,
            ),
          ),
        ],
      ),
    );
  }
}
