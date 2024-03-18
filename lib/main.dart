import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/api/post_services.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<Map<String, dynamic>> posts = [];
  final ScrollController _scrollController = ScrollController();
  int page = 1;
  bool hasMore = false;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    loadPosts(page);
    _scrollController.addListener(_loadMoreData);
  }

  loadPosts(size) async {
    setState(() {
      isLoading = true;
    });
    var data = await PostSerivce().getAllPosts(size);
    if (data.isNotEmpty) {
      setState(() {
        posts = [...posts, ...data];
        isLoading = false;
        hasMore = true;
      });
    }
  }

  void _loadMoreData() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // User has reached the end of the list
      // Load more data or trigger pagination in flutter

      setState(() {
        page = page + 1;
      });
      loadPosts(page + 1);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No data found..!'),
    );

    if (isLoading) {
      content = const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (posts.isNotEmpty) {
      content = ListView.builder(
        controller: _scrollController,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text('${index + 1}'),
            title: Text(
              posts[index]['title'].toString(),
            ),
            subtitle: Text(
              posts[index]['body'].toString(),
            ),
          );
        },
        itemCount: posts.length,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Home'),
      ),
      body: content,
    );
  }
}
