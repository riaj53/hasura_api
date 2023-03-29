import 'dart:convert';

import 'package:clean_api/clean_api.dart';

import 'package:won_api/domain/i_students_repo.dart';
import 'package:won_api/domain/post_student_model.dart';
import 'package:won_api/domain/students_model.dart';

class StudentsRepo extends IStudentsRepo {
  final cleanApi = CleanApi.instance;
  @override
  Future<Either<CleanFailure, List<StudentsModel>>> getStudentsData() async {
    return await cleanApi.get(
        fromData: (json) => List<StudentsModel>.from(
            (json['students'] as List).map((e) => StudentsModel.fromMap(e))),
        endPoint: 'getstudent');
  }

  @override
  Future<Either<CleanFailure, Unit>> postStudent(
      {required PostStudentModel postmodel}) async {
    return cleanApi.post(
        fromData: (json) => unit,
        body: postmodel.toMap(),
        endPoint: 'inputdata');
  }

  @override
  Future<Either<CleanFailure, Unit>> deletStu({required id}) {
    return cleanApi.delete(fromData: (json) => unit, 
    body: {'id':id},endPoint: 'deletStudent');
  }
}
