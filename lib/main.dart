import 'package:clean_api/clean_api.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:won_api/presentation/home_page.dart';
import 'package:won_api/presentation/post_stu.dart';

void main() {
  CleanApi.instance.setup(
      baseUrl: 'https://literate-marmoset-48.hasura.app/api/rest/',
      showLogs: true);
  CleanApi.instance.setHeader({
    "x-hasura-admin-secret":
        "Z1jYdtNzaKLY951W5wc8QgSLLEC2RgtpC7FSFsggo1jvB0l5Kt9H5JD1KX0ol0w7"
  });
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
