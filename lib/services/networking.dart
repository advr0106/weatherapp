import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  final String url;

  Networking({required this.url});

  Future getData() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}');
      return null;
    }
  }
}
