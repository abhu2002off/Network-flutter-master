import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
import 'package:network/Screen/retrofit.dart';
import 'dio.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Network"),
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
                          builder: (context) => const DioNetwork(),
                        ));
                  },
                  child: const Text("Dio"))),
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RetrofitPage(),
                        ));
                  },
                  child: const Text("Retrofit")))
        ],
      ),
    );
  }
}
