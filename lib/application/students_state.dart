import 'package:clean_api/clean_api.dart';
import 'package:equatable/equatable.dart';

import 'package:won_api/domain/students_model.dart';

class StudentsState extends Equatable {
  final CleanFailure failure;
  final bool loading;
  final List<StudentsModel> listStu;
  const StudentsState({
    required this.failure,
    required this.loading,
    required this.listStu,
  });

  StudentsState copyWith({
    CleanFailure? failure,
    bool? loading,
    List<StudentsModel>? listStu,
  }) {
    return StudentsState(
      failure: failure ?? this.failure,
      loading: loading ?? this.loading,
      listStu: listStu ?? this.listStu,
    );
  }

  @override
  String toString() =>
      'StudentsState(failure: $failure, loading: $loading, listStu: $listStu)';

  @override
  List<Object> get props => [failure, loading, listStu];
  factory StudentsState.init() =>
      StudentsState(failure: CleanFailure.none(), loading: false, listStu: []);
}
