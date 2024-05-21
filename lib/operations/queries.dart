import 'dart:convert';

import 'package:gql/language.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../config/config_url.dart';
import '../models/all_election_model.dart';
import '../models/get_all_candidates_model.dart';
import '../models/get_all_users_model.dart';
import '../models/get_candidate_by_category_model.dart';
import '../models/logged_in_user_model.dart';

class SovsQueriesServices {
  Future<GetLoggedInUserResponse> getLoggedInUser() async {
    final GraphQLClient authorizedClient = await initGraphQLClient();
    QueryResult result = await authorizedClient.query(
      QueryOptions(document: parseString("""
            query GetLoggedInUser {
  getLoggedInUser {
    code
    data {
      email
      firstName
      fullName
      id
      lastName
      phone
      roles {
        active
        displayName
        id
        name
        uuid
      }
      username
      uuid
      votes {
        candidates {
          active
          description
          id
          title
          uuid
        }
        election {
          active
          category
          createdAt
          createdBy
          deleted
          description
          id
          name
          updatedAt
          updatedBy
          uuid
          year
        }
        id
        time
        uuid
        year
      }
      active
    }
    error
    message
  }
}
  """)),
    );

    if (result.hasException) {
      throw Exception(result.exception);
    } else {
      GetLoggedInUserResponse getLoggedInUserResponse =
      getLoggedInUserResponseFromJson(jsonEncode(result.data));
      return getLoggedInUserResponse;
    }
  }

  Future<GetAllElectionResponse> getAllElection() async {
    final GraphQLClient authorizedClient = await initGraphQLClient();
    QueryResult result = await authorizedClient.query(
      QueryOptions(document: parseString("""
            query GetAllElection(\$pageParam: PageableParamInput) {
  getAllElection(pageParam: \$pageParam) {
    content {
      active
      category
      description
      id
      name
      uuid
      year
    }
  }
}
  """),variables: {
        "pageParam": {
          "first": 0,
          "size": 20
        }
      }),
    );

    if (result.hasException) {
      throw Exception(result.exception);
    } else {
      GetAllElectionResponse getAllElectionResponse =
      getAllElectionResponseFromJson(jsonEncode(result.data));
      return getAllElectionResponse;
    }
  }

  Future<GetAllCandidateByElectionCategoryResponse> getAllCandidateByElectionCategoryPresident() async {
    final GraphQLClient authorizedClient = await initGraphQLClient();
    QueryResult result = await authorizedClient.query(
      QueryOptions(document: parseString("""
           query GetAllCandidateByElectionCategory(\$category: ElectionCategory, \$pageParam: PageableParamInput) {
  getAllCandidateByElectionCategory(category: \$category, pageParam: \$pageParam) {
    content {
      description
      election {
        category
        description
        id
        name
        uuid
        year
      }
      id
      title
      uuid
      userAccount {
        active
        firstName
        fullName
        id
        lastName
        phone
        username
        uuid
        email
      }
    }
  }
}
  """),variables: {
        "pageParam": {
          "first": 0,
          "size": 20
        },
        "category": "PRESIDENT"
      }),
    );

    if (result.hasException) {
      throw Exception(result.exception);
    } else {
      GetAllCandidateByElectionCategoryResponse candidateByElectionCategoryResponse =
      getAllCandidateByElectionCategoryResponseFromJson(jsonEncode(result.data));
      return candidateByElectionCategoryResponse;
    }
  }
  Future<GetAllCandidateByElectionCategoryResponse> getAllCandidateByElectionCategoryCOET() async {
    final GraphQLClient authorizedClient = await initGraphQLClient();
    QueryResult result = await authorizedClient.query(
      QueryOptions(document: parseString("""
           query GetAllCandidateByElectionCategory(\$category: ElectionCategory, \$pageParam: PageableParamInput) {
  getAllCandidateByElectionCategory(category: \$category, pageParam: \$pageParam) {
    content {
      description
      election {
        category
        description
        id
        name
        uuid
        year
      }
      id
      title
      uuid
      userAccount {
        active
        firstName
        fullName
        id
        lastName
        phone
        username
        uuid
        email
      }
    }
  }
}
  """),variables: {
        "pageParam": {
          "first": 0,
          "size": 20
        },
        "category": "COET_PARLIAMENT"
      }),
    );

    if (result.hasException) {
      throw Exception(result.exception);
    } else {
      GetAllCandidateByElectionCategoryResponse candidateByElectionCategoryResponse =
      getAllCandidateByElectionCategoryResponseFromJson(jsonEncode(result.data));
      return candidateByElectionCategoryResponse;
    }
  }
  Future<GetAllCandidateByElectionCategoryResponse> getAllCandidateByElectionCategoryCOBA() async {
    final GraphQLClient authorizedClient = await initGraphQLClient();
    QueryResult result = await authorizedClient.query(
      QueryOptions(document: parseString("""
           query GetAllCandidateByElectionCategory(\$category: ElectionCategory, \$pageParam: PageableParamInput) {
  getAllCandidateByElectionCategory(category: \$category, pageParam: \$pageParam) {
    content {
      description
      election {
        category
        description
        id
        name
        uuid
        year
      }
      id
      title
      uuid
      userAccount {
        active
        firstName
        fullName
        id
        lastName
        phone
        username
        uuid
        email
      }
    }
  }
}
  """),variables: {
        "pageParam": {
          "first": 0,
          "size": 20
        },
        "category": "COBA_PARLIAMENT"
      }),
    );

    if (result.hasException) {
      throw Exception(result.exception);
    } else {
      GetAllCandidateByElectionCategoryResponse candidateByElectionCategoryResponse =
      getAllCandidateByElectionCategoryResponseFromJson(jsonEncode(result.data));
      return candidateByElectionCategoryResponse;
    }
  }

  Future<GetAllUsersResponse> getAllUsers() async {
    final GraphQLClient authorizedClient = await initGraphQLClient();
    QueryResult result = await authorizedClient.query(
      QueryOptions(document: parseString("""
           query GetAllUsers(\$pageParam: PageableParamInput) {
  getAllUsers(pageParam: \$pageParam) {
    content {
      active
      email
      firstName
      id
      lastName
      middleName
      phone
      uuid
      username
      fullName
    }
  }
}
  """),variables: {
        "pageParam": {
          "first": 0,
          "size": 20
        },
      }),
    );

    print(result);
    if (result.hasException) {
      throw Exception(result.exception);
    } else {
      GetAllUsersResponse getAllUsersResponse =
      getAllUsersResponseFromJson(jsonEncode(result.data));
      return getAllUsersResponse;
    }
  }

  Future<GetAllCandidatesResponse> getAllCandidates() async {
    final GraphQLClient authorizedClient = await initGraphQLClient();
    QueryResult result = await authorizedClient.query(
      QueryOptions(document: parseString("""
           query GetAllCandidates(\$pageParam: PageableParamInput) {
  getAllCandidates(pageParam: \$pageParam) {
    content {
      title
      description
      uuid
      userAccount {
        firstName
        fullName
        id
        lastName
        username
        uuid
        email
        phone
      }
      id
      active
      election {
        category
        id
        name
        uuid
        year
        active
        description
      }
    }
  }
}
  """),variables: {
        "pageParam": {
          "first": 0,
          "size": 20
        },
      }),
    );

    print(result);
    if (result.hasException) {
      throw Exception(result.exception);
    } else {
      GetAllCandidatesResponse getAllCandidatesResponse =
      getAllCandidatesResponseFromJson(jsonEncode(result.data));
      return getAllCandidatesResponse;
    }
  }
}