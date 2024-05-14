part of 'list_lop_hoc_cubit.dart';

class ListLopHocState extends Equatable {
  List<NamHoc>? namHoc;
  List<ClassModel>? listClass;
  bool? isLoading;
  ListLopHocState({
    this.listClass,
    this.isLoading,
    this.namHoc,
  });
  ListLopHocState copyWith({
    final List<ClassModel>? listClass,
    final bool? isLoading,
    final List<NamHoc>? namHoc,
  }) {
    return ListLopHocState(
      namHoc: namHoc ?? this.namHoc,
      listClass: listClass ?? this.listClass,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [listClass, isLoading, namHoc];
}
