import 'package:clean_api/clean_api.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:won_api/presentation/home_page.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
