import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tribehire_assessment/data/api.dart';
import 'package:tribehire_assessment/model/comments.dart';
import 'package:tribehire_assessment/model/posts.dart';
import 'package:tribehire_assessment/utils/colors.dart';
import 'package:tribehire_assessment/utils/contants.dart';
import 'package:tribehire_assessment/widgets/comments_widget.dart';
import 'package:tribehire_assessment/widgets/posts_widget.dart';

class CommentsScreen extends StatefulWidget {
  final int id;

  const CommentsScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  bool isCommentsLoading = false;
  bool isIndividualPostsLoading = false;
  List<Posts> individualPostsList = [];
  List<Comments> commentsList = [];
  List<Comments> filteredCommentsList = [];
  String search = '';

  void getCommentsfromApi() async {
    setState(() {
      isCommentsLoading = true;
    });
    CommentsApi.getComments(widget.id).then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        commentsList = list.map((model) => Comments.fromJson(model)).toList();
        filteredCommentsList = commentsList;
        isCommentsLoading = false;
      });
    });
  }

  void getIndividualPostsfromApi() async {
    setState(() {
      isIndividualPostsLoading = true;
    });
    IndividualPostsApi.getIndividualPosts(widget.id).then((response) {
      setState(() {
        var data = json.decode(response.body);
        if (data != null) {
          individualPostsList = [Posts.fromJson(data)];
        }
        isIndividualPostsLoading = false;
      });
    });
  }

  void filterComments(String query) {
    setState(() {
      search = query;
      filteredCommentsList = commentsList.where((comment) {
        final name = comment.name.toLowerCase();
        final email = comment.email.toLowerCase();
        final body = comment.body.toLowerCase();
        final lowercaseQuery = query.toLowerCase();
        return name.contains(lowercaseQuery) ||
            email.contains(lowercaseQuery) ||
            body.contains(lowercaseQuery);
      }).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    getIndividualPostsfromApi();
    getCommentsfromApi();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorChoice.gradient1,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.03, horizontal: width * 0.07),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isIndividualPostsLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: ColorChoice.gradient1,
                    ),
                  )
                : Column(
                    children: individualPostsList
                        .map((post) => PostsWidget(
                              userId: post.userId,
                              title: post.title,
                              body: post.body,
                              isPostScreen: false,
                            ))
                        .toList(),
                  ),
            const Expanded(
              flex: 2,
              child: SizedBox(),
            ),
            Text(
              'COMMENTS',
              style: AppConstants.textStyle(
                fontSize: AppConstants.fontBig,
                fontWeight: AppConstants.fontWeightBold,
              ),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            TextFormField(
              onChanged: (value) => filterComments(value),
              decoration: InputDecoration(
                hintText: 'Search Name / Email / Comment',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: ColorChoice.gradient1),
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Expanded(
              flex: 18,
              child: isCommentsLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: ColorChoice.gradient1,
                      ),
                    )
                  : filteredCommentsList.isEmpty
                      ? Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/ohno.gif', width: width*0.4,),
                              SizedBox(
                                width: width * 0.1,
                              ),
                              Expanded(
                                child: Text(
                                  'No comments found!',
                                  style: AppConstants.textStyle(
                                      fontSize: AppConstants.fontExtraBig,
                                      fontWeight: AppConstants.fontWeightBold),
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListView.separated(
                          itemCount: filteredCommentsList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: height * 0.03,
                              ),
                              child: CommentsWidget(
                                id: filteredCommentsList[index].id,
                                name: filteredCommentsList[index].name,
                                email: filteredCommentsList[index].email,
                                body: filteredCommentsList[index].body,
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 1,
                                    color: ColorChoice.grey,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
            )
          ],
        ),
      ),
    );
  }
}
