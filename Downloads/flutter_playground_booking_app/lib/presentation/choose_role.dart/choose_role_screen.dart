// role_selection_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/presentation/choose_role.dart/controller/role_controller.dart';
import 'package:flutter_playground_booking_app/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:get/get.dart';

class RoleSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RoleController roleController = Get.put(RoleController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Select Your Role'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                roleController.selectRole('Owner');
                // Optionally, navigate to another screen or update the UI
                Get.to(SignUpScreen());
              },
              child: Text('Sign Up as Owner'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                roleController.selectRole('User');
                Get.to(SignUpScreen());
                // Optionally, navigate to another screen or update the UI
              },
              child: Text('Sign Up as User'),
            ),
            SizedBox(height: 20),
            Obx(() {
              // Display the selected role
              return Text('Selected Role: ${roleController.selectedRole}');
            }),
          ],
        ),
      ),
    );
  }
}
