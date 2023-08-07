import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pilkada/services/AuthService.dart';

import '../../models/Desa.dart';
import '../../models/Kabupaten.dart';
import '../../models/Kecamatan.dart';
import '../../models/Provinsi.dart';
part 'konekkedaerah_event.dart';
part 'konekkedaerah_state.dart';

class KonekkedaerahBloc extends Bloc<KonekkedaerahEvent, KonekkedaerahState> {
  KonekkedaerahBloc({Authentication? auth}) : super(KonekkedaerahInitial()) {
    auth = Authentication();
    List<DataProvinsi>? provinsi;
    List<DataKabupaten>? kabupaten;
    List<DataKecamatan>? kecamatan;
    List<DataDesa>? desa;
    List<String>? listprovinsi;
    List<String>? listkabupaten;
    List<String>? listkecamatan;
    List<String>? listdesa;
    String dataprovinsi = '';
    String datakabupaten = '';
    String datakecamatan = '';
    String datadesa = '';
    konekdaerah() async {
      provinsi = await auth!.getdataprovinsi();
      kabupaten = await auth.getdatakabupaten();
      kecamatan = await auth.getdatakecamatan();
      desa = await auth.getdatadesa();
    }

    on<KonekkedaerahEvent>((event, emit) async {
      if (event is KonekDaerahdulu) {
        await konekdaerah();
      }

      if (event is ConnectKedaerah) {
        if (event.provinsi != null) {
          dataprovinsi = provinsi!
              .firstWhere((e) => e.id.toString() == event.provinsi.toString())
              .name
              .toString();
        }
        if (event.kabupaten != null) {
          datakabupaten = kabupaten!
              .firstWhere((e) => e.id.toString() == event.kabupaten.toString())
              .name
              .toString();
        }
        if (event.kecamatan != null) {
          datakecamatan = kecamatan!
              .firstWhere((e) => e.id.toString() == event.kecamatan.toString())
              .name
              .toString();
        }
        if (event.kelurahan != null) {
          datadesa = desa!
              .firstWhere((e) => e.id.toString() == event.kelurahan.toString())
              .name
              .toString();
        }

        emit(KonekDaerahLoaded(
            dataprovinsi: dataprovinsi,
            datakabupaten: datakabupaten,
            datakecamatan: datakecamatan,
            datakelurahan: datadesa));
      }
      if (event is ConnectKedaerahList) {
        if (event.listprovinsi != null) {
          listprovinsi = [
            for (var x in event.listprovinsi!)
              provinsi!
                  .firstWhere((e) => e.id.toString() == x.toString())
                  .name
                  .toString()
          ];
        }
        if (event.listkabupaten != null) {
          listkabupaten = [
            for (var x in event.listkabupaten!)
              kabupaten!
                  .firstWhere((e) => e.id.toString() == x.toString())
                  .name
                  .toString()
          ];
        }
        if (event.listkecamatan != null) {
          listkecamatan = [
            for (var x in event.listkecamatan!)
              kecamatan!
                  .firstWhere((e) => e.id.toString() == x.toString())
                  .name
                  .toString()
          ];
        }
        if (event.listdesa != null) {
          listdesa = [
            for (var x in event.listdesa!)
              desa!
                  .firstWhere((e) => e.id.toString() == x.toString())
                  .name
                  .toString()
          ];
        }

        emit(KonekDaerahLoadedList(
            listprovinsi: listprovinsi,
            listkabupaten: listkabupaten,
            listkecamatan: listkecamatan,
            listdesa: listdesa));
      }
    });
  }
}
