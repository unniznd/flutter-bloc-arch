import 'package:flutter/material.dart';
import 'package:tezbooks/home/bloc/bloc_blog.dart';
import 'package:tezbooks/home/model/blogs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.fetchAllBlogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test App"),
      ),
      body: StreamBuilder(
        stream: bloc.allBlogs,
        builder: (context, AsyncSnapshot<BlogModel> snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              shrinkWrap: false,
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data!.count,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data!.blogs[index].title),
                  subtitle: Text(snapshot.data!.blogs[index].body),
                  trailing: Text(snapshot.data!.blogs[index].date),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 1,
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
