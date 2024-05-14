import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fe/model/replly.model.dart';

import '../../../../../app/data_fake/fake_home.dart';

part 'reply_state.dart';

class ReplyCubit extends Cubit<ReplyState> {
  ReplyCubit() : super(const ReplyState(isLoading: true));
  Future<void> getReply({String? id}) async {
    emit(state.copyWith(isLoading: false));
    for (int i = 0; i < listHome.length; i++) {
      if (listHome[i].id == id) {
        var reply = listHome[i].repply;
        emit(
          state.copyWith(isLoading: false, reply: reply),
        );
      }
    }
  }

  Future<void> addReply({String? id, RepllyModel? repllyModel}) async {
    for (int i = 0; i < listHome.length; i++) {
      if (listHome[i].id == id) {
        if (repllyModel != null) {
          listHome[i].repply?.add(repllyModel);
          emit(state.copyWith(isLoading: false));
        }
      }
    }
  }
}
