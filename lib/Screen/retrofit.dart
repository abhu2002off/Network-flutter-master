import 'package:flutter/material.dart';
import 'package:network/Screen/Retrofit/delete.dart';
import 'package:network/Screen/Retrofit/put.dart';

import 'Retrofit/get.dart';
import 'Retrofit/post.dart';

class RetrofitPage extends StatefulWidget {
  const RetrofitPage({super.key});

  @override
  State<RetrofitPage> createState() => _RetrofitPageState();
}

class _RetrofitPageState extends State<RetrofitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Retrofit")),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RetroGet(),
                    ));
              },
              child: const Text("Get Operation")),
        ),
        Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PostRetrofit(),
                    ));
              },
              child: const Text("Post Operation")),
        ),
        Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DeleteRetro(),
                    ));
              },
              child: const Text("Delete Operation")),
        ),
        Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PutRetro(),
                    ));
              },
              child: const Text("Put Operation")),
        ),
      ]),
    );
  }
}
