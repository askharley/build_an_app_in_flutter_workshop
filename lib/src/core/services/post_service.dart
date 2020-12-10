import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:build_an_app_in_flutter_workshop/src/core/models/models.dart';

class PostService {
  static const url = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Post>> getPosts() async {
    List<Post> posts = List<Post>();

    var response = await http.get(url);

    var data = json.decode(response.body) as List<dynamic>;

    for (var post in data) {
      posts.add(Post.fromJson(post));
    }

    return posts;
  }

  Future<dynamic> getPost(int postId) async {
    Post post;

    var response = await http.get(url + '/$postId');

    var data = json.decode(response.body);

    post = Post.fromJson(data);

    return post;
  }
}
