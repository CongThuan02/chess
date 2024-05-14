part of 'reply_cubit.dart';

class ReplyState extends Equatable {
  final bool isLoading;
  final List<RepllyModel>? reply;

  ReplyState copyWith({
    final bool? isLoading,
    final List<RepllyModel>? reply,
  }) {
    return ReplyState(
      isLoading: isLoading ?? this.isLoading,
      reply: reply ?? this.reply,
    );
  }

  const ReplyState({
    required this.isLoading,
    this.reply,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [isLoading, reply];
}
