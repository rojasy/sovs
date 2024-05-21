import 'package:flutter/cupertino.dart';

import '../models/all_election_model.dart';
import '../operations/mutations.dart';
import '../operations/queries.dart';

class GetAllElectionController extends ChangeNotifier{
  GetAllElectionController() {
    getAllElectionFunction();
  }
  List<AllElection> _getAllElection = [];
  List<AllElection> get getAllElection => _getAllElection;
  bool dataLoading = false;

  getAllElectionFunction() async {
    dataLoading = true;
    try {
      SovsQueriesServices service = SovsQueriesServices();
      GetAllElectionResponse getAllElectionResponse =
      await service.getAllElection();


      _getAllElection = getAllElectionResponse.getAllElection.content;
        dataLoading = false;
        notifyListeners();


    } catch (err) {
      print(err.toString());
    }
  }

  Future<Map<String, dynamic>?> createElection(
      BuildContext context,
      String? category, String? description,String? name,int year
      ) async {
    Map<String, dynamic>? result = await SovsMutation.createElection(context, category, description, name, year);
    getAllElectionFunction();
    notifyListeners();
    return result;
  }


}