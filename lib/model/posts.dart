class Posts {
  int userId;
  int id;
  String title;
  String body;

  Posts.fromJson(Map json)
      : userId = json['userId'],
        id = json['id'],
        title = json['title'],
        body = json['body'];

  Map toJson() {
    return {'userId': userId, 'id': id, 'title': title, 'body': body};
  }
}
