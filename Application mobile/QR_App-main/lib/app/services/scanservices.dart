import 'dart:developer';

import 'package:http/http.dart' as http;

import '../data/models/information.dart';

class ScanServices {
  static Future<Information> getStudent({
    required String id,
    required String db,
    required String schoolaryear,
    required String baseurl,
  }) async {
    http.Request request =
        http.Request('GET', Uri.parse("$baseurl/api/mobile/student/details"));

    request.body = '''{"id": "$id"}''';

    request.headers.addAll({
      'db': db,
      'SchoolarYear': schoolaryear,
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Im9uZXBhY2siLCJpZCI6IjVmYzJjMGE1YTJiNzBlMDg4ODhhOGI5ZCIsInJvbGUiOnsiYWNjZXNzIjp7ImhvbWUiOnRydWUsImFsbCI6dHJ1ZSwicGFyYW1ldHJhZ2UiOnRydWUsInBlcnNvbm5lbCI6dHJ1ZSwiZG9zc2llcl9tZWRpY2FsIjp0cnVlLCJsaXN0ZV9lbGV2ZXMiOnRydWUsImFjdGl2aXRlIjp0cnVlLCJzY29sYXJpdGUiOnRydWUsImFkbWluc3RyYXRpb24iOnRydWUsImNvbXBhdGFiaWxpdGUiOnRydWUsImRlY2xhcmF0aW9uIjp0cnVlLCJwYXltZW50cyI6dHJ1ZX0sInN0YXR1cyI6ImFjdGl2ZSIsIl9pZCI6IjVmN2E1MjY1NjdhYmNhZTY0MDcyMWVjMCIsInJvbGUiOiJhZG1pbiIsImNyZWF0ZWRBdCI6IjIwMjAtMTAtMDRUMjI6NTM6MjUuMzk5WiIsInVwZGF0ZWRBdCI6IjIwMjAtMTEtMDRUMTA6NDg6MTkuNTE0WiIsIl9fdiI6MH0sImlhdCI6MTY1NDU5NjUzMCwiZXhwIjoxNjU2MjUxMjEzNjkyfQ.e05xGILZxVkW-zyKhVa3rmim4PJoaaH3YN2uhlH9XeA',
      'Content-Type': 'application/json'
    });

    http.StreamedResponse streamedResponse = await request.send();

    //CONVERT streamedResponse TO RESPONSE
    http.Response response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      log(response.body);
      return informationFromJson(response.body);
    } else {
      return throw Exception('failed');
    }
  }
}
