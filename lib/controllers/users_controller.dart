
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
      String? phoneNumber,
      String? username
      ) async {
    Map<String, dynamic>? result = await SovsMutation.createUser(context, email, firstName, lastName, phoneNumber, username);
    getAllUsersFunction();
    notifyListeners();
    return result;
  }

}