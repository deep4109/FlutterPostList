import 'package:mvvm_posts_list/data/dto/PostModel.dart';

abstract class HomeRepository{
  Future<List<PostModel>> getPosts(String url);
}