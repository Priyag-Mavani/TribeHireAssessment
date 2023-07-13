class Comments {
  int postId;
  int id;
  String name;
  String email;
  String body;

  Comments.fromJson(Map json)
      : postId = json['postId'],
        id = json['id'],
        name = json['name'],
        email = json['email'],
        body = json['body'];

  Map toJson() {
    return {'postId': postId, 'id': id, 'name': name, 'email': email, 'body': body};
  }
}