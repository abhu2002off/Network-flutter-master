import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'Service/Apiclientservice.dart';

class RetroGet extends StatefulWidget {
  const RetroGet({super.key});

  @override
  State<RetroGet> createState() => _RetroGetState();
}

class _RetroGetState extends State<RetroGet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Get Retrofit")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.sizeOf(context).width,
              child: _buildBody(context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.sizeOf(context).width,
              child: _PostBody(context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.sizeOf(context).width,
              child: _UserBody(context),
            ),
          ],
        ),
      ),
    );
  }
}

FutureBuilder<List<Jokes>> _buildBody(BuildContext context) {
  final client = RestClient(Dio(BaseOptions(contentType: "application/json")));
  return FutureBuilder<List<Jokes>>(
    future: client.getTasks(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        final List<Jokes>? jokess = snapshot.data;
        // print(jokes!.length);

        return ListView.separated(
          separatorBuilder: (context, index) => Container(
            height: 1,
            color: Colors.grey.shade400,
          ),
          itemCount: jokess!.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("${jokess[index].setup}"),
              subtitle: Text("${jokess[index].punchline}"),
            );
          },
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}

FutureBuilder<List<Post>> _PostBody(BuildContext context) {
  final client =
      JsplaceClient(Dio(BaseOptions(contentType: "application/json")));
  return FutureBuilder<List<Post>>(
    future: client.getPosts(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        final List<Post>? post = snapshot.data;
        // print(jokes!.length);

        return ListView.separated(
          separatorBuilder: (context, index) => Container(
            height: 1,
            color: Colors.grey.shade400,
          ),
          itemCount: post!.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("${post[index].title}"),
              subtitle: Text("${post[index].body}"),
            );
          },
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}

FutureBuilder<UserListModel> _UserBody(BuildContext context) {
  final client = Client(Dio(BaseOptions(contentType: "application/json")));
  return FutureBuilder<UserListModel>(
    future: client.getUser(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        // print(snapshot.data);
        final UserListModel user = snapshot.data!;
        List<User> userlist = user.users!;
        return ListView.builder(
            itemCount: userlist.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(userlist[index].firstName!),
                  subtitle: Text('${userlist[index].age}'),
                  leading: Column(children: [
                    Image.network(
                      userlist[index].image!,
                      width: 50,
                      height: 50,
                    )
                  ]),
                ),
              );
            });
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}

FutureBuilder<Photo> _PhotoBody(BuildContext context) {
  final client = PhotoClient(Dio(BaseOptions(contentType: "application/json")));
  return FutureBuilder<Photo>(
    future: client.getPhoto("1"),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        // print(snapshot.data);
        final post = snapshot.data!.data;
        print(post!.avatar);
        // print(jokes!.length);
        // return Container();

        return ListTile(
          leading: Image.network(post.avatar!),
          title: Text("${post.firstName} ${post.lastName}"),
          subtitle: Text("${post.email}"),
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}
