import 'package:flutter/material.dart';
import 'package:sovs/operations/mutations.dart';

import '../models/get_all_candidates_model.dart';
import '../models/get_candidate_by_category_model.dart';
import '../models/get_candidate_vote_model.dart';
import '../operations/queries.dart';

class CandidateController extends ChangeNotifier{
      String candidateUuid = '';
      String electionUuid = '';
  CandidateController() {
    getAllCandidatesFunction();
    getAllCandidateByElectionCategoryPresident();
    getAllCandidateByElectionCategoryCOET();
    getAllCandidateByElectionCategoryCOBA();
    getCandidateVote(candidateUuid, electionUuid);
  }
  List<CandidatesContent> _getAllCandidateByCategoryList = [];
  List<CandidatesContent> get getAllCandidateByCategoryList => _getAllCandidateByCategoryList;

  List<AllCandidates> _getAllCandidatesList = [];
  List<AllCandidates> get getAllCandidatesList => _getAllCandidatesList;


  VotesCount? _getVotesCountList;
  VotesCount? get getVotesCountList => _getVotesCountList;

  List<CandidatesContent> _getAllCandidateByCategoryCOETList = [];
  List<CandidatesContent> get getAllCandidateByCategoryCOETList => _getAllCandidateByCategoryCOETList;

  List<CandidatesContent> _getAllCandidateByCategoryCOBAList = [];
  List<CandidatesContent> get getAllCandidateByCategoryCOBAList => _getAllCandidateByCategoryCOBAList;

  bool dataLoading = false;

  getAllCandidatesFunction() async {
    dataLoading = true;
    try {
      SovsQueriesServices service = SovsQueriesServices();
      GetAllCandidatesResponse getAllCandidatesResponse =
      await service.getAllCandidates();


      _getAllCandidatesList = getAllCandidatesResponse.getAllCandidates.content;
      dataLoading = false;
      notifyListeners();


    } catch (err) {
      print(err.toString());
    }
  }

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


  getCandidateVote(String candidateUuid, String electionUuid) async {
    dataLoading = true;
    try {
      SovsQueriesServices service = SovsQueriesServices();
      GetCandidateVotesResponse candidateVotesResponse =
      await service.getCandidatesVote(candidateUuid, electionUuid);


      _getVotesCountList = candidateVotesResponse.getCandidateVotes.data;
      dataLoading = false;
      notifyListeners();


    } catch (err) {
      print(err.toString());
    }
  }

  Future<Map<String, dynamic>?> addVote(
      BuildContext context,
      String? candidateUuid,
      String? electionUuid
      ) async {
    Map<String, dynamic>? result = await SovsMutation.addVote(context, candidateUuid, electionUuid);
    notifyListeners();
    return result;
  }



  Future<Map<String, dynamic>?> createCandidate(
      BuildContext context,
      String? description, String? electionUuid,String? title,String? userUuid
      ) async {
    Map<String, dynamic>? result = await SovsMutation.createCandidate(context, description, electionUuid, title, userUuid);
    getAllCandidatesFunction();
    notifyListeners();
    return result;
  }

      Future<Map<String, dynamic>?> updateCandidate(
          BuildContext context,
          String? description, String? electionUuid,String? title,String? userUuid,String? uuid
          ) async {
        Map<String, dynamic>? result = await SovsMutation.updateCandidate(context, description, electionUuid, title, userUuid, uuid);
        getAllCandidatesFunction();
        notifyListeners();
        return result;
      }

      Future<Map<String, dynamic>?> deleteCandidate(
          BuildContext context,
          String? uuid
          ) async {
        Map<String, dynamic>? result = await SovsMutation.deleteCandidate(context, uuid);
        getAllCandidatesFunction();
        notifyListeners();
        return result;
      }


      // refreshCOBAData() async {
      //   await getAllCandidateByElectionCategoryCOBA();
      // }
      //
      // refreshCOETData() async {
      //   await getAllCandidateByElectionCategoryCOET();
      // }

      // refreshPresidentData() async {
      //   await getAllCandidateByElectionCategoryPresident();
      // }

      Future<void> refreshPresidentData() async {
        dataLoading = true;
        notifyListeners();

        // Fetch the latest candidate data here
        _getAllCandidateByCategoryList = await getAllCandidateByElectionCategoryPresident();

        dataLoading = false;
        notifyListeners();
      }

      Future<void> refreshCOBAData() async {
        dataLoading = true;
        notifyListeners();

        // Fetch the latest candidate data here
        _getAllCandidateByCategoryCOBAList = await getAllCandidateByElectionCategoryCOBA();

        dataLoading = false;
        notifyListeners();
      }

      Future<void> refreshCOETData() async {
        dataLoading = true;
        notifyListeners();

        // Fetch the latest candidate data here
        _getAllCandidateByCategoryCOETList = await getAllCandidateByElectionCategoryCOET();

        dataLoading = false;
        notifyListeners();
      }

      // Future<void> refreshCOETData() async {
      //   dataLoading = true;
      //   notifyListeners();
      //
      //   // Fetch the latest candidate data here
      //   try {
      //     _getAllCandidateByCategoryCOETList = await getAllCandidateByElectionCategoryCOET() ?? [];
      //   } catch (e) {
      //     _getAllCandidateByCategoryCOETList = [];
      //     // Handle error if necessary
      //   }
      //
      //
      // }

      }