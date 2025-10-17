import 'package:crud/controller/user_controller.dart';
import 'package:crud/model/user_model.dart';
import 'package:crud/view/user_details_screen.dart';
import 'package:flutter/material.dart';

class NestedJsonPersing extends StatefulWidget {
  const NestedJsonPersing({super.key});

  @override
  State<NestedJsonPersing> createState() => _NestedJsonPersingState();
}

class _NestedJsonPersingState extends State<NestedJsonPersing> {
  late Future<List<UserModel>> _userFuture;

  UserController userController = UserController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userFuture = userController.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
          PopupMenuButton<MenuItemButton>(
            borderRadius: BorderRadius.circular(30),
            onSelected: (value) {},
            itemBuilder: (context) => const [
              PopupMenuItem(child: Text('New group')),
              PopupMenuItem(child: Text('New broadcast')),
              PopupMenuItem(child: Text('Linked devices')),
              PopupMenuItem(child: Text('Starred')),
              PopupMenuItem(child: Text('Settings')),
            ],
          ),
        ],
        title: Text(
          'WhatsApp',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
        ),
      ),

      body: FutureBuilder(
        future: _userFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final users = snapshot.data!;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (Context, index) {
              final user = users[index];
              return InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserDetailsScreen(
                      userName: user.name,
                      id: user.id.toString(),
                    ),
                  ),
                ),
                child: Card(
                  child: ListTile(
                    leading: CircleAvatar(),
                    title: Text(user.name),
                    subtitle: Text(user.email),
                  ),
                ),
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        elevation: 2,
        backgroundColor: Colors.green,
        onPressed: () {},
        child: Icon(Icons.add_comment, color: Colors.white),
      ),
    );
  }
}
