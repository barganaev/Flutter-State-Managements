import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:store_redux_app/src/i_post.dart';
import 'package:store_redux_app/src/redux/posts/actions.dart';
import 'package:store_redux_app/src/redux/store.dart';
import 'package:store_redux_app/src/screens/item_detail_screen.dart';

void main() async {
  await Redux.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StoreProvider<AppState>(
        store: Redux.store!,
        child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _onFetchPostsPressed() {
    Redux.store?.dispatch(fetchPostsAction);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            child: Text("Fetch Posts"),
            onPressed: _onFetchPostsPressed,
          ),
          StoreConnector<AppState, bool>(
            distinct: true,
            converter: (store) => store.state.postsState.isLoading,
            builder: (context, isLoading) {
              if (isLoading) {
                return CircularProgressIndicator();
              } else {
                return SizedBox.shrink();
              }
            },
          ),
          StoreConnector<AppState, bool>(
            distinct: true,
            converter: (store) => store.state.postsState.isError,
            builder: (context, isError) {
              if (isError) {
                return Text("Failed to get posts");
              } else {
                return SizedBox.shrink();
              }
            },
          ),
          Expanded(
            child: StoreConnector<AppState, List<ProductModel>>(
              distinct: true,
              converter: (store) => store.state.postsState.posts,
              builder: (context, posts) {
                return ListView(
                  children: _buildPosts(posts),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPosts(List<ProductModel> posts) {
    return posts
        .map(
          (post) => InkWell(
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) => ItemDetailScreen(items: post,)
                )
              );
            },
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(post.image!),
                ),
                title: Text(post.title!),
                subtitle: Text(post.description!),
                key: Key(post.id.toString()),
              ),
            ),
          ),
        )
        .toList();
  }
}