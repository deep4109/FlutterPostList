
import 'package:dio/dio.dart';
import 'package:mvvm_posts_list/data/dto/PostModel.dart';
import 'base_api_services.dart';
import 'dio_client.dart';

class ApiService extends BaseApiServices {
  final DioClient dioClient;

  ApiService({required this.dioClient});

  @override
  Future getPostApiResponse(String url) async {
    try {
      final Response response = await dioClient.get(url);
      final List t = response.data;
      final List<PostModel> postList =
      t.map((item) => PostModel.fromJson(item)).toList();
      return postList;
      PostModel dto = PostModel.fromJson(response.data);  // json to dart using dart plugin
      return dto;
    } catch (e) {
      rethrow;
    }
  }

}
