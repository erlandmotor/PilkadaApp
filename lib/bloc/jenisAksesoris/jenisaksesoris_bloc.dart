import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/datajenisaksesoris.dart';
import '../../services/AuthService.dart';
import '../StatusBloc/status_bloc_bloc.dart';

part 'jenisaksesoris_event.dart';
part 'jenisaksesoris_state.dart';

class JenisaksesorisBloc
    extends Bloc<JenisaksesorisEvent, JenisaksesorisState> {
  StatusBlocBloc? status;
  JenisaksesorisBloc({Authentication? auth, StatusBlocBloc? status})
      : super(JenisaksesorisInitial()) {
    status = StatusBlocBloc();
    auth = Authentication();
    on<JenisaksesorisEvent>((event, emit) async {
      if (event is JenisAksesorisConnect) {
        var data = await auth!.getdatajenisaksesoris();
        emit(JenisAksesorisLoaded(data: data));
      }

      if (event is CreateJenisAksesoris) {
        // status!.add(EventStatusLoading());
        emit(JenisAkLoading());
        try {
          await auth!.createaksesoris(
              nama_aksesoris: event.nama_aksesoris, foto: event.foto);
          add(JenisAksesorisNew());
          // status.add(EventStatusSukses());
          emit(JenisAkSukses());
        } catch (e) {
          // status.add(EventStatusFailed(err: e.toString()));
          emit(JenisAkFailed(err: e.toString()));
        }
      }
      if (event is JenisAksesorisSearch) {
        var data = await auth!.carijenisksesoris(cari: event.value);
        emit(JenisAksesorisLoaded(data: data));
      }
    });
  }
}
