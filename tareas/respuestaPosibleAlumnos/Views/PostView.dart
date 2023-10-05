import '../Controllers/PostController.dart';

class PostView {
  void printFindByPost(PostController postController, int id) async {
    try {
      final post = await postController.findPostById(id);
      print('Post Title: ${post.getTitle}');
      print('--------------------------');
      print('Post Body: ${post.getBody}');
    } catch (e) {
      print(e);
    }
  }

  void printAllPost(PostController postController) async {
    try {
      final listPosts = await postController.allPost();
      print(listPosts);
      for (var post in listPosts) {
        print('**************************');
        print('--------------------------');
        print('Post Title: ${post.getTitle}');
        print('--------------------------');
        print('Post Body: ${post.getBody}');
      }
    } catch (e) {
      print(e);
    }
  }
}
