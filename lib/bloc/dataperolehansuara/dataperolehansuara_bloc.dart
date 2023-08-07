import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/Desa.dart';
import '../../models/Kabupaten.dart';
import '../../models/Kecamatan.dart';
import '../../models/Provinsi.dart';
import '../../models/dataperolehansuara.dart';
import '../../services/AuthService.dart';

part 'dataperolehansuara_event.dart';
part 'dataperolehansuara_state.dart';

class DataperolehansuaraBloc
    extends Bloc<DataperolehansuaraEvent, DataperolehansuaraState> {
  DataperolehansuaraBloc({Authentication? auth})
      : super(DataperolehansuaraInitial()) {
    auth = Authentication();
    List<String> listprovinsi = [];
    List<String> listkabupaten = [];
    List<String> listkecamatan = [];
    List<String> listdesa = [];
    List<DataPerolehanSuara>? data = [];
    List<DataPerolehanSuara>? foundsuara = [];
    foundkelist() {
      listprovinsi = foundsuara!.map((e) => e.Province_id.toString()).toList();
      listkabupaten = foundsuara!.map((e) => e.regency_id.toString()).toList();
      listkecamatan = foundsuara!.map((e) => e.district_id.toString()).toList();
      listdesa = foundsuara!.map((e) => e.villages_id.toString()).toList();
    }

    on<DataperolehansuaraEvent>((event, emit) async {
      if (event is DataPerolehanSuaraConnect) {
        data = await auth!.getdataperolehansuara(event.page);
        listprovinsi = data!.map((e) => e.Province_id.toString()).toList();
        listkabupaten = data!.map((e) => e.regency_id.toString()).toList();
        listkecamatan = data!.map((e) => e.district_id.toString()).toList();
        listdesa = data!.map((e) => e.villages_id.toString()).toList();
        emit(DataPerolehanSuaraLoaded(
            kelurahan: listdesa,
            data: data,
            kabupaten: listkabupaten,
            kecamatan: listkecamatan,
            provinsi: listprovinsi));
      }

      if (event is DataPerolehanSuaraCreate) {
        emit(DPSloading());
        try {
          await auth!.createperolehansuara(
            jml_suara_sah: event.jml_suara_sah,
            jml_suara_tidaksah: event.jml_suara_tidaksah,
            foto_bukti_perolehan_suara: event.foto_bukti_perolehan_suara,
            Province_id: event.Province_id,
            regency_id: event.regency_id,
            district_id: event.district_id,
            villages_id: event.villages_id,
            tps_id: event.tps_id,
            formulir_c1: event.formulir_c1,
          );
          add(DPSNew());
          emit(DPSSukses());
        } catch (e) {
          emit(DPSFailed(err: e.toString()));
        }
      }
      if (event is DPSNew) {
        data = await auth!.getdataperolehansuara('1');

        emit(DataPerolehanSuaraLoaded(
            data: data,
            kabupaten: listkabupaten,
            kecamatan: listkecamatan,
            kelurahan: listdesa,
            provinsi: listprovinsi));
      }

      if (event is DPScariKabupaten) {
        List<DataPerolehanSuara>? results = [];

        if (event.value!.isEmpty) {
          results = data!;
        } else {
          results =
              data!.where((e) => e.regency_id!.contains(event.value!)).toList();
          foundsuara = results;
          foundkelist();
        }

        emit(DataPerolehanSuaraLoaded(
            data: foundsuara,
            provinsi: listprovinsi,
            kelurahan: listdesa,
            kabupaten: listkabupaten,
            kecamatan: listkecamatan));
      }
      if (event is DPScariKecamatan) {
        List<DataPerolehanSuara>? results = [];

        if (event.value!.isEmpty) {
          results = data!;
        } else {
          results = data!
              .where((e) => e.district_id!.contains(event.value!))
              .toList();
          foundsuara = results;
          foundkelist();
        }

        emit(DataPerolehanSuaraLoaded(
            data: foundsuara,
            provinsi: listprovinsi,
            kelurahan: listdesa,
            kabupaten: listkabupaten,
            kecamatan: listkecamatan));
      }
      if (event is DPScariKelurahan) {
        List<DataPerolehanSuara>? results = [];

        if (event.value!.isEmpty) {
          results = data!;
        } else {
          results = data!
              .where((e) => e.villages_id!.contains(event.value!))
              .toList();
          foundsuara = results;
          foundkelist();
        }

        emit(DataPerolehanSuaraLoaded(
            data: foundsuara,
            provinsi: listprovinsi,
            kelurahan: listdesa,
            kabupaten: listkabupaten,
            kecamatan: listkecamatan));
      }
      if (event is DPSInput) {
        emit(DPSOutput(
            kabupaten: event.kabupaten,
            kelurahan: event.kelurahan,
            tps: event.tps,
            kecamatan: event.kecamatan));
      }
    });
  }
}
