import 'package:http/http.dart' as http;
import 'dart:convert';

class network {
  network(this.Url);

  final String Url;

  Future getData() async {
    var url = Uri.parse(Url);

    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
