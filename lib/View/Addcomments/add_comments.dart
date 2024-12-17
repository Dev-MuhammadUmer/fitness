import 'package:fitness/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentsScreen extends StatefulWidget {
  final String category;

  const CommentsScreen({super.key, required this.category});

  @override
  CommentsScreenState createState() => CommentsScreenState();
}

class CommentsScreenState extends State<CommentsScreen> {
  final TextEditingController _commentController = TextEditingController();
  final List<Comment> _comments = [
    Comment(
        username: "John Doe",
        avatarUrl: "https://via.placeholder.com/150",
        comment: "This is a comment!"),
    Comment(
        username: "Jane Smith",
        avatarUrl: "https://via.placeholder.com/150",
        comment: "Great post!"),
  ];

  //-----------Add Comment Function----------------//
  void _addComment(String comment) {
    if (comment.isNotEmpty) {
      setState(() {
        _comments.add(
          Comment(
            username: "User",
            avatarUrl: "https://via.placeholder.com/150",
            comment: comment,
          ),
        );
        _commentController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //-----------Background Color----------------//
      backgroundColor: AppColors.blackColor,

      appBar: AppBar(
        title: Text(
          'Comments',
          style: TextStyle(
            fontSize: 18.sp,
            color: AppColors.whiteColor,
          ),
        ),
        //-----------App Bar Background Color----------------//
        backgroundColor: AppColors.blackColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: _comments.isEmpty
                ? const Center(
                    child: Text(
                      'No comments yet.',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: _comments.length,
                    itemBuilder: (context, index) {
                      final comment = _comments[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          //-----------Comment Background Color----------------//
                          color: AppColors.darkgreyColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(comment.avatarUrl),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    comment.username,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    comment.comment,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: AppColors.commentColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    style: const TextStyle(
                      color: AppColors.whiteColor,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Add a comment',
                      labelStyle:
                          const TextStyle(color: AppColors.commentColor),
                      filled: true,
                      fillColor: AppColors.darkgreyColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                            color: AppColors.redColor, width: 2.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: AppColors.redColor),
                  onPressed: () {
                    if (_commentController.text.isNotEmpty) {
                      _addComment(_commentController.text);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Comment {
  final String username;
  final String avatarUrl;
  final String comment;

  Comment(
      {required this.username, required this.avatarUrl, required this.comment});
}
