import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'Service/Apiclientservice.dart';

class PutRetro extends StatefulWidget {
  const PutRetro({super.key});

  @override
  State<PutRetro> createState() => _PutRetroState();
}

class _PutRetroState extends State<PutRetro> {
  TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController moblie = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Put Operation")),
      body: Form(
        key: _formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextFormField(
            controller: id,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "id",
            ),
            keyboardType: TextInputType.number,
            maxLength: 2,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: name,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "title",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: moblie,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Description"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: ElevatedButton(
              child: Text("Put"),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  showDialog(
                    context: context,
                    builder: (context) => _PostBody(
                        context,
                        {"name": name.text, "description": moblie.text},
                        id.text),
                  );
                  // _PostBody(context, {"name": name, "moblie": moblie});
                }
              },
            ),
          )
        ]),
      ),
    );
  }
}

FutureBuilder _PostBody(BuildContext context, data, id) {
  final client =
      JsplaceClient(Dio(BaseOptions(contentType: "application/json")));
  return FutureBuilder(
    future: client.putPost(
        id, Post(body: data["name"], title: data['description'])),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final post = snapshot.data;
        print(post);
        // print(jokes!.length);
        print(post);
        return AlertDialog(
          title: Text("Response ${post['id']}"),
          actions: [
            Text(
              "Title:- ${post['title']}",
              style: const TextStyle(fontSize: 30),
            ),
            Text(
              'Body:- ${post['body']}',
              style: const TextStyle(fontSize: 30),
            ),
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
