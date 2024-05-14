import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/class.model.dart';
import '../../../model/namhoc.model.dart';
import '../../../provider/classroom.provider.dart';

part 'list_lop_hoc_state.dart';

class ListLopHocCubit extends Cubit<ListLopHocState> {
  ListLopHocCubit()
      : super(
          ListLopHocState(isLoading: true),
        );
  Future<void> getListLopHocState({int? nameHoc}) async {
    emit(
      state.copyWith(isLoading: true),
    );
    var namHoc = await ClassroomProvider.getListNamHoc();
    print(namHoc);
    var relust = await ClassroomProvider.getListClass(nameHoc ?? namHoc[0].hoc_ky!, 1);
    print(relust);
    emit(
      state.copyWith(isLoading: false, listClass: [...relust], namHoc: namHoc),
    );
  }
}
