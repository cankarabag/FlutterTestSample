import 'dart:convert';

import 'package:http/http.dart';
import 'package:test_app/model/post.dart';
import 'package:test_app/model/user.dart';

class ServiceTest {
  final String basePath = 'https://jsonplaceholder.typicode.com';

  getUsers() async {
    final String url = '$basePath/users';
    Response response = await get(url);
    final List<User> userList =
        json.decode(response.body).map<User>((f) => User.fromJson(f)).toList();
    return userList;
  }

  getUserPosts({int id}) async {
    final String url = '$basePath/posts?userId=$id';
    Response response = await get(url);
    final List<Post> postList =
        json.decode(response.body).map<Post>((f) => Post.fromJson(f)).toList();
    return postList;
  }

  getPost({int id}) async {
    final String url = '$basePath/posts/$id';
    Response response = await get(url);
    final Post post = Post.fromJson(json.decode(response.body));
    return post;
  }
}