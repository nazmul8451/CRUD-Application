import 'package:flutter/material.dart';

class UserDetailsScreen extends StatefulWidget {
   UserDetailsScreen({super.key,required this.userName});

  String userName;

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: Expanded(
          child: Row(children: [
            BackButton(),
          ],),
        ),
        title: Text('${widget.userName}',style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.video_camera_front)),
          IconButton(onPressed: (){}, icon: Icon(Icons.call)),

          PopupMenuButton<MenuItemButton>(
            borderRadius: BorderRadius.circular(30),
            onSelected: (value) {},
            itemBuilder: (context) => const [
              PopupMenuItem(child: Text('View contact')),
              PopupMenuItem(child: Text('Search')),
              PopupMenuItem(child: Text('New group')),
              PopupMenuItem(child: Text('Media,links,and docs')),
              PopupMenuItem(child: Text('Desappearing messages')),
              PopupMenuItem(child: Text('Chat theme')),
            ],
          ),
        ],
      ),
    );
  }
}
