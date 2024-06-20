import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_item_repository/shop_item_repository.dart';

part 'database_event.dart';
part 'database_state.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {

  final DatabaseRepository databaseRepository;

  DatabaseBloc({
    required this.databaseRepository
  }) : super(DatabaseLoading()) {
    on<LoadDatabaseEvent>((event, emit) async {
      try{
        databaseRepository.getItems();
        emit(DatabaseLoaded());
      } catch (e) {
        emit(DatabaseLoadFailure(message: e.toString()));
      }
    });
  }
}
