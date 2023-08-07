import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/dataKordinator.dart';
import '../../services/AuthService.dart';

part 'kordinatorkelurahan_event.dart';
part 'kordinatorkelurahan_state.dart';

class KordinatorkelurahanBloc
    extends Bloc<KordinatorkelurahanEvent, KordinatorkelurahanState> {
  KordinatorkelurahanBloc({Authentication? auth})
      : super(KordinatorkelurahanInitial()) {
    auth = Authentication();
    List<DataKordinator>? data = [];
    List<DataKordinator>? foundusers = [];
    on<KordinatorkelurahanEvent>((event, emit) async {
      if (event is DataKoordinatorKelurahanConnect) {
        data = await auth!.getkordinatorkelurahan(event.page);

        emit(DataKoordinatorKelurahanLoaded(
          data: data,
        ));
      }
      if (event is DatakoorNew) {
        data = await auth!.getkordinatorkelurahan('1');
        emit(DataKoordinatorKelurahanLoaded(
          data: data,
        ));
      }
      if (event is TambahDataKoordinatorKelurahan) {
        emit(DatakoorKelurahanLoading());
        try {
          await auth!.createkoordinatorkelurahan(
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
          emit(DatakoorKelurahanSukses());
        } catch (e) {
          DatakoorKelurahanFailed(err: e.toString());
        }
      }
      if (event is DataKoordinatorKelurahanSearchKabupaten) {
        List<DataKordinator> results = [];

        if (event.value!.isEmpty) {
          results = data!;
        } else {
          results =
              data!.where((e) => e.regency_id!.contains(event.value!)).toList();
          foundusers = results;
        }

        emit(DataKoordinatorKelurahanLoaded(
          data: foundusers,
        ));
      }
      if (event is DataKoordinatorKelurahanSearchKecamatan) {
        List<DataKordinator> results = [];

        if (event.value!.isEmpty) {
          results = data!;
        } else {
          results = data!
              .where((e) => e.district_id!.contains(event.value!))
              .toList();
          foundusers = results;
        }

        emit(DataKoordinatorKelurahanLoaded(
          data: foundusers,
        ));
      }
      if (event is DataKoordinatorKelurahanSearch) {
        data = await auth!.carikoordinatorkelurahan(cari: event.value);

        emit(DataKoordinatorKelurahanLoaded(
          data: data,
        ));
      }
      if (event is DataKoordinatorKelurahanSearchKelurahan) {
        List<DataKordinator> results = [];

        if (event.value!.isEmpty) {
          results = data!;
        } else {
          results = data!
              .where((e) => e.villages_id!.contains(event.value!))
              .toList();
          foundusers = results;
        }

        emit(DataKoordinatorKelurahanLoaded(
          data: foundusers,
        ));
      }
      if (event is KoorKelurahanInput) {
        emit(KoorKelurahanOutput(
            kabupaten: event.kabupaten,
            kecamatan: event.kecamatan,
            kelurahan: event.kelurahan));
      }
    });
  }
}
