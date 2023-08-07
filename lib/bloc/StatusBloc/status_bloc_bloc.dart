import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'status_bloc_event.dart';
part 'status_bloc_state.dart';

class StatusBlocBloc extends Bloc<StatusBlocEvent, StatusBlocState> {
  StatusBlocBloc() : super(StatusBlocInitial()) {
    on<StatusBlocEvent>((event, emit) {
      if (event is EventStatusLoading) {
        print("lagi loading");
        emit(StatusLoading());
      }
      if (event is EventStatusFailed) {
        emit(StatusFailed(err: event.err));
      }

      if (event is EventStatusSukses) {
        emit(StatusSukses());
      }
    });
  }
}
