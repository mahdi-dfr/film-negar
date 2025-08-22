import 'package:get/get.dart';

import '../../feature/search/presentation/controller/search_controller.dart';

class AppBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(SearchPageController());
  }

}