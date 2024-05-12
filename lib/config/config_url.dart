import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../session/session_manager.dart';
import '../utils/constants.dart';

Future<GraphQLClient> initGraphQLClient() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  // final appDocumentDirectory = await getApplicationDocumentsDirectory();
  // Hive.init(appDocumentDirectory.path);
  // await initHiveForFlutter();
  final HttpLink httpLink = HttpLink(
      '${graphqlUrl}/graphql');
  String? Token = await SessionManager().getAccessToken();


  final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer $Token',
  );

  final Link link = authLink.concat(httpLink);
  final GraphQLClient authorizedClient = GraphQLClient(
    link: link,
    cache: GraphQLCache(),
    // store: HiveStore()
  );



  return authorizedClient;

}
