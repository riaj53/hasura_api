import 'package:clean_api/clean_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:won_api/application/students_state.dart';
import 'package:won_api/domain/i_students_repo.dart';
import 'package:won_api/domain/post_student_model.dart';
import 'package:won_api/infractructure/students_repo.dart';

final studentsProvider =
    StateNotifierProvider<StudentsNotifier, StudentsState>((ref) {
  return StudentsNotifier(StudentsRepo());
});

class StudentsNotifier extends StateNotifier<StudentsState> {
  final IStudentsRepo studentsRepo;
  StudentsNotifier(this.studentsRepo) : super(StudentsState.init());
  getStudentsData() async {
    state = state.copyWith(loading: true);
    final data = await studentsRepo.getStudentsData();
    state = data.fold((l) => state.copyWith(loading: false, failure: l), (r) {
      Logger.i(' printing from provider$r');
      return state.copyWith(
          loading: false, listStu: r, failure: CleanFailure.none());
    });
  }

  postStudent({required PostStudentModel postModel}) async {
    state = state.copyWith(loading: true);
    final data = await studentsRepo.postStudent(postmodel: postModel);
    state = data.fold((l) => state.copyWith(loading: false, failure: l), (r) {
      Logger.i(' printing from provider$r');
      return state.copyWith(loading: false, failure: CleanFailure.none());
    });
    getStudentsData();
  }

  deletStu({required id}) async {
    state = state.copyWith(loading: true);
    final data = await studentsRepo.deletStu(id: id);
    state = data.fold((l) => state.copyWith(loading: false, failure: l), (r) {
      Logger.i(' printing from provider$r');
      return state.copyWith(loading: false, failure: CleanFailure.none());
    });
    getStudentsData();
  }
}
