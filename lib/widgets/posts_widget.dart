import 'package:flutter/material.dart';
import 'package:tribehire_assessment/utils/colors.dart';
import 'package:tribehire_assessment/utils/contants.dart';

class PostsWidget extends StatefulWidget {
  final int userId;
  final String title;
  final String body;
  final bool isPostScreen;

  const PostsWidget({
    Key? key,
    required this.userId,
    required this.title,
    required this.body,
    required this.isPostScreen,
  }) : super(key: key);

  @override
  State<PostsWidget> createState() => _PostsWidgetState();
}

class _PostsWidgetState extends State<PostsWidget> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          height: height * 0.08,
          width: width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    ColorChoice.gradient1,
                    ColorChoice.gradient2,
                  ]),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.01),
            child: Row(
              children: [
                SizedBox(
                  width: width * 0.03,
                ),
                CircleAvatar(
                  radius: height * 0.03,
                  backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/150?img=${widget.userId}'),
                ),
                SizedBox(
                  width: width * 0.05,
                ),
                Expanded(
                  child: Text("User ID:    ${widget.userId.toString()}",
                      style: AppConstants.textStyle(
                        color: ColorChoice.white,
                        fontWeight: AppConstants.fontWeightBold,
                        // fontSize: AppConstants.fontBig,
                      )),
                ),
                widget.isPostScreen
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('View Comments >',
                              style: AppConstants.textStyle(
                                color: ColorChoice.white,
                                fontWeight: AppConstants.fontWeightBold,
                              )),
                          SizedBox(
                            width: width * 0.02,
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
          ),
        ),
        Container(
          width: width,
          decoration: BoxDecoration(
            color: ColorChoice.white,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            border: Border.all(
              width: 1,
              color: ColorChoice.gradient1,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.04, vertical: height * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: AppConstants.textStyle(
                    fontSize: AppConstants.fontBig,
                    fontWeight: AppConstants.fontWeightBold,
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  widget.body,
                  style: AppConstants.textStyle(
                    color: ColorChoice.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
