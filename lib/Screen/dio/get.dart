import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GetDio extends StatefulWidget {
  const GetDio({super.key});

  @override
  State<GetDio> createState() => _GetDioState();
}

class _GetDioState extends State<GetDio> {
  @override
  void initState() {
    super.initState();
    getHttp();
    getoneuser("1");
  }

  final dio = Dio();

  var data = [];
  // var users = [];
  Map user = {};
  List randomjoke = [];
  TextEditingController text = TextEditingController();
  getHttp() async {
    await dio.get('https://api.publicapis.org/entries').then((value) {
      setState(() {
        data = value.data['entries'];
      });
    }).catchError((onError) {
      print(onError);
    });
    // print(response.data['entries']);

    // return response;
  }

  getjoke() async {
    final response =
        await dio.get('https://official-joke-api.appspot.com/random_ten');

    print(response.data);
    setState(() {
      randomjoke = response.data;
    });
    // return response;
  }
  // getuser() async {
  // final response = await dio.get('https://reqres.in/api/users');

  // // print(response.data['data']);
  // setState(() {
  //   users = response.data['data'];
  // });
  // // return response;
  // }

  getoneuser(String id) async {
    final response = await dio.get('https://reqres.in/api/users/$id');
    print(response.data);
    setState(() {
      user = response.data['data'];
    });
    // return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Operation"),
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 4,
            width: MediaQuery.sizeOf(context).width,
            child: (data.isEmpty)
                ? const Center(child: Text("Loading"))
                : ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) => ListTile(
                          title: Text("${data[index]['API']}"),
                        )
                    //,
                    ),
          ),
          SizedBox(
              height: MediaQuery.sizeOf(context).height / 4,
              width: MediaQuery.sizeOf(context).width,
              child: (randomjoke.isEmpty)
                  ? const Center(child: Text("Click Button to get Jokes"))
                  : ListView.builder(
                      itemCount: randomjoke.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text("${randomjoke[index]['setup']}"),
                        subtitle: Text("${randomjoke[index]['punchline']}"),
                      ),
                    )),
          Center(
            child: ElevatedButton(
              child: Text((randomjoke.isEmpty)
                  ? "Click To Get Joke"
                  : "Next Ten Jokes"),
              onPressed: () {
                getjoke();
                // getuser();
              },
            ),
          ),
          SizedBox(
              height: MediaQuery.sizeOf(context).height / 4,
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                children: [
                  (user.isEmpty)
                      ? const Center(child: Text("Loading"))
                      : ListTile(
                          leading: Image.network(user["avatar"]),
                          title: Text(
                              "${user["first_name"]} ${user["last_name"]}"),
                          subtitle: Text("${user['email']}"),
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 1; i <= 5; i++) ...[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.blue),
                                onPressed: () {
                                  getoneuser("$i");
                                },
                                child: Text(
                                  "$i",
                                  style: const TextStyle(color: Colors.white),
                                )),
                          ),
                        ),
                      ]
                    ],
                  )
                ],
              )
              //,

              ),
        ]),
      ),
    );
  }
}
