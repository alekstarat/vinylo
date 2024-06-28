part of 'database_bloc.dart';

abstract class DatabaseState extends Equatable {
  const DatabaseState();
  
  @override
  List<Object> get props => [];
}

final class DatabaseInitial extends DatabaseState {}

class DatabaseLoading extends DatabaseState {}
class DatabaseLoaded extends DatabaseState {

  final Stream<QuerySnapshot<Object?>> items;

  const DatabaseLoaded(this.items);
}

class DatabaseLoadFailure extends DatabaseState{
  final String? message;
  const DatabaseLoadFailure({required this.message});
}
