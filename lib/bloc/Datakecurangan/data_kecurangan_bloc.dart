import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/semuadatakecurangan.dart';
import '../../services/AuthService.dart';

part 'data_kecurangan_event.dart';
part 'data_kecurangan_state.dart';

class DataKecuranganBloc
    extends Bloc<DataKecuranganEvent, DataKecuranganState> {
  DataKecuranganBloc({Authentication? auth}) : super(DataKecuranganInitial()) {
    auth = Authentication();
    List<SemuaDataKecurangan>? data = [];
    List<SemuaDataKecurangan>? foundusers = [];
    List<String> listprovinsi = [];
    List<String> listkabupaten = [];
    List<String> listkecamatan = [];
    List<String> listkelurahan = [];
    foundkelist() {
      listprovinsi = foundusers!.map((e) => e.Province_id.toString()).toList();
      listkabupaten = foundusers!.map((e) => e.regency_id.toString()).toList();
      listkecamatan = foundusers!.map((e) => e.district_id.toString()).toList();
      listkelurahan = foundusers!.map((e) => e.villages_id.toString()).toList();
    }

    on<DataKecuranganEvent>((event, emit) async {
      if (event is DataKecuranganConnect) {
        data = await auth!.getsemuadatakecurangan(event.page.toString());
        listprovinsi = data!.map((e) => e.Province_id.toString()).toList();
        listkabupaten = data!.map((e) => e.regency_id.toString()).toList();
        listkecamatan = data!.map((e) => e.district_id.toString()).toList();
        listkelurahan = data!.map((e) => e.villages_id.toString()).toList();

        emit(DataKecuranganLoaded(
            data: data,
            kabupaten: listkabupaten,
            kecamatan: listkecamatan,
            kelurahan: listkelurahan));
      }
      if (event is DataKecuranganSearchKabupaten) {
        List<SemuaDataKecurangan> results = [];

        if (event.value!.isEmpty) {
          results = data!;
        } else {
          results =
              data!.where((e) => e.regency_id!.contains(event.value!)).toList();
        }
        foundusers = results;
        foundkelist();
        emit(DataKecuranganLoaded(
            data: foundusers,
            kelurahan: listkelurahan,
            kabupaten: listkabupaten,
            kecamatan: listkecamatan));
      }
      if (event is DataKecuranganSearchKecamatan) {
        List<SemuaDataKecurangan> results = [];

        if (event.value!.isEmpty) {
          results = data!;
        } else {
          results = data!
              .where((e) => e.district_id!.contains(event.value!))
              .toList();
        }
        foundusers = results;
        foundkelist();
        emit(DataKecuranganLoaded(
            data: foundusers,
            kabupaten: listkabupaten,
            kelurahan: listkelurahan,
            kecamatan: listkecamatan));
      }

      if (event is DataKecuranganCreate) {
        emit(DataKecuranganLoading());
        try {
          await auth!.createkecurangan(
              nama_kecurangan: event.nama_kecurangan,
              deskripsi: event.deskripsi,
              tps_id: event.tps_id,
              fotoBukti_kecurangan: event.fotoBukti_kecurangan,
              Province_id: event.province,
              regency_id: event.regency,
              district_id: event.district,
              villages_id: event.villages);
          add(DataKecuranganNew());
          emit(DataKecuranganSukses());
        } catch (e) {
          emit(DataKecuranganFailed(err: e.toString()));
        }
      }
      if (event is KecuranganInput) {
        emit(KecuranganOutput(
            kabupaten: event.kabupaten,
            kecamatan: event.kecamatan,
            tps: event.tps,
            kelurahan: event.kelurahan));
      }
    });
  }
}
