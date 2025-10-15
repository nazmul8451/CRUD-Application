import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../controller/UserPostController.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<UserPostController>(context, listen: false).fetchPost();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Post Screen')),
        backgroundColor: Colors.white,
        body: Consumer<UserPostController>(
          builder: (context, controller, child) {
            if (controller.post.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount: controller.post.length,
              itemBuilder: (context, index) {
                var userPost = controller.post[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(child: Text(userPost.id.toString())),
                    title: Text(
                      userPost.title,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    subtitle: Text(userPost.body),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
