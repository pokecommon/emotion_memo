import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => MyHomePage(),
    ),
    GoRoute(
      path: '/details',
      builder: (context, state) => const DetailsScreen(),
    ),
  ],
);

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('memoアプリ'),
      ),
      body: const Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrivateContainer(scene: 'プライベート'),
            ],
          ),
        ),
      ),
    );
  }
}

class PrivateContainer extends StatelessWidget {
  const PrivateContainer({super.key, required this.scene});

  final String scene;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 300,
      color: Colors.yellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(scene),
          ElevatedButton(
            onPressed: () => context.push('/details'),
            child: Text('good'),
            style: ElevatedButton.styleFrom(
              fixedSize: Size.fromHeight(70),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text('memo'),
                ),
              );
            },
            child: Text('ダイアログ'),
          ),
        ],
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('詳細画面')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.pop('/'),
          child: const Text('ホーム画面へ戻る'),
        ),
      ),
    );
  }
}
