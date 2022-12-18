import 'package:rxdart/subjects.dart';
import 'package:tezbooks/home/model/blogs.dart';
import 'package:tezbooks/home/repo/repo_blog.dart';

class BlogBloc {
  final blogrepo = BlogRepo();
  final _blogFetcher = PublishSubject<BlogModel>();

  Stream<BlogModel> get allBlogs => _blogFetcher.stream;

  fetchAllBlogs() async {
    try {
      BlogModel blogModel = await blogrepo.fetchAllBlogs();
      _blogFetcher.sink.add(blogModel);
    } catch (e) {
      _blogFetcher.sink.addError(e);
    }
  }

  dispose() {
    _blogFetcher.close();
  }
}

final bloc = BlogBloc();
