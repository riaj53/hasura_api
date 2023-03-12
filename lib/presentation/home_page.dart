import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:won_api/infractructure/students_porvider.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.delayed(const Duration(milliseconds: 500), () async {
        await ref.read(studentsProvider.notifier).getStudentsData();
      });
      return null;
    }, []);
    final data = ref.watch(studentsProvider.select((value) => value.listStu));
    return Scaffold(
      appBar: AppBar(
        title: Text('GetData'),
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Center(
                child: Text(
              data[index].name,
              style: TextStyle(color: Colors.black, fontSize: 50),
            ));
          }),
    );
  }
}
