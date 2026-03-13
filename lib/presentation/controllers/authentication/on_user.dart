import 'package:news_application/model/user_model.dart';
import 'package:news_application/services/user_services.dart';

class OnUser {
  static void onAddUser(UserModel user) async{
    await UserServices.addUserToTable(user);
  }
  static void onUpdateUser(UserModel user) async{
    await UserServices.updateUser(user);
  }
  static Future<List<UserModel>> onGetUser(String id) async{
    return await UserServices.getUserById(id);
  }
  static void onDeleteUser(String id) async{
    await UserServices.deleteUser(id);
  }
}