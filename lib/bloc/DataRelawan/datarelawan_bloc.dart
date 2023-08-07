import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pilkada/models/datagruprelawan.dart';
import 'package:pilkada/models/datarelawanutama.dart';
import 'package:pilkada/services/AuthService.dart';

part 'datarelawan_event.dart';
part 'datarelawan_state.dart';

class DatarelawanBloc extends Bloc<DatarelawanEvent, DatarelawanState> {
  DatarelawanBloc({Authentication? auth}) : super(DatarelawanInitial()) {
    auth = Authentication();
    List<DataRelawanUtama>? data = [];

    on<DatarelawanEvent>((event, emit) async {
      if (event is DataRelawanUtamaConnect) {
        data = await auth!.getdatarelawanutama(event.id.toString());

        emit(DataRelawanLoaded(
          data: data,
        ));
      }
      if (event is DataRelawanBiasaConnect) {
        data = await auth!.getdatarelawanbiasa(page: event.id);

        emit(DataRelawanLoaded(
          data: data,
        ));
      }

      if (event is TambahDataRelawanUtama) {
        emit(DatarelawanLoading());
        try {
          await auth!.createrelawanUtama(
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
          add(DataRelawanNewUtama());
          emit(DatarelawanSukses());
        } catch (e) {
          emit(DatarelawanFailed(err: e.toString()));
        }
      }
      if (event is DatarelawanUtamaSearch) {
        data = await auth!.carirelawanutama(cari: event.value.toString());

        emit(DataRelawanLoaded(
          data: data,
        ));
      }
      if (event is DatarelawanBiasaSearch) {
        data = await auth!.carirelawanbiasa(cari: event.value.toString());

        emit(DataRelawanLoaded(
          data: data,
        ));
      }
      if (event is DataRelawanNewUtama) {
        data = await auth!.getdatarelawanutama('1');

        emit(DataRelawanLoaded(
          data: data,
        ));
      }
      if (event is DataRelawanNewBiasa) {
        data = await auth!.getdatarelawanbiasa();

        emit(DataRelawanLoaded(
          data: data,
        ));
      }
      if (event is TambahDataRelawanBiasa) {
        emit(DatarelawanLoading());
        try {
          await auth!.createrelawanBiasa(
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
          add(DataRelawanNewBiasa());
          emit(DatarelawanSukses());
        } catch (e) {
          print(e);
          emit(DatarelawanFailed(err: e.toString()));
        }
      }
      if (event is RelawanInput) {
        emit(RelawanOutput(
            kabupaten: event.kabupaten,
            kecamatan: event.kecamatan,
            kelurahan: event.kelurahan));
      }
      if (event is RelawanDetail) {
        var data = await auth!.getdetailrelawan(id: event.id);
        emit(RelawanDetailLoaded(data: data));
      }
    });
  }
}
