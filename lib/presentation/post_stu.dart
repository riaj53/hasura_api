import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:won_api/domain/post_student_model.dart';
import 'package:won_api/infractructure/students_porvider.dart';

class PostStu extends HookConsumerWidget {
  const PostStu({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final nameControlar = useTextEditingController();
    final emailControlar = useTextEditingController();
    final phoneControlar = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('post'),
      ),
      body: Column(
        children: [
          TextField(
            controller: nameControlar,
            decoration: InputDecoration(hintText: 'Name'),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            controller: emailControlar,
            decoration: InputDecoration(hintText: 'Email'),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            controller: phoneControlar,
            decoration: InputDecoration(hintText: 'Phone'),
          ),
          SizedBox(
            height: 5,
          ),
          ElevatedButton(
              onPressed: () {
                final postModel = PostStudentModel(
                    name: nameControlar.text,
                    email: emailControlar.text,
                    phone: int.parse(phoneControlar.text));
                ref
                    .read(studentsProvider.notifier)
                    .postStudent(postModel: postModel);
              },
              child: Text('Click'))
        ],
      ),
    );
  }
}
