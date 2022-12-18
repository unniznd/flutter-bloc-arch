import 'dart:async';
import 'package:tezbooks/home/api/fetch_blogs.dart';
import 'package:tezbooks/home/model/blogs.dart';

class BlogRepo {
  final blogApiProvider = BlogApiProvider();

  Future<BlogModel> fetchAllBlogs() => blogApiProvider.fetchBlogs();
}
