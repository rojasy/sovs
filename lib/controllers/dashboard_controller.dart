import 'package:flutter/cupertino.dart';

import '../models/get_dashboard_model.dart';
import '../operations/queries.dart';

class DashboardController extends ChangeNotifier{
  DashboardController(){
    getDashboardFunction();
  }

  Dashboard? _getDashboard;
  Dashboard? get getDashboard => _getDashboard;
  bool dataLoading = false;

  getDashboardFunction() async {
    dataLoading = true;
    try {
      SovsQueriesServices service = SovsQueriesServices();
      GetDashboardResponse dashboardResponse =
      await service.getDashboard();


      _getDashboard = dashboardResponse.getDashboard.data;
      dataLoading = false;
      notifyListeners();


    } catch (err) {
      print(err.toString());
    }
  }
}