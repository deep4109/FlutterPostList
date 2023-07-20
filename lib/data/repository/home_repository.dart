
import 'package:dio/dio.dart';
import 'package:mvvm_posts_list/data/dto/PostModel.dart';

import '../../domain/repository/home_repository.dart';
import '../network/Util/DioExceptions.dart';
import '../network/api_service.dart';

class HomeRepositoryImp implements HomeRepository {
  final ApiService _apiServices;

  HomeRepositoryImp(this._apiServices);

  @override
  Future<List<PostModel>> getPosts(String url) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(url);
      return response;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }


}
