import 'package:clean_api/clean_api.dart';
import 'package:won_api/domain/students_model.dart';

abstract class IStudentsRepo {
  Future<Either<CleanFailure, List<StudentsModel>>> getStudentsData();
}
