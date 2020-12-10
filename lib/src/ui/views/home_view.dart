import 'package:build_an_app_in_flutter_workshop/src/ui/views/post_view.dart';
import 'package:flutter/material.dart';
import 'package:build_an_app_in_flutter_workshop/src/locator.dart';
import 'package:build_an_app_in_flutter_workshop/src/core/models/post.dart';
import 'package:build_an_app_in_flutter_workshop/src/core/services/post_service.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PostService _postService = locator<PostService>();
  bool isBusy = true;
  List<Post> _posts;

  @override
  initState() {
    super.initState();
    _postService.getPosts().then((data) {
      setState(() {
        _posts = data;
      });
      isBusy = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Our Workshop App')),
        body: Center(
            child: isBusy
                ? Text('Loading...',
                    style: TextStyle(color: Colors.black, fontSize: 24))
                : ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    itemCount: _posts.length,
                    itemBuilder: (BuildContext context, int index) => ListTile(
                      leading: Text(_posts[index].id.toString()),
                      title: Text(_posts[index].title),
                      subtitle: Text(_posts[index].body),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  PostView(postId: _posts[index].id))),
                    ),
                  )));
  }
}
