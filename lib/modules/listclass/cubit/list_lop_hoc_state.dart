part of 'list_lop_hoc_cubit.dart';

class ListLopHocState extends Equatable {
  List<ClassModel>? listClass;
  bool? isLoading;
  ListLopHocState({this.listClass, this.isLoading});
  ListLopHocState copyWith({
    final List<ClassModel>? listClass,
    final bool? isLoading,
  }) {
    return ListLopHocState(
      listClass: listClass ?? this.listClass,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [listClass, isLoading];
}
