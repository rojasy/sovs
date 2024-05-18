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

}