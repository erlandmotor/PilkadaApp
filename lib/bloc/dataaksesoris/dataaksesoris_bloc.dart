import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pilkada/models/dataaksesoris.dart';

import '../../models/datajenisaksesoris.dart';
import '../../models/datarelawanutama.dart';
import '../../services/AuthService.dart';

part 'dataaksesoris_event.dart';
part 'dataaksesoris_state.dart';

class DataaksesorisBloc extends Bloc<DataaksesorisEvent, DataaksesorisState> {
  DataaksesorisBloc({Authentication? auth}) : super(DataaksesorisInitial()) {
    auth = Authentication();
    List<Dataaksesoris>? data = [];
    List<Dataaksesoris>? foundusers = [];
    List<String> dataaksesoris = [];
    List<DataJenisaksesoris>? jenisaksesoris = [];
    List<DataRelawanUtama>? datarelawan = [];
    List<String> listrelawan = [];
    konekdata() async {
      jenisaksesoris = await auth!.getdatajenisaksesoris();
      datarelawan = await auth.getdatarelawanbiasa();
    }

    aksesoriskelist() {
      listrelawan = [
        for (var x in data!)
          datarelawan!
              .firstWhere(
                  (e) => e.id.toString() == x.relawanbiasas_id.toString())
              .nama
              .toString()
      ];
      dataaksesoris = [
        for (var x in data!)
          jenisaksesoris!
              .firstWhere(
                  (e) => e.id.toString() == x.jenis_aksesoris.toString())
              .nama_aksesoris
              .toString()
      ];
    }

    aksesoriskelistfound() {
      listrelawan = [
        for (var x in foundusers!)
          datarelawan!
              .firstWhere(
                  (e) => e.id.toString() == x.relawanbiasas_id.toString())
              .nama
              .toString()
      ];
      dataaksesoris = [
        for (var x in foundusers!)
          jenisaksesoris!
              .firstWhere(
                  (e) => e.id.toString() == x.jenis_aksesoris.toString())
              .nama_aksesoris
              .toString()
      ];
    }

    on<DataaksesorisEvent>((event, emit) async {
      if (event is DataaksesorisConnect) {
        data = await auth!.getdataaksesoris(event.page.toString());
        await konekdata();
        aksesoriskelist();
        emit(Dataaksesorisloaded(
            data: data,
            jenisaksesoris: dataaksesoris,
            listrelawan: listrelawan));
      }

      if (event is TambahDataPenerima) {
        emit(DataaksesorisLoading());
        try {
          await auth!.createpenerimaaksesoris(
              relawanbiasas_id: event.relawanbiasas_id,
              jenis_aksesoris: event.jenis_aksesoris,
              tanggal_terima: event.tanggal_terima,
              foto_bukti: event.foto_bukti,
              Province_id: event.provinsi,
              regency_id: event.regency,
              district_id: event.district,
              villages_id: event.villages);
          add(DataAksesorisNew());
          emit(DataaksesorisSukses());
        } catch (e) {
          emit(DataaksesorisFailed(err: e.toString()));
        }
      }
      if (event is PenerimaSearchKabupaten) {
        List<Dataaksesoris> results = [];

        if (event.value!.isEmpty) {
          results = data!;
          aksesoriskelist();
        } else {
          results =
              data!.where((e) => e.regency_id!.contains(event.value!)).toList();
        }
        foundusers = results;
        aksesoriskelistfound();
        emit(Dataaksesorisloaded(
            data: foundusers,
            jenisaksesoris: dataaksesoris,
            listrelawan: listrelawan));
      }
      if (event is PenerimaSearchKecamatan) {
        List<Dataaksesoris> results = [];

        if (event.value!.isEmpty) {
          results = data!;
        } else {
          results = data!
              .where((e) => e.district_id!.contains(event.value!))
              .toList();
        }
        foundusers = results;
        aksesoriskelistfound();
        emit(Dataaksesorisloaded(
            data: foundusers,
            jenisaksesoris: dataaksesoris,
            listrelawan: listrelawan));
      }
      if (event is PenerimaSearchkelurahan) {
        List<Dataaksesoris> results = [];

        if (event.value!.isEmpty) {
          results = data!;
        } else {
          results = data!
              .where((e) => e.villages_id!.contains(event.value!))
              .toList();
        }
        foundusers = results;
        aksesoriskelistfound();
        emit(Dataaksesorisloaded(
            jenisaksesoris: dataaksesoris,
            data: foundusers,
            listrelawan: listrelawan));
      }
      if (event is DataaksesorisSearch) {
        List<Dataaksesoris>? results = [];
        if (event.value!.isEmpty) {
          results = data!;
        } else {
          results = await auth!.caripenerimaaksesoris(cari: event.value);
        }
        foundusers = results;
        aksesoriskelistfound();
        emit(Dataaksesorisloaded(
            data: foundusers,
            jenisaksesoris: dataaksesoris,
            listrelawan: listrelawan));
      }
      if (event is PenerimaInput) {
        emit(PenerimaOutput(
            kabupaten: event.kabupaten,
            kecamatan: event.kecamatan,
            kelurahan: event.kelurahan));
      }
      if (event is Penerimarelawaninput) {
        var kabupatenrelawan = datarelawan!
            .firstWhere((e) => e.nama.toString() == event.namarelawan)
            .regency_id
            .toString();

        var kecamatanrelawan = datarelawan!
            .firstWhere((e) => e.nama.toString() == event.namarelawan)
            .district_id
            .toString();
        var kelurahanrelawan = datarelawan!
            .firstWhere((e) => e.nama.toString() == event.namarelawan)
            .villages_id
            .toString();
        emit(PenerimarelawanOutput(
            kabupaten: kabupatenrelawan,
            kecamatan: kecamatanrelawan,
            kelurahan: kelurahanrelawan));
      }
    });
  }
}
