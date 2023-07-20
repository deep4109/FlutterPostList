import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_posts_list/constant/string_constant.dart';
import 'package:mvvm_posts_list/data/dto/PostModel.dart';
import '../data/network/api_service.dart';
import '../data/network/dio_client.dart';
import '../data/repository/home_repository.dart';
import '../domain/repository/home_repository.dart';


final postRepositoryProvider = Provider<HomeRepository>((ref) {
  //final apiService = ref.watch(apiServiceProvider);
  return HomeRepositoryImp(
      ApiService(dioClient: DioClient(Dio()))); // declared elsewhere
});

final postFutureProvider =
    FutureProvider.autoDispose<List<PostModel>>((ref) {
      final postRepository = ref.watch(postRepositoryProvider);
  return postRepository.getPosts(AppString.posts);
});


