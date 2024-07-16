
import 'package:flutter/cupertino.dart';

import '../models/get_all_users_model.dart';
import '../operations/mutations.dart';
import '../operations/queries.dart';

class GetUsersController extends ChangeNotifier {
  GetUsersController() {
    getAllUsersFunction();
  }
  List<AllUsers> _getAllUser = [];
  List<AllUsers> get getAllUser => _getAllUser;
  bool dataLoading = false;

  getAllUsersFunction() async {
    dataLoading = true;
    try {
      SovsQueriesServices service = SovsQueriesServices();
      GetAllUsersResponse getAllUsersResponse =
      await service.getAllUsers();

      _getAllUser = getAllUsersResponse.getAllUsers.content;
        dataLoading = false;
        notifyListeners();


    } catch (err) {
      print(err.toString());
    }
  }

  Future<Map<String, dynamic>?> createUser(
      BuildContext context,
      String? email,
      String? firstName,
      String? lastName,
      String? password,
      String? phoneNumber,
      String? username,
      String? course
      ) async {
    Map<String, dynamic>? result = await SovsMutation.createUser(context, email, firstName, lastName,password ,phoneNumber, username,course);
    getAllUsersFunction();
    notifyListeners();
    return result;
  }


  Future<Map<String, dynamic>?> updateUser(
      BuildContext context,
      String? email,
      String? firstName,
      String? lastName,
      String? password,
      String? phoneNumber,
      String? username,
      String? course,
      String? uuid
      ) async {
    Map<String, dynamic>? result = await SovsMutation.updateUser(context, uuid, email, firstName, lastName,password ,phoneNumber, username, course);
    getAllUsersFunction();
    notifyListeners();
    return result;
  }


  Future<Map<String, dynamic>?> deleteUser(
      BuildContext context,
      String? uuid
      ) async {
    Map<String, dynamic>? result = await SovsMutation.deleteUser(context, uuid);
    getAllUsersFunction();
    notifyListeners();
    return result;
  }

  Future<Map<String, dynamic>?> changePassword(
      BuildContext context,
      String? oldPassword,
      String? newPassword,
      ) async {
    Map<String, dynamic>? result = await SovsMutation.changePassword(context, oldPassword, newPassword);
    // getAllUsersFunction();
    notifyListeners();
    return result;
  }

}