import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/berita.dart';
import '../../services/AuthService.dart';

part 'berita_event.dart';
part 'berita_state.dart';

class BeritaBloc extends Bloc<BeritaEvent, BeritaState> {
  BeritaBloc({Authentication? auth}) : super(BeritaInitial()) {
    auth = Authentication();
    on<BeritaEvent>((event, emit) async {
      if (event is BeritaConnect) {
        var data = await auth!.getdataberita();
        emit(BeritaLoaded(berita: data));
      }
      if (event is CariBerita) {
        var data = await auth!.caridataberita(cari: event.cari);
        emit(BeritaLoaded(berita: data));
      }
    });
  }
}
