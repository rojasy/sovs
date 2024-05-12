import 'dart:convert';

import 'package:gql/language.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../config/config_url.dart';
import '../models/all_election_model.dart';
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
}