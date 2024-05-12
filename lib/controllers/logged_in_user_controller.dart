
import 'package:flutter/material.dart';

import '../models/logged_in_user_model.dart';
import '../operations/queries.dart';

class GetLoggedInUserController extends ChangeNotifier {
  GetLoggedInUserController() {
    getLoggedInUserFunction();
  }
  LoggedUser? _getLoggedUser;
  LoggedUser? get getLoggedUser => _getLoggedUser;
  bool dataLoading = false;

  getLoggedInUserFunction() async {
    dataLoading = true;
    try {
      SovsQueriesServices service = SovsQueriesServices();
      GetLoggedInUserResponse getLoggedInUserResponse =
      await service.getLoggedInUser();

      if (getLoggedInUserResponse.getLoggedInUser.code == 9000) {
        _getLoggedUser = getLoggedInUserResponse.getLoggedInUser.data;
        dataLoading = false;
        notifyListeners();

      }
    } catch (err) {
      print(err.toString());
    }
  }
}
