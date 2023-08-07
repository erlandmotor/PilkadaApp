import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/Datadpt.dart';
import '../../models/Desa.dart';
import '../../models/Kabupaten.dart';
import '../../models/Kecamatan.dart';
import '../../models/Provinsi.dart';
import '../../services/AuthService.dart';

part 'datadpt_event.dart';
part 'datadpt_state.dart';

class DatadptBloc extends Bloc<DatadptEvent, DatadptState> {
  DatadptBloc({Authentication? auth}) : super(DatadptInitial()) {
    auth = Authentication();
    List<Datadpt>? data = [];
    List<Datadpt>? foundusers = [];
    List<String> listprovinsi = [];
    List<String> listkabupaten = [];
    List<String> listkecamatan = [];
    List<String> listkelurahan = [];
    List<DataProvinsi>? dataprovinsi;
    List<DataKabupaten>? datakabupaten;
    List<DataKecamatan>? datakecamatan;
    List<DataDesa>? datakelurahan;
    connectkedaerah() async {
      dataprovinsi = await auth!.getdataprovinsi();
      datakabupaten = await auth.getdatakabupaten();
      datakecamatan = await auth.getdatakecamatan();
      datakelurahan = await auth.getdatadesa();
    }

    kedaerahfound() {
      listprovinsi = [
        for (var x in foundusers!)
          dataprovinsi!
              .firstWhere((e) => e.id.toString() == x.Province_id.toString())
              .name
              .toString()
      ];
      listkabupaten = [
        for (var x in foundusers!)
          datakabupaten!
              .firstWhere((e) => e.id.toString() == x.regency_id.toString())
              .name
              .toString()
      ];
      listkecamatan = [
        for (var x in foundusers!)
          datakecamatan!
              .firstWhere((e) => e.id.toString() == x.district_id.toString())
              .name
              .toString()
      ];
      listkelurahan = [
        for (var x in foundusers!)
          datakelurahan!
              .firstWhere((e) => e.id.toString() == x.villages_id.toString())
              .name
              .toString()
      ];
    }

    kedaerahlist() {
      listprovinsi = [
        for (var x in data!)
          dataprovinsi!
              .firstWhere((e) => e.id.toString() == x.Province_id.toString())
              .name
              .toString()
      ];
      listkabupaten = [
        for (var x in data!)
          datakabupaten!
              .firstWhere((e) => e.id.toString() == x.regency_id.toString())
              .name
              .toString()
      ];
      listkecamatan = [
        for (var x in data!)
          datakecamatan!
              .firstWhere((e) => e.id.toString() == x.district_id.toString())
              .name
              .toString()
      ];
      listkelurahan = [
        for (var x in data!)
          datakelurahan!
              .firstWhere((e) => e.id.toString() == x.villages_id.toString())
              .name
              .toString()
      ];
    }

    on<DatadptEvent>((event, emit) async {
      if (event is Datadptconnect) {
        data = await auth!.getdatadpt();
        await connectkedaerah();
        kedaerahlist();

        emit(DatadptLoaded(
            data: data,
            dataprovinsi: listprovinsi,
            datakabupaten: listkabupaten,
            datakelurahan: listkelurahan,
            datakecamatan: listkecamatan));
      }
      if (event is DatadptSearchProvinsi) {
        List<Datadpt> results = [];

        if (event.value!.isEmpty) {
          results = data!;
        } else {
          results = data!
              .where((e) => e.Province_id!.contains(event.value!))
              .toList();
        }
        foundusers = results;
        emit(DatadptLoaded(
            data: foundusers,
            dataprovinsi: listprovinsi,
            datakelurahan: listkelurahan,
            datakabupaten: listkabupaten,
            datakecamatan: listkecamatan));
      }
      if (event is DatadptSearchKabupaten) {
        List<Datadpt> results = [];

        if (event.value!.isEmpty) {
          results = data!;
          kedaerahfound();
        } else {
          results =
              data!.where((e) => e.regency_id!.contains(event.value!)).toList();
          foundusers = results;
          kedaerahfound();
        }

        emit(DatadptLoaded(
            data: foundusers,
            dataprovinsi: listprovinsi,
            datakelurahan: listkelurahan,
            datakabupaten: listkabupaten,
            datakecamatan: listkecamatan));
      }
      if (event is DatadptSearchKecamatan) {
        List<Datadpt> results = [];

        if (event.value!.isEmpty) {
          results = data!;
          kedaerahfound();
        } else {
          results = data!
              .where((e) => e.district_id!.contains(event.value!))
              .toList();
          foundusers = results;
          kedaerahfound();
        }

        emit(DatadptLoaded(
            data: foundusers,
            dataprovinsi: listprovinsi,
            datakelurahan: listkelurahan,
            datakabupaten: listkabupaten,
            datakecamatan: listkecamatan));
      }
      if (event is DatadptSearchKelurahan) {
        List<Datadpt> results = [];

        if (event.value!.isEmpty) {
          results = data!;
          kedaerahfound();
        } else {
          results = data!
              .where((e) => e.villages_id!.contains(event.value!))
              .toList();
          foundusers = results;
          kedaerahfound();
        }

        emit(DatadptLoaded(
            data: foundusers,
            dataprovinsi: listprovinsi,
            datakelurahan: listkelurahan,
            datakabupaten: listkabupaten,
            datakecamatan: listkecamatan));
      }
      if (event is DatadptSearchnama) {
        data = await auth!.caridatadpt(cari: event.value);
        kedaerahlist();
        emit(DatadptLoaded(
            data: data,
            dataprovinsi: listprovinsi,
            datakabupaten: listkabupaten,
            datakelurahan: listkelurahan,
            datakecamatan: listkecamatan));
      }
    });
  }
}
