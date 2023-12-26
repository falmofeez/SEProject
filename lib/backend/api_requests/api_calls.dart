import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start BF - emailUpcomingCourse Group Code

class BFEmailUpcomingCourseGroup {
  static String baseUrl = 'https://api.backendflow.io/v1';
  static Map<String, String> headers = {};
  static EmailUpcomingCourseCall emailUpcomingCourseCall =
      EmailUpcomingCourseCall();
}

class EmailUpcomingCourseCall {
  Future<ApiCallResponse> call({
    String? to = '',
    String? subject = '',
    String? attachmentLink = '',
    String? attachmentName = '',
  }) async {
    final ffApiRequestBody = '''
{
  "sk-bf-8ee06755-30c7-46cc-8aa3-f6888a57ef2f": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'emailUpcomingCourse',
      apiUrl:
          '${BFEmailUpcomingCourseGroup.baseUrl}/email?templateId=kfG8HjV92j8H8caFF9Cn&to=${to}&subject=${subject}&attachmentLink=${attachmentLink}&attachmentName=${attachmentName}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End BF - emailUpcomingCourse Group Code

class YoutubeSearchCall {
  static Future<ApiCallResponse> call({
    String? apiQ = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'youtubeSearch',
      apiUrl: 'https://youtube-data8.p.rapidapi.com/search/',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Key': '5ae9aafa79msh8a74a4b8155e334p1f0a6djsn78782168e59f',
        'X-RapidAPI-Host': 'youtube-data8.p.rapidapi.com',
      },
      params: {
        'q': apiQ,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? video(dynamic response) => getJsonField(
        response,
        r'''$.contents.*.video''',
        true,
      ) as List?;
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
