import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';
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
        title: const Text('GetData'),
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final students = data[index];
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 100,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 159, 185, 197),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 40,
                    ),
                    20.widthBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name:  ${students.name}')
                            .text
                            .bold
                            .size(20)
                            .make(),
                        5.heightBox,
                        Text(
                          'Email:  ${students.email}',
                        ).text.size(18).make(),
                        5.heightBox,
                        Text('Phone: ${students.phone.toString()}'),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
