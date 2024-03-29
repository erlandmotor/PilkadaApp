import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pilkada/models/dataprofile.dart';
import 'package:pilkada/services/AuthService.dart';

part 'dataprofile_event.dart';
part 'dataprofile_state.dart';

class DataprofileBloc extends Bloc<DataprofileEvent, DataprofileState> {
  DataprofileBloc({Authentication? auth}) : super(DataprofileInitial()) {
    auth = Authentication();
    on<DataprofileEvent>((event, emit) async {
      if (event is DataProfileConnect) {
        var data = await auth!.getdataprofile();
        emit(DataprofileLoaded(data: data));
      }
      if (event is DataProfileUpdate) {
        emit(DataprofileLoading());
        try {
          await auth!.updatepass(
              email: event.email,
              id: event.id,
              password: event.password,
              name: event.name);
          add(DataprofileNew());
          emit(DataprofileSukses());
        } catch (e) {
          emit(DataprofileFailed(err: e.toString()));
        }
      }
      if (event is DataprofileNew) {
        var data = await auth!.getdataprofile();
        emit(DataprofileLoaded(data: data));
      }
    });
  }
}
