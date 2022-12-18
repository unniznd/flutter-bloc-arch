class _Blog {
  String title, body, date;

  _Blog({
    required this.title,
    required this.body,
    required this.date,
  });
}

class BlogModel {
  int _count = 0;
  List<_Blog> _blogs = [];

  BlogModel.fromJson(Map<String, dynamic> json) {
    _count = json["data"].length;

    List<_Blog> temp = [];
    for (int i = 0; i < json["data"].length; i++) {
      _Blog res = _Blog(
        title: json["data"][i]["title"],
        body: json["data"][i]["body"],
        date: json["data"][i]["date"],
      );
      temp.add(res);
    }

    _blogs = temp;
  }

  int get count => _count;
  List get blogs => _blogs;
}
