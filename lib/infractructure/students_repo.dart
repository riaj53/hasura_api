import 'package:clean_api/clean_api.dart';

import 'package:won_api/domain/i_students_repo.dart';
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
}
