import 'Controllers/PostController.dart';
import 'Views/PostView.dart';

main() async {
  final view = PostView();
  view.printFindByPost(PostController(), 1);
  view.printAllPost(PostController());
}
