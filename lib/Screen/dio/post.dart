import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class PostDio extends StatefulWidget {
  const PostDio({super.key});

  @override
  State<PostDio> createState() => _PostDioState();
}

class _PostDioState extends State<PostDio> {
  final dio = Dio();
  Map? data = {};
  postrequest(Map data1) async {
    var res = await dio.post("https://jsonplaceholder.typicode.com/posts",
        data: data1);
    return (res.data);
  }

  TextEditingController name = TextEditingController();
  TextEditingController moblie = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post with Dio"),
      ),
      body: Form(
        key: _formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextFormField(
            controller: name,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Name",
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
                border: OutlineInputBorder(), labelText: "number"),
            keyboardType: TextInputType.number,
            maxLength: 10,
            validator: (value) {
              String pattern = r'^(?:[+0]9)?[0-9]{10}$';
              RegExp regex = RegExp(pattern);
              if (!regex.hasMatch(value!)) {
                return 'Enter Valid Phone Number';
              } else {
                return null;
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  var data = await postrequest(
                      {"Name": name.text, "Moblie": moblie.text});

                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text("$data"),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Okay"))
                            ],
                          ));
                  print(data);
                }
              },
              child: const Text("Submit"))
        ]),
      ),
    );
  }
}
