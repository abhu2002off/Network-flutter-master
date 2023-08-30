import 'package:flutter/material.dart';
import 'package:network/Screen/dio/get.dart';
import 'package:network/Screen/dio/post.dart';
import 'package:network/Screen/dio/put.dart';

import 'dio/delete.dart';

class DioNetwork extends StatefulWidget {
  const DioNetwork({super.key});

  @override
  State<DioNetwork> createState() => _DioNetworkState();
}

class _DioNetworkState extends State<DioNetwork> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Network with Dio"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GetDio(),
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
                          builder: (context) => const PostDio(),
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
                          builder: (context) => const DeleteDio(),
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
                          builder: (context) => const PutDio(),
                        ));
                  },
                  child: const Text("Put Operation")),
            ),
          ],
        ));
  }
}
