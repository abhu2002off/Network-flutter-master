import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DeleteDio extends StatefulWidget {
  const DeleteDio({super.key});

  @override
  State<DeleteDio> createState() => _DeleteDioState();
}

class _DeleteDioState extends State<DeleteDio> {
  final dio = Dio();
  // Map? data = {};
  Deleterequest(String id) async {
    var res =
        await dio.delete("https://jsonplaceholder.typicode.com/posts/${id}");
    return (res.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delete Operation"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                var res = await Deleterequest('1');
                // ignore: use_build_context_synchronously
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Data Deleted"),
                    actions: [
                      // Text("$res"),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Okay"))
                    ],
                  ),
                );
              },
              child: Text("Delete with Dio"))
        ],
      ),
    );
  }
}
