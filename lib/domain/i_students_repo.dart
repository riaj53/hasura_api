import 'package:clean_api/clean_api.dart';
import 'package:won_api/domain/post_student_model.dart';
import 'package:won_api/domain/students_model.dart';

abstract class IStudentsRepo {
  Future<Either<CleanFailure, List<StudentsModel>>> getStudentsData();
  Future<Either<CleanFailure, Unit>> postStudent(
      {required PostStudentModel postmodel});
  Future<Either<CleanFailure, Unit>> deletStu({required id});
}
