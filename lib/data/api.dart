import 'dart:async';
import 'package:http/http.dart' as http;

class PostsApi {
  static Future getPosts() {
    return http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
  }
}

class IndividualPostsApi {
  static Future getIndividualPosts(int id) {
    return http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/$id"));
  }
}

class CommentsApi {
  static Future getComments(int postId) {
    return http.get(Uri.parse("https://jsonplaceholder.typicode.com/comments?postId=$postId"));
  }
}