// role_controller.dart
import 'package:flutter_playground_booking_app/presentation/choose_role.dart/models/role_model.dart';
import 'package:get/get.dart';

class RoleController extends GetxController {
  final RoleModel roleModel = RoleModel();

  void selectRole(String role) {
    roleModel.setRole(role);
    // Handle navigation or other logic based on the selected role.
    // For example, navigate to the respective sign-up screen.
    // Get.to(SignUpScreen(role: role));
  }

  String get selectedRole => roleModel.selectedRole;
}
