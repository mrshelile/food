import 'package:foods/src/features/core/controllers/restaurant_register_controller.dart';
import 'package:foods/src/features/core/models/restraurant_info_model.dart';
import 'package:get/get.dart';

class AdminController extends GetxController {
  static AdminController get instance => Get.find();

  final _resRepo = Get.put(RestaurantController());

  Future<List<RestaurantModel>> getAllRes() async {
    //print(_resRepo.name);
    return await _resRepo.allRes();
  }
}
