import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pilkada/models/Tps.dart';
import 'package:pilkada/services/AuthService.dart';

part 'datatps_event.dart';
part 'datatps_state.dart';

class DatatpsBloc extends Bloc<DatatpsEvent, DatatpsState> {
  DatatpsBloc({Authentication? auth}) : super(DatatpsInitial()) {
    auth = Authentication();
    List<Datatps>? data = [];
    List<Datatps>? foundusers = [];
    List<String> dataprovinsi = [];
    List<String> datakabupaten = [];
    List<String> datakecamatan = [];
    List<String> datakelurahan = [];
    foundkelist() {
      dataprovinsi = foundusers!.map((e) => e.Province_id.toString()).toList();
      datakabupaten = foundusers!.map((e) => e.regency_id.toString()).toList();
      datakecamatan = foundusers!.map((e) => e.district_id.toString()).toList();
      datakelurahan = foundusers!.map((e) => e.villages_id.toString()).toList();
    }

    on<DatatpsEvent>((event, emit) async {
      if (event is Datatpsconnect) {
        data = await auth!.getdatatps(event.page);
        dataprovinsi = data!.map((e) => e.Province_id.toString()).toList();
        datakabupaten = data!.map((e) => e.regency_id.toString()).toList();
        datakecamatan = data!.map((e) => e.district_id.toString()).toList();
        datakelurahan = data!.map((e) => e.villages_id.toString()).toList();
        emit(DatatpsLoaded(
            data: data,
            datakabupaten: datakabupaten,
            dataprovinsi: dataprovinsi,
            datakecamatan: datakecamatan,
            datakelurahan: datakelurahan));
      }

      if (event is TambahDataTps) {
        var data = await auth!.posttps(
            province_id: event.province_id,
            regency_id: event.regency_id,
            district_id: event.district_id,
            tps: event.tps,
            ket: event.ket);
        add(DataTpsNew());
        emit(DatatpsUpdate(update: data));
      }

      if (event is DatatpsSearchProvinsi) {
        List<Datatps> results = [];

        if (event.provinsi!.isEmpty) {
          results = data!;
        } else {
          results = data!
              .where((e) => e.Province_id!.contains(event.provinsi!))
              .toList();
        }
        foundusers = results;
        foundkelist();

        emit(DatatpsLoaded(
            data: foundusers,
            datakabupaten: datakabupaten,
            dataprovinsi: dataprovinsi,
            datakecamatan: datakecamatan,
            datakelurahan: datakelurahan));
      }
      if (event is DatatpsSearchKabupaten) {
        List<Datatps> results = [];

        if (event.kabupaten!.isEmpty) {
          results = data!;
        } else {
          results = data!
              .where((e) => e.regency_id!.contains(event.kabupaten!))
              .toList();
          foundusers = results;
          foundkelist();
        }

        emit(DatatpsLoaded(
            data: foundusers,
            datakabupaten: datakabupaten,
            dataprovinsi: dataprovinsi,
            datakecamatan: datakecamatan,
            datakelurahan: datakelurahan));
      }
      if (event is DatatpsSearchKecamatan) {
        List<Datatps> results = [];

        if (event.kecamatan!.isEmpty) {
          results = data!;
        } else {
          results = data!
              .where((e) => e.district_id!.contains(event.kecamatan!))
              .toList();
          foundusers = results;
          foundkelist();
        }

        emit(DatatpsLoaded(
            data: foundusers,
            datakabupaten: datakabupaten,
            dataprovinsi: dataprovinsi,
            datakecamatan: datakecamatan,
            datakelurahan: datakelurahan));
      }
      if (event is DatatpsSearch) {
        data = await auth!.caridatatps(cari: event.value);

        emit(DatatpsLoaded(
          data: data,
        ));
      }
      if (event is DatatpsSearchKelurahan) {
        List<Datatps> results = [];

        if (event.kelurahan!.isEmpty) {
          results = data!;
        } else {
          results = data!
              .where((e) => e.villages_id!.contains(event.kelurahan!))
              .toList();
          foundusers = results;
          foundkelist();
        }

        emit(DatatpsLoaded(
            data: foundusers,
            datakabupaten: datakabupaten,
            dataprovinsi: dataprovinsi,
            datakecamatan: datakecamatan,
            datakelurahan: datakelurahan));
      }
    });
  }
}
