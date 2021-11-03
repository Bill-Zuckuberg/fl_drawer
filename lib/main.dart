import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drawer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NavigatorDrawerExambple(),
    );
  }
}

class NavigatorDrawerExambple extends StatelessWidget {
  const NavigatorDrawerExambple({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const drawerHeader = UserAccountsDrawerHeader(
      accountName: Text('User name'),
      accountEmail: Text('User.name@example.com'),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        child: FlutterLogo(
          size: 42,
        ),
      ),
      otherAccountsPictures: [
        CircleAvatar(
          backgroundColor: Colors.yellow,
          child: Text('A'),
        ),
        CircleAvatar(
          backgroundColor: Colors.red,
          child: Text('B'),
        )
      ],
    );

    final drawerIrems = ListView(
      children: [
        drawerHeader,
        ListTile(
          title: const Text('Tap to push page 1'),
          onTap: () => Navigator.of(context).push(_NewPage(1)),
        ),
        ListTile(
          title: const Text('Tap to push page 2'),
          onTap: () => Navigator.of(context).push(_NewPage(2)),
        ),
        ListTile(
          title: const Text('other drawer item'),
          onTap: () {},
        )
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Example'),
        backgroundColor: Colors.amber,
      ),
      body: const Center(
        child: Text('Swip or click upper-left icon to see drawer'),
      ),
      drawer: drawerIrems,
    );
  }
}

class _NewPage extends MaterialPageRoute<void> {
  _NewPage(int id)
      : super(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Page $id'),
            ),
            body: Center(
              child: Text('Page $id'),
            ),
          );
        });
}
