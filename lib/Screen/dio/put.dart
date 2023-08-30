import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PutDio extends StatefulWidget {
  const PutDio({super.key});

  @override
  State<PutDio> createState() => _PutDioState();
}

class _PutDioState extends State<PutDio> {
  TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController moblie = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final dio = Dio();

  putrequest(String id, Map data) async {
    var res = await dio.put("https://jsonplaceholder.typicode.com/posts/$id",
        data: data);
    return (res.data);
  }

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
                  var res = await putrequest(
                      id.text, {"Name": name.text, "Moblie": moblie.text});
                  // ignore: use_build_context_synchronously
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Response"),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Okay"))
                      ],
                    ),
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
