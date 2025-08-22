import 'dart:ui';
import 'package:film_negar/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/images_path.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              /// poster
              SliverToBoxAdapter(
                child: _MainPoster(imagePath: ImagesPath.filmTest),
              ),

              /// title
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    children: [
                      Text(
                        "The Dark Knight 2012",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "شوالیه تاریکی 2012",
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),

              // add to fav
              SliverToBoxAdapter(child: Center(child: FavoriteButton())),

              SliverToBoxAdapter(child: SizedBox(height: 12)),

              // film info
              SliverToBoxAdapter(
                child: _MovieInfo(
                  imdb: 9.0,
                  directors: ["Christopher Nolan"],
                  writers: ["Jonathan Nolan", "David S. Goyer"],
                ),
              ),

              // actors
              SliverToBoxAdapter(
                child: _ActorsSection(
                  actors: const [
                    {
                      "name": "Christian Bale",
                      "image": "assets/actors/bale.jpg",
                    },
                    {
                      "name": "Heath Ledger",
                      "image": "assets/actors/ledger.jpg",
                    },
                    {
                      "name": "Aaron Eckhart",
                      "image": "assets/actors/eckhart.jpg",
                    },
                    {
                      "name": "Michael Caine",
                      "image": "assets/actors/caine.jpg",
                    },
                  ],
                ),
              ),

              //summery
              SliverToBoxAdapter(
                child: _SectionCard(
                  title: "خلاصه داستان",
                  child: ExpandableText(
                    text:
                        "بتمن با کمک کلانتر گوردون و دادستان هاروی دنت تلاش می‌کند تا شهر گاتهام را از جنایت پاک کند. "
                        "اما ظهور یک جنایتکار مرموز و دیوانه به نام جوکر همه چیز را تغییر می‌دهد و بتمن را وارد سخت‌ترین مبارزه زندگی‌اش می‌کند...",
                  ),
                ),
              ),

              // user rating
              SliverToBoxAdapter(
                child: _SectionCard(
                  title: "به این فیلم امتیاز بده",
                  child: UserRatingWidget(),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 40)),
            ],
          ),
          Positioned(
            top: 40,
            right: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: InkWell(
                onTap: ()=> Get.back(),
                  borderRadius: BorderRadius.circular(50),
                  child: Container(width: 50, height: 50, color: Color(
                      0x1A000715), child: Icon(Icons.arrow_back, color: Colors.white,),)),
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

/// movie info
class _MovieInfo extends StatelessWidget {
  final double imdb;
  final List<String> directors;
  final List<String> writers;

  const _MovieInfo({
    required this.imdb,
    required this.directors,
    required this.writers,
  });

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: "اطلاعات فیلم",
      child: Column(
        children: [
          _infoRow(Icons.star, "امتیاز IMDB", "$imdb / 10", Colors.amber),
          const SizedBox(height: 10),
          _infoRow(
            Icons.star,
            "امتیاز کاربران فیلم نگار",
            "$imdb / 10",
            Colors.amber,
          ),
          const SizedBox(height: 10),
          _infoRow(
            Icons.movie_creation_outlined,
            directors.length > 1 ? "کارگردانان" : "کارگردان",
            directors.join(" • "),
            Colors.cyanAccent,
          ),
          const SizedBox(height: 10),
          _infoRow(
            Icons.edit,
            writers.length > 1 ? "نویسندگان" : "نویسنده",
            writers.join(" • "),
            Colors.pinkAccent,
          ),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: color, size: 22),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$label: ",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: value,
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// actors
class _ActorsSection extends StatelessWidget {
  final List<Map<String, String>> actors;

  const _ActorsSection({required this.actors});

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: "بازیگران اصلی",
      child: SizedBox(
        height: 120,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: actors.length,
          itemBuilder: (context, index) {
            final actor = actors[index];
            return Container(
              margin: const EdgeInsets.only(right: 12),
              child: Column(
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                          image: AssetImage(actor["image"]!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    actor["name"]!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

/// section card
class _SectionCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _SectionCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Color(0xFF0A1630),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

/// expanded summery
class ExpandableText extends StatefulWidget {
  final String text;

  const ExpandableText({super.key, required this.text});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedCrossFade(
          firstChild: Text(
            widget.text,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white70),
          ),
          secondChild: Text(
            widget.text,
            style: const TextStyle(color: Colors.white70),
          ),
          crossFadeState: expanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 300),
        ),
        GestureDetector(
          onTap: () => setState(() => expanded = !expanded),
          child: Text(
            expanded ? "کمتر" : "بیشتر بخوان",
            style: TextStyle(
              color: AppColors.secondaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

/// user rating
class UserRatingWidget extends StatefulWidget {
  const UserRatingWidget({super.key});

  @override
  State<UserRatingWidget> createState() => _UserRatingWidgetState();
}

class _UserRatingWidgetState extends State<UserRatingWidget> {
  double _rating = 7;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: _rating,
          min: 0,
          max: 10,
          divisions: 10,
          activeColor: AppColors.secondaryColor,
          label: _rating.toStringAsFixed(1),
          onChanged: (value) => setState(() => _rating = value),
        ),
        Text(
          "امتیاز شما: ${_rating.toStringAsFixed(1)} / 10",
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
      ],
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton>
    with SingleTickerProviderStateMixin {
  bool isFavorite = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    } else {
      _controller.forward().then((_) => _controller.reverse());
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: GestureDetector(
        onTap: _toggleFavorite,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: isFavorite ? AppColors.secondaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppColors.secondaryColor, width: 2),
            boxShadow: isFavorite
                ? [
                    BoxShadow(
                      color: AppColors.secondaryColor.withOpacity(0.6),
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.white : AppColors.secondaryColor,
              ),
              const SizedBox(width: 8),
              Text(
                isFavorite ? "در علاقه‌مندی‌ها" : "افزودن به علاقه‌مندی‌ها",
                style: TextStyle(
                  color: isFavorite ? Colors.white : AppColors.secondaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
