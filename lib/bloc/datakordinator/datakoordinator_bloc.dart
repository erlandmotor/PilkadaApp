import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pilkada/models/dataKordinator.dart';
import 'package:pilkada/services/AuthService.dart';

import '../../models/datakordinatorkomunitas.dart';

part 'datakoordinator_event.dart';
part 'datakoordinator_state.dart';

class DatakoordinatorBloc
    extends Bloc<DatakoordinatorEvent, DatakoordinatorState> {
  DatakoordinatorBloc({Authentication? auth})
      : super(DatakoordinatorInitial()) {
    auth = Authentication();
    List<DataKordinator>? data = [];
    List<DataKordinator>? foundusers = [];

    on<DatakoordinatorEvent>((event, emit) async {
      if (event is DataKoordinatorConnect) {
        data = await auth!.getdatakordinator(event.page);

        emit(DataKoordinatorLoaded(
          data: data,
        ));
      }
      if (event is DatakoorNew) {
        data = await auth!.getdatakordinator('1');
        emit(DataKoordinatorLoaded(
          data: data,
        ));
      }
      if (event is TambahDataKoordinator) {
        emit(DatakoorLoading());
        try {
          await auth!.createkoordinator(
              nama: event.nama,
              nik: event.nik,
              alamat: event.alamat,
              jkl: event.jkl,
              agama: event.agama,
              no_wa: event.no_wa,
              photo: event.photo,
              scan_ktp: event.scan_ktp,
              Province_id: event.Province_id,
              regency_id: event.regency_id,
              district_id: event.district_id,
              villages_id: event.villages_id);
          add(DatakoorNew());
          emit(DatakoorSukses());
        } catch (e) {
          DatakoorFailed(err: e.toString());
        }
      }

      if (event is DataKoordinatorConnectKomunitas) {
        var data = await auth!.getdatakordinatorkomunitas(page: event.page);
        emit(DataKoordinatorKomunitas(data: data));
      }

      if (event is DataKoordinatorSearchKabupaten) {
        List<DataKordinator> results = [];

        if (event.value!.isEmpty) {
          results = data!;
        } else {
          results =
              data!.where((e) => e.regency_id!.contains(event.value!)).toList();
          foundusers = results;
        }

        emit(DataKoordinatorLoaded(
          data: foundusers,
        ));
      }
      if (event is DataKoordinatorSearchKecamatan) {
        List<DataKordinator> results = [];

        if (event.value!.isEmpty) {
          results = data!;
        } else {
          results = data!
              .where((e) => e.district_id!.contains(event.value!))
              .toList();
          foundusers = results;
        }

        emit(DataKoordinatorLoaded(
          data: foundusers,
        ));
      }
      if (event is DataKoordinatorSearch) {
        data = await auth!.caridatakordinator(cari: event.value);

        emit(DataKoordinatorLoaded(
          data: data,
        ));
      }
      if (event is DataKoordinatorSearchKelurahan) {
        List<DataKordinator> results = [];

        if (event.value!.isEmpty) {
          results = data!;
        } else {
          results = data!
              .where((e) => e.villages_id!.contains(event.value!))
              .toList();
          foundusers = results;
        }

        emit(DataKoordinatorLoaded(
          data: foundusers,
        ));
      }
      if (event is KoorInput) {
        emit(KoorOutput(
            kabupaten: event.kabupaten,
            kecamatan: event.kecamatan,
            kelurahan: event.kelurahan));
      }
    });
  }
}
