import 'package:FinaFlow/controllers/user.dart';
import 'package:get/instance_manager.dart';

//faz a inserção do controller como dependencia da api.
class UserBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController());
  }
}
