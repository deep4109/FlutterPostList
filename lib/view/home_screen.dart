
import 'package:flutter/material.dart';
import 'package:mvvm_posts_list/view/post_screen.dart';

import '../constant/string_constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.textAppName),
        centerTitle: true,
      ),
      body: PostsListView()
      ,
    );
  }
}