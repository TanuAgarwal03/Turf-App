// role_model.dart
class RoleModel {
  String selectedRole;

  RoleModel({this.selectedRole = 'User'});

  void setRole(String role) {
    selectedRole = role;
  }
}