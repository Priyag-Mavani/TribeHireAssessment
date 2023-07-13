import 'package:flutter/material.dart';
import 'package:tribehire_assessment/utils/colors.dart';
import 'package:tribehire_assessment/utils/contants.dart';

class CommentsWidget extends StatefulWidget {
  final int id;
  final String name;
  final String email;
  final String body;
  const CommentsWidget({
    Key? key,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  }) : super(key: key);

  @override
  State<CommentsWidget> createState() => _CommentsWidgetState();
}

class _CommentsWidgetState extends State<CommentsWidget> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://i.pravatar.cc/150?img=${widget.id}'),
              ),
              SizedBox(
                width: width * 0.04,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    overflow: TextOverflow.clip,
                    style: AppConstants.textStyle(
                        fontWeight: AppConstants.fontWeightBold),
                  ),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  Text(
                    widget.email,
                    style: AppConstants.textStyle(
                        fontSize: AppConstants.fontSmall),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Text(
            widget.body,
            style: AppConstants.textStyle(
              color: ColorChoice.black,
            ),
          )
        ],
      ),
    );
  }
}
