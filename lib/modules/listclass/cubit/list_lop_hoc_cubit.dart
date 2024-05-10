import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/class.model.dart';
import '../../../provider/classroom.provider.dart';

part 'list_lop_hoc_state.dart';

class ListLopHocCubit extends Cubit<ListLopHocState> {
  ListLopHocCubit()
      : super(
          ListLopHocState(isLoading: true),
        );
  Future<void> getListLopHocState() async {
    emit(
      state.copyWith(isLoading: true),
    );
    var relust = await ClassroomProvider.getListClass(20232, 1);
    print(relust);
    emit(
      state.copyWith(isLoading: false, listClass: relust),
    );
  }
}
