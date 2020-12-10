import 'package:flutter/material.dart';
import 'package:build_an_app_in_flutter_workshop/src/locator.dart';
import 'package:build_an_app_in_flutter_workshop/src/core/models/post.dart';
import 'package:build_an_app_in_flutter_workshop/src/core/services/post_service.dart';

class PostView extends StatefulWidget {
  final int postId;

  PostView({this.postId});

  @override
  _PostViewState createState() => _PostViewState(postId: postId);
}

class _PostViewState extends State<PostView> {
  final int postId;
  final PostService _postService = locator<PostService>();
  bool isBusy = true;
  Post _post;

  _PostViewState({this.postId});

  @override
  initState() {
    super.initState();
    _postService.getPost(postId).then((data) {
      setState(() {
        _post = data;
      });
      isBusy = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post View')),
      body: Center(
        child: isBusy
            ? Text('Loading...',
                style: TextStyle(color: Colors.black, fontSize: 24))
            : Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_post.title,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 25),
                    Text(_post.body,
                        style: TextStyle(color: Colors.black, fontSize: 18))
                  ],
                ),
              ),
      ),
    );
  }
}
