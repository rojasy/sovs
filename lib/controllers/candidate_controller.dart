import 'package:flutter/material.dart';
import 'package:sovs/operations/mutations.dart';

import '../models/get_candidate_by_category_model.dart';
import '../operations/queries.dart';

class CandidateController extends ChangeNotifier{
  CandidateController() {
    getAllCandidateByElectionCategoryPresident();
    getAllCandidateByElectionCategoryCOET();
    getAllCandidateByElectionCategoryCOBA();
  }
  List<CandidatesContent> _getAllCandidateByCategoryList = [];
  List<CandidatesContent> get getAllCandidateByCategoryList => _getAllCandidateByCategoryList;

  List<CandidatesContent> _getAllCandidateByCategoryCOETList = [];
  List<CandidatesContent> get getAllCandidateByCategoryCOETList => _getAllCandidateByCategoryCOETList;

  List<CandidatesContent> _getAllCandidateByCategoryCOBAList = [];
  List<CandidatesContent> get getAllCandidateByCategoryCOBAList => _getAllCandidateByCategoryCOBAList;

  bool dataLoading = false;

  getAllCandidateByElectionCategoryPresident() async {
    dataLoading = true;
    try {
      SovsQueriesServices service = SovsQueriesServices();
      GetAllCandidateByElectionCategoryResponse candidateByElectionCategoryResponse =
      await service.getAllCandidateByElectionCategoryPresident();


      _getAllCandidateByCategoryList = candidateByElectionCategoryResponse.getAllCandidateByElectionCategory.content;
      dataLoading = false;
      notifyListeners();


    } catch (err) {
      print(err.toString());
    }
  }
  getAllCandidateByElectionCategoryCOET() async {
    dataLoading = true;
    try {
      SovsQueriesServices service = SovsQueriesServices();
      GetAllCandidateByElectionCategoryResponse candidateByElectionCategoryResponse =
      await service.getAllCandidateByElectionCategoryCOET();


      _getAllCandidateByCategoryCOETList = candidateByElectionCategoryResponse.getAllCandidateByElectionCategory.content;
      dataLoading = false;
      notifyListeners();


    } catch (err) {
      print(err.toString());
    }
  }
  getAllCandidateByElectionCategoryCOBA() async {
    dataLoading = true;
    try {
      SovsQueriesServices service = SovsQueriesServices();
      GetAllCandidateByElectionCategoryResponse candidateByElectionCategoryResponse =
      await service.getAllCandidateByElectionCategoryCOBA();


      _getAllCandidateByCategoryCOBAList = candidateByElectionCategoryResponse.getAllCandidateByElectionCategory.content;
      dataLoading = false;
      notifyListeners();


    } catch (err) {
      print(err.toString());
    }
  }

  Future<Map<String, dynamic>?> addVote(
      BuildContext context,
      String? candidateUuid,
      String? electionUuid,
      int year
      ) async {
    Map<String, dynamic>? result = await SovsMutation.addVote(context, candidateUuid, electionUuid, year);
    notifyListeners();
    return result;
  }

}