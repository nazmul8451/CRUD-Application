import 'package:crud/Utils/urls.dart';
import 'package:crud/controller/user_controller.dart';
import 'package:flutter/material.dart';

class UserDetailsScreen extends StatefulWidget {
  UserDetailsScreen({super.key, required this.userName, required this.id});

  String userName;
  String id;

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Expanded(child: Row(children: [BackButton()])),
        title: Text(
          '${widget.userName}',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.video_camera_front)),
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),

          PopupMenuButton<MenuItemButton>(
            borderRadius: BorderRadius.circular(30),
            onSelected: (value) {},
            itemBuilder: (context) =>
            const [
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

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: FutureBuilder(
          future: UserController.getUserDetails(widget.id),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(),);
            }else{
              if(snapshot.hasError){
                return Center(child: Text('Something went wrong'),);
              }
              final user = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey[300],
                    ),
                    child: Icon(Icons.photo),
                  ),
                  SizedBox(height: 10,),
                  Text('Name: ${user.name}',style: TextStyle(fontSize: 23,color: Colors.blue,fontWeight: FontWeight.w900),),
                  Text('Email: ${user.email}',style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w900),),
                  Text('City: ${user.address.city}',style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w900),),
                  Text('Street: ${user.address.street}',style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w900),),
                  Text('zipcode: ${user.address.zipcode}',style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w900),),

                ],
              );
            }
          },
        ),
      ),
    );
  }
}
