import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_posts_list/data/dto/PostModel.dart';

import '../view_model/posts_viewmodel.dart';

class PostsListView extends ConsumerStatefulWidget {
  const PostsListView({Key? key}) : super(key: key);

  @override
  ConsumerState<PostsListView> createState() => _PopularListViewState();
}

class _PopularListViewState extends ConsumerState<PostsListView>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
    } else if (state == AppLifecycleState.paused) {
    } else if (state == AppLifecycleState.resumed) {
    } else if (state == AppLifecycleState.detached) {}
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final AsyncValue<List<PostModel>> data = ref.watch(postFutureProvider);
    return data.when(
        data: (data) => _postList(data),
        error: (err, stack) => SizedBox(
              height: height,
              child: const Center(child: CircularProgressIndicator()),
            ),
        loading: () => SizedBox(
              height: height,
              child: const Center(child: CircularProgressIndicator()),
            ));
  }

  Future<void> _handleRefresh() async {
    await ref.refresh(postFutureProvider);
  }

  Widget _postList(List<PostModel> list) {
    return RefreshIndicator(
      onRefresh:  ()async => ref.refresh(postFutureProvider),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Adjust the radius here
            ),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Adjust the padding here
              title: Text(list[index].title ?? "Title"),
              subtitle: Text(list[index].body ?? "Description"),
              // Add more properties and styling as needed
            ),
          );
        },
      ),
    );
  }
}
