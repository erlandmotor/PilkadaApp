import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pilkada/services/AuthService.dart';

import '../../models/Desa.dart';
import '../../models/Kabupaten.dart';
import '../../models/Kecamatan.dart';
import '../../models/Provinsi.dart';
import '../../models/saksitps.dart';

part 'datasaksi_event.dart';
part 'datasaksi_state.dart';

class DatasaksiBloc extends Bloc<DatasaksiEvent, DatasaksiState> {
  DatasaksiBloc({Authentication? auth}) : super(DatasaksiInitial()) {
    auth = Authentication();
    List<DataSaksi>? data = [];
    List<DataSaksi>? foundusers = [];

    on<DatasaksiEvent>((event, emit) async {
      if (event is DatasaksiConnect) {
        data = await auth!.getdatasaksi(event.page);

        emit(DataSaksiLoaded(
          data: data,
        ));
      }
      if (event is TambahDatasaksi) {
        try {
          var data = await auth!.createsaksi(
              nama_saksi: event.nama_saksi,
              nik: event.nik,
              alamat: event.alamat,
              no_hp: event.no_hp,
              email: event.email,
              saksi: event.saksi,
              Province_id: event.Province_id,
              regency_id: event.regency_id,
              district_id: event.district_id,
              tps_id: event.tps_id,
              role: event.role,
              password: event.password);
          add(DatasaksiNew());
          emit(DatasaksiUpdate(update: data));
        } catch (e) {
          emit(DatasaksiFailure(error: e.toString()));
        }
      }

      if (event is DatasaksiNew) {
        var data = await auth!.getdatasaksi('1');
        emit(DataSaksiLoaded(data: data));
      }

      if (event is DatasaksiSearchKabuapten) {
        List<DataSaksi> results = [];

        if (event.value!.isEmpty) {
          results = data!;
        } else {
          results =
              data!.where((e) => e.regency_id!.contains(event.value!)).toList();
          foundusers = results;
        }

        emit(DataSaksiLoaded(
          data: foundusers,
        ));
      }
      if (event is DatasaksiSearchKecamatan) {
        List<DataSaksi> results = [];

        if (event.value!.isEmpty) {
          results = data!;
        } else {
          results = data!
              .where((e) => e.district_id!.contains(event.value!))
              .toList();
          foundusers = results;
        }

        emit(DataSaksiLoaded(
          data: foundusers,
        ));
      }
      if (event is DatasaksiSearchKelurahan) {
        List<DataSaksi> results = [];

        if (event.value!.isEmpty) {
          results = data!;
        } else {
          results = data!
              .where((e) => e.villages_id!.contains(event.value!))
              .toList();
          foundusers = results;
        }

        emit(DataSaksiLoaded(
          data: foundusers,
        ));
      }
      if (event is DatasaksiSearch) {
        data = await auth!.caridatasaksi(cari: event.value);

        emit(DataSaksiLoaded(
          data: data,
        ));
      }
    });
  }
}
