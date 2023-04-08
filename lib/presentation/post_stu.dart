import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:won_api/domain/post_student_model.dart';
import 'package:won_api/domain/students_model.dart';
import 'package:won_api/infractructure/students_porvider.dart';
import 'package:won_api/widget/widget_for_all.dart';

class PostStu extends HookConsumerWidget {
  const PostStu({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final idControlar = useTextEditingController();
    final nameControlar = useTextEditingController();
    final emailControlar = useTextEditingController();
    final phoneControlar = useTextEditingController();

    return Container(
      height: 250,
      child: Column(
        children: [
          10.heightBox,
          Text(
            'Add Student',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          10.heightBox,
          TextField(
            controller: nameControlar,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              hintText: 'Name',
              hintStyle: TextStyle(color: Colors.white),
              fillColor: textFieldColor().withOpacity(0.8),
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            controller: emailControlar,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              hintText: 'Email',
              hintStyle: TextStyle(color: Colors.white),
              fillColor: textFieldColor().withOpacity(0.8),
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            controller: phoneControlar,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              hintText: 'Phone Number',
              hintStyle: TextStyle(color: Colors.white),
              fillColor: textFieldColor().withOpacity(0.8),
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          // ElevatedButton(
          //     onPressed: () {
          // final postModel = PostStudentModel(
          //     name: nameControlar.text,
          //     email: emailControlar.text,
          //     phone: int.parse(phoneControlar.text));
          // ref
          //     .read(studentsProvider.notifier)
          //     .postStudent(postModel: postModel);
          //     },
          //     child: Text('Click')),
          MaterialButton(
            onPressed: () {
              final postModel = PostStudentModel(
                  name: nameControlar.text,
                  email: emailControlar.text,
                  phone: int.parse(phoneControlar.text));
              ref
                  .read(studentsProvider.notifier)
                  .postStudent(postModel: postModel);
              Navigator.pop(context);
            },
            color: textFieldColor().withOpacity(0.7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  20), // set a larger border radius for rounded corners
            ),
            child: Text(
              'Done',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
