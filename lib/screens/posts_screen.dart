import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tribehire_assessment/data/api.dart';
import 'package:tribehire_assessment/model/posts.dart';
import 'package:tribehire_assessment/utils/colors.dart';
import 'package:tribehire_assessment/widgets/posts_widget.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  bool isLoading = false;
  List<Posts> postsList = [];

  void getPostsfromApi() async {
    setState(() {
      isLoading = true;
    });
    PostsApi.getPosts().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        postsList = list.map((model) => Posts.fromJson(model)).toList();
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsfromApi();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text('CommentTrackr')),
        backgroundColor: ColorChoice.gradient1,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: ColorChoice.gradient1,
              ),
            )
          : ListView.builder(
              itemCount: postsList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.03,
                    horizontal: width * 0.07,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/commentsscreen',
                          arguments: postsList[index].id);
                    },
                    child: PostsWidget(
                      userId: postsList[index].userId,
                      title: postsList[index].title,
                      body: postsList[index].body,
                      isPostScreen: true,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
