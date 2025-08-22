import 'dart:ui';

import 'package:film_negar/core/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/images_path.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _MainPoster(imagePath: ImagesPath.filmTest,)),

          const SliverToBoxAdapter(
            child: Column(
              children: [
                Text('The Dark Knight 2012', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),
                SizedBox(height: 8,),
                Text('شوالیه تاریکی 2012', style: TextStyle( fontSize: 16, color: Colors.white))
              ],
            ),
          ),

        ],
      ),
    );
  }
}

class _MainPoster extends StatelessWidget {
  final String imagePath;

  const _MainPoster({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 20, sigmaY: 3),
            child: Image.asset(
              imagePath,
              height: MediaQuery.sizeOf(context).height / 1.7,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, AppColors.backgroundColor],
                ),
              ),
            ),
          ),
          Positioned(
            top: 90,
            right: 90,
            left: 90,
            bottom: 90,

            child: SizedBox(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  ImagesPath.filmTest,
                  height: MediaQuery.sizeOf(context).height / 1.7,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
