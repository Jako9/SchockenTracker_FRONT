import 'dart:convert';

import 'package:schockentracker/post_model.dart';
import 'package:http/http.dart';

class HTTPService {
  //final String postsURL = 'http://jako9.dns.army:3000';
  final String postsURL = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Post>> getPosts() async {
    Response res = await get(Uri.parse(postsURL));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Post> posts =
          body.map((dynamic item) => Post.fromJson(item)).toList();
      return posts;
    } else {
      throw "Can't get posts.";
    }
  }
}

