import '../Controllers/CommentController.dart';

class CommentView {
  void printFindByPost(CommentController commentController, int id) async {
    try {
      final commentValue = await commentController.findCommentById(id);
      print('Comment Name: ${commentValue.getName}');
      print('--------------------------');
      print('Comment Email: ${commentValue.getEmail}');
      print('--------------------------');
      print('Comment Body: ${commentValue.getBody}');
    } catch (e) {
      print(e);
    }
  }

  void printAllPost(CommentController commentController) async {
    try {
      final listComments = await commentController.allComments();
      for (var commentItem in listComments) {
      print('Comment Name: ${commentItem.getName}');
      print('--------------------------');
      print('Comment Email: ${commentItem.getEmail}');
      print('--------------------------');
      print('Comment Body: ${commentItem.getBody}');
      }
    } catch (e) {
      print(e);
    }
  }
}