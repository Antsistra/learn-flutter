import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var faker = Faker();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: WhatsAppAppBar(),
          body: TabBarView(
            children: [
              Center(child: Text('Camera Screen')),
              ChatsScreen(faker: faker),
              ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    color: Colors.blue,
                  )
                  Container(
                    height: 40,
                    width: 40,
                    color: Colors.green,
                  )
                  Container(
                    height: 40,
                    width: 40,
                    color: Colors.red,
                  )
                ],
              ),
              Center(child: Text('Calls Screen')),
            ],
          ),
        ),
      ),
    );
  }
}

class WhatsAppAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + kTextTabBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF075E54),
      title: Text('WhatsApp',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: () {
            // Search action
          },
        ),
        IconButton(
          icon: Icon(Icons.more_vert, color: Colors.white),
          onPressed: () {
            // More options action
          },
        ),
      ],
      bottom: TabBar(
        indicatorColor: Colors.white,
        labelColor: Colors.white,
        tabs: [
          Tab(
              icon: Icon(
            Icons.camera_alt,
          )),
          Tab(
            text: "CHATS",
          ),
          Tab(text: 'STATUS'),
          Tab(text: 'CALLS'),
        ],
      ),
    );
  }
}

class StatusScreen extends StatelessWidget {
  final Faker faker;
  StatusScreen({required this.faker});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return StatusItem(
          imgUrl: "https://picsum.photos/id/$index/200/300",
        );
      },
    );
  }
}

class ChatsScreen extends StatelessWidget {
  final Faker faker;

  ChatsScreen({required this.faker});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return MessageItem(
          imgUrl: "https://picsum.photos/id/$index/200/300",
          name: faker.person.name(),
          subtitle: faker.lorem.sentence(),
        );
      },
    );
  }
}

class StatusItem extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String subtitle;

  StatusItem({this.imgUrl = "", this.name = "", this.subtitle = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.red,
    );
  }
}

class MessageItem extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String subtitle;

  MessageItem({this.imgUrl = "", this.name = "", this.subtitle = ""});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text(subtitle),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imgUrl),
      ),
      trailing: const Text("10:00"),
    );
  }
}
