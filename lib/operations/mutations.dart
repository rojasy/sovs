import 'package:flutter/material.dart';
import 'package:gql/language.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../config/config_url.dart';

class SovsMutation{

  static Future<Map<String, dynamic>?> addVote(BuildContext context,
      String? candidateUuid, String? electionUuid
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
              "electionUuid": electionUuid
            }
          },
        ),
      );

      print(result);

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
      String? email, String? firstName,String? lastName,String? phoneNumber,String? username,String? course,
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
              "courses": course,
              "email": email,
              "firstName": firstName,
              "lastName": lastName,
              "phoneNumber": phoneNumber,
              "username": username
            }
          },
        ),
      );

      print(result);

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


  static Future<Map<String, dynamic>?> updateUser(BuildContext context,String? uuid,
      String? email, String? firstName,String? lastName,String? phoneNumber,String? username,String? course,
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
              "courses": course,
              "email": email,
              "firstName": firstName,
              "lastName": lastName,
              "phoneNumber": phoneNumber,
              "username": username,
              "uuid": uuid
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


  static Future<Map<String, dynamic>?> updateCandidate(BuildContext context,
      String? description, String? electionUuid,String? title,String? userUuid,String? uuid
      ) async {
    try {
      final GraphQLClient authorizedClient = await initGraphQLClient();

      QueryResult result = await authorizedClient.mutate(
        MutationOptions(
          document: parseString("""
           mutation UpdateCandidate(\$candidate: CandidateDtoInput) {
  updateCandidate(candidate: \$candidate) {
    code
    message
    error
    data {
      active
      id
      title
      uuid
      description
    }
  }
}
          """),
          variables: {
            "candidate": {
              "description": description,
              "electionUuid": electionUuid,
              "title": title,
              "userUuid": userUuid,
              "uuid": uuid
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


  static Future<Map<String, dynamic>?> updateElection(BuildContext context,
      String? category, String? description,String? name,int year,String? uuid
      ) async {
    try {
      final GraphQLClient authorizedClient = await initGraphQLClient();

      QueryResult result = await authorizedClient.mutate(
        MutationOptions(
          document: parseString("""
           mutation UpdateElection(\$election: ElectionDtoInput) {
  updateElection(election: \$election) {
    code
    message
    error
    data {
      id
      name
      uuid
      year
    }
  }
}
          """),
          variables: {
            "election": {
              "category": category,
              "description": description,
              "name": name,
              "uuid": uuid,
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


  static Future<Map<String, dynamic>?> deleteUser(BuildContext context,
      String? uuid
      ) async {
    try {
      final GraphQLClient authorizedClient = await initGraphQLClient();

      QueryResult result = await authorizedClient.mutate(
        MutationOptions(
          document: parseString("""
           mutation DeleteUser(\$uuid: String) {
  deleteUser(uuid: \$uuid) {
    message
    error
    data {
      id
      username
      uuid
    }
    code
  }
}
          """),
          variables: {
            "uuid": uuid
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


  static Future<Map<String, dynamic>?> deleteCandidate(BuildContext context,
      String? uuid
      ) async {
    try {
      final GraphQLClient authorizedClient = await initGraphQLClient();

      QueryResult result = await authorizedClient.mutate(
        MutationOptions(
          document: parseString("""
           mutation DeleteCandidate(\$uuid: String) {
  deleteCandidate(uuid: \$uuid) {
    message
    error
    data {
      id
      title
      totalVotes
      uuid
    }
    code
  }
}
          """),
          variables: {
            "uuid": uuid
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


  static Future<Map<String, dynamic>?> deleteElection(BuildContext context,
      String? uuid
      ) async {
    try {
      final GraphQLClient authorizedClient = await initGraphQLClient();

      QueryResult result = await authorizedClient.mutate(
        MutationOptions(
          document: parseString("""
           mutation DeleteElection(\$uuid: String) {
  deleteElection(uuid: \$uuid) {
    code
    error
    message
    data {
      id
      name
      uuid
    }
  }
}
          """),
          variables: {
            "uuid": uuid
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