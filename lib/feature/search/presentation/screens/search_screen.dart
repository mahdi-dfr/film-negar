import 'package:film_negar/feature/search/presentation/controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key});


  static var secondaryColor = const Color(0xfff17807);
  static const backgroundColor = Color.fromARGB(255, 0, 2, 28);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final FocusNode _focusNode = FocusNode();

  final _controller = Get.find<SearchPageController>();

  @override
  void initState() {
    _focusNode.requestFocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    _focusNode.addListener(() {
      _controller.isFocused.value = _focusNode.hasFocus;
    });


    return Scaffold(
      backgroundColor: SearchPage.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Obx(
                    () => TextField(
                  focusNode: _focusNode,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "جستجو...",
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                    filled: true,
                    fillColor: SearchPage.backgroundColor,
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: Colors.white.withOpacity(0.3), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: SearchPage.secondaryColor, width: 2),
                    ),
                    suffixIcon: Icon(Icons.search,
                        color: _controller.isFocused.value
                            ? SearchPage.secondaryColor
                            : Colors.white.withOpacity(0.6)),
                  ),
                ),
              ),
            ),

            const Spacer(),

            const Text(
              "اسم فیلم مورد نظر خود را جستجو کنید",
              style: TextStyle(
                  color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}
