import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'Service/Apiclientservice.dart';

class DeleteRetro extends StatefulWidget {
  const DeleteRetro({super.key});

  @override
  State<DeleteRetro> createState() => _DeleteRetroState();
}

class _DeleteRetroState extends State<DeleteRetro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delete Operation"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => _PostBody(context),
                );
              },
              child: const Text("Delete")),
        )
      ]),
    );
  }
}

FutureBuilder _PostBody(BuildContext context) {
  final client =
      JsplaceClient(Dio(BaseOptions(contentType: "application/json")));
  return FutureBuilder(
    future: client.deletePost("2"),
    // client.setPosts(Post(body: data["name"], title: data['description'])),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        print(snapshot);
        final post = snapshot.data;
        print(post);
        return AlertDialog(
          title: const Text("Response"),
          actions: [
            // Text(
            //   "Title:- ${post['title']}",
            //   style: const TextStyle(fontSize: 30),
            // ),
            // Text(
            //   'Body:- ${post['body']}',
            //   style: const TextStyle(fontSize: 30),
            // ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Okay"))
          ],
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}
