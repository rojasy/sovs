import 'package:flutter/material.dart';
import 'package:gql/language.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../config/config_url.dart';

class SovsMutation{

  static Future<Map<String, dynamic>?> addVote(BuildContext context,
      String? candidateUuid, String? electionUuid,int year
      ) async {
    try {
      final GraphQLClient authorizedClient = await initGraphQLClient();

      QueryResult result = await authorizedClient.mutate(
        MutationOptions(
          document: parseString("""
            mutation AddVote(\$addVote: VotesDtoInput) {
  addVote(addVote: \$addVote) {
    code
    message
    error
    data {
      uuid
      year
      id
      userAccount {
        id
        fullName
        uuid
      }
    }
  }
}
          """),
          variables: {
            "addVote": {
              "candidateUuid": candidateUuid,
              "electionUuid": electionUuid,
              "electionYear": year
            }
          },
        ),
      );

      if (result.hasException) {
        throw result.exception.toString();
      }
      else{
        final Map<String, dynamic>? data = result.data;
        return data;

      }

    } catch (e,stacktrace) {
      print(stacktrace);
      throw Exception(e.toString());
    }
  }



  static Future<Map<String, dynamic>?> createUser(BuildContext context,
      String? email, String? firstName,String? lastName,String? phoneNumber,String? username,
      ) async {
    try {
      final GraphQLClient authorizedClient = await initGraphQLClient();

      QueryResult result = await authorizedClient.mutate(
        MutationOptions(
          document: parseString("""
           mutation CreateUpdateUser(\$user: UserAccountDtoInput) {
  createUpdateUser(user: \$user) {
    code
    message
    error
    data {
      id
      uuid
      username
      fullName
    }
  }
}
          """),
          variables: {
            "user": {
              "email": email,
              "firstName": firstName,
              "lastName": lastName,
              "phoneNumber": phoneNumber,
              "username": username
            }
          },
        ),
      );

      if (result.hasException) {
        throw result.exception.toString();
      }
      else{
        final Map<String, dynamic>? data = result.data;
        return data;

      }

    } catch (e,stacktrace) {
      print(stacktrace);
      throw Exception(e.toString());
    }
  }


  static Future<Map<String, dynamic>?> createCandidate(BuildContext context,
      String? description, String? electionUuid,String? title,String? userUuid
      ) async {
    try {
      final GraphQLClient authorizedClient = await initGraphQLClient();

      QueryResult result = await authorizedClient.mutate(
        MutationOptions(
          document: parseString("""
           mutation CreateCandidate(\$candidateDto: CandidateDtoInput) {
  createCandidate(CandidateDto: \$candidateDto) {
    code
    error
    message
    data {
      id
      title
      uuid
      userAccount {
        fullName
        username
        uuid
        id
      }
    }
  }
}
          """),
          variables: {
            "candidateDto": {
              "description": description,
              "electionUuid": electionUuid,
              "title": title,
              "userUuid": userUuid
            }
          },
        ),
      );

      if (result.hasException) {
        throw result.exception.toString();
      }
      else{
        final Map<String, dynamic>? data = result.data;
        return data;

      }

    } catch (e,stacktrace) {
      print(stacktrace);
      throw Exception(e.toString());
    }
  }


  static Future<Map<String, dynamic>?> createElection(BuildContext context,
      String? category, String? description,String? name,int year
      ) async {
    try {
      final GraphQLClient authorizedClient = await initGraphQLClient();

      QueryResult result = await authorizedClient.mutate(
        MutationOptions(
          document: parseString("""
           mutation CreateElection(\$electionDto: ElectionDtoInput) {
  createElection(electionDto: \$electionDto) {
    code
    message
    error
    data {
      category
      description
      id
      name
      uuid
      year
    }
  }
}
          """),
          variables: {
            "electionDto": {
              "category": category,
              "description": description,
              "name": name,
              "year": year
            }
          },
        ),
      );

      if (result.hasException) {
        throw result.exception.toString();
      }
      else{
        final Map<String, dynamic>? data = result.data;
        return data;

      }

    } catch (e,stacktrace) {
      print(stacktrace);
      throw Exception(e.toString());
    }
  }


}