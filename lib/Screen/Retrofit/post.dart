import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'Service/Apiclientservice.dart';

class PostRetrofit extends StatefulWidget {
  const PostRetrofit({super.key});

  @override
  State<PostRetrofit> createState() => _PostRetrofitState();
}

class _PostRetrofitState extends State<PostRetrofit> {
  TextEditingController name = TextEditingController();
  TextEditingController moblie = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var response;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Post in Retrofit")),
      body: Form(
        key: _formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
            // keyboardType: TextInputType.number,
            // maxLength: 10,
            // validator: (value) {
            //   String pattern = r'^(?:[+0]9)?[0-9]{10}$';
            //   RegExp regex = RegExp(pattern);
            //   if (!regex.hasMatch(value!)) {
            //     return 'Enter Valid Phone Number';
            //   } else {
            //     return null;
            //   }
            // },
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
          // _PostBody(context, {"name": "Omkq4", "moblie": moblie}),
          ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  showDialog(
                    context: context,
                    builder: (context) => _PostBody(context,
                        {"name": name.text, "description": moblie.text}),
                  );
                  // _PostBody(context, {"name": name, "moblie": moblie});
                }
              },
              child: const Text("Submit"))
        ]),
      ),
    );
  }
}

FutureBuilder _PostBody(BuildContext context, data) {
  final client =
      JsplaceClient(Dio(BaseOptions(contentType: "application/json")));
  return FutureBuilder(
    future:
        client.setPosts(Post(body: data["name"], title: data['description'])),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final post = snapshot.data;
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
