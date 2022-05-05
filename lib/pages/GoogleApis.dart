import 'dart:html';

import 'package:googleapis/fitness/v1.dart' as fitness;
import 'package:googleapis_auth/auth_browser.dart' as auth;
import 'package:googleapis/drive/v2.dart' as drive;

/// This example demonstrates usage for a Dart command line application.
///
/// For details of how to use this package in Flutter, see
/// https://flutter.dev/docs/development/data-and-backend/google-apis

import 'package:googleapis/storage/v1.dart';
import 'package:googleapis_auth/auth_io.dart';

Future<void> DownloadFromGoogle() async {
  final identifier = auth.ClientId(
      "460987549848-9ecs5um0603g4f7ttlfa2dni23gsa6fa.apps.googleusercontent.com",
      null);

  final scopes = [drive.DriveApi.driveScope];



  ButtonElement loginButton = ButtonElement();

  authorizedClient(loginButton, identifier, scopes).then((client) {
    var api = drive.DriveApi(client);

    final accountCredentials = auth.ServiceAccountCredentials.fromJson(r'''
{
  "private_key_id": "<please fill in>",
  "private_key": "<please fill in>",
  "client_email": "<please fill in>@developer.gserviceaccount.com",
  "client_id": "<please fill in>.apps.googleusercontent.com",
  "type": "service_account"
}
''');
  });

  /*
  final httpClient = await clientViaApplicationDefaultCredentials(scopes: [
    StorageApi.devstorageReadOnlyScope,
  ]);
  try {
    final storage = StorageApi(httpClient);

    final buckets = await storage.buckets.list('dart-on-cloud');
    final items = buckets.items!;
    print('Received ${items.length} bucket names:');
    for (var file in items) {
      print(file.name);
    }
  } finally {
    httpClient.close();
  }
  */
}

Future authorizedClient(ButtonElement loginButton, auth.ClientId id, scopes) {
  return auth.createImplicitBrowserFlow(id, scopes)
      .then((auth.BrowserOAuth2Flow flow) {
    return flow.clientViaUserConsent(immediate: false).catchError((_) {
      loginButton.text = '';
      return loginButton.onClick.first.then((_) {
        return flow.clientViaUserConsent(immediate: true);
      });
    }, test: (error) => error is auth.UserConsentException);
  });
}


/*
Future<List<drive.File>> searchTextDocuments(drive.DriveApi api,
    int max,
    String query) {
  var docs = [];
  Future next(String token) {
    // The API call returns only a subset of the results. It is possible
    // to query through the whole result set via "paging".
    return api.files.list(q: query, pageToken: token, maxResults: max)
        .then((results) {
      docs.add(results.items);
      // If we would like to have more documents, we iterate.
      if (docs.length < max && results.nextPageToken != null) {
        return next(results.nextPageToken);
      }
      return docs;
    });
  }
  return next(null);
}
 */