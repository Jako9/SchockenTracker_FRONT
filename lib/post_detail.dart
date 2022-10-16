import 'package:flutter/material.dart';
import 'package:schockentracker/post_model.dart';
import 'package:schockentracker/http_service.dart';

class PostsPage extends StatelessWidget {

  final HTTPService httpService = HTTPService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: FutureBuilder(
        future: httpService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            List<Post>? posts = snapshot.data;
            return ListView(
              children: posts!
                  .map(
                    (Post post) => ListTile(
                      title: Text(post.title),
                      subtitle: Text("${post.body}"),
                    ),
                  )
                  .toList(),
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}