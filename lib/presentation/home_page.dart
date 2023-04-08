import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:won_api/infractructure/students_porvider.dart';
import 'package:won_api/presentation/post_stu.dart';
import 'package:won_api/widget/widget_for_all.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.delayed(const Duration(milliseconds: 300), () async {
        await ref.read(studentsProvider.notifier).getStudentsData();
      });
      return null;
    }, []);
    final data = ref.watch(studentsProvider.select((value) => value.listStu));
    final loading =
        ref.watch(studentsProvider.select((value) => value.loading));
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext contex) {
                return AlertDialog(
                    //title: Text('Create'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10), // set a larger border radius
                    ),
                    contentPadding: EdgeInsets.all(10),
                    content: PostStu());
              });
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: textFieldColor().withOpacity(0.8),
        centerTitle: true,
        title: const Text('Student List'),
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final students = data[index];
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            height: 100,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: textFieldColor().withOpacity(0.8),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.person,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                      20.widthBox,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Name:  ${students.name}')
                                                  .text
                                                  .bold
                                                  .size(20)
                                                  .white
                                                  .make(),
                                              5.heightBox,
                                              Text(
                                                'Email:  ${students.email}',
                                              ).text.size(18).white.make(),
                                              5.heightBox,
                                              Text('Phone: ${students.phone.toString()}')
                                                  .text
                                                  .white
                                                  .make(),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      ref
                                          .read(studentsProvider.notifier)
                                          .deletStu(id: students.id);
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    )),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
    );
  }
}
