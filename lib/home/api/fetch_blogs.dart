import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tezbooks/home/model/blogs.dart';

class BlogApiProvider {
  Future<BlogModel> fetchBlogs() async {
    String baseUrl = "http://10.0.2.2:8000/";
    dynamic res;
    try {
      res = await http.get(Uri.parse(baseUrl)).timeout(
            const Duration(seconds: 5),
          );
    } catch (e) {
      throw Exception("Failed to fetch blogs");
    }
    if (res.statusCode == 200) {
      Map<String, dynamic> temp = {
        "status": "OK",
        "data": json.decode(res.body),
      };
      return BlogModel.fromJson(temp);
    }
    throw Exception("Failed to fetch blogs");
  }
}
