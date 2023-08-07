part of 'widgets.dart';

class Pagination extends StatelessWidget {
  final double width;
  final double height;
  final bool tps;
  final bool relawan;
  final bool kordinator;
  final bool saksi;
  final bool penerimaakses;
  final bool kecurangan;
  final bool hps;
  const Pagination(
      {Key? key,
      required this.width,
      required this.height,
      this.tps = false,
      this.saksi = false,
      this.hps = false,
      this.kordinator = false,
      this.kecurangan = false,
      this.penerimaakses = false,
      this.relawan = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      margin: const EdgeInsets.only(top: 3),
      width: width,
      height: height,
      decoration:
          BoxDecoration(color: abuabu, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: TextButton(
              onPressed: () {
                tps == true
                    ? context.read<DatatpsBloc>().add(Datatpsconnect(page: '1'))
                    : () {};
                relawan == true
                    ? context
                        .read<DatarelawanBloc>()
                        .add(DataRelawanUtamaConnect(id: '1'))
                    : () {};
                kordinator == true
                    ? context
                        .read<DatakoordinatorBloc>()
                        .add(DataKoordinatorConnect(page: '1'))
                    : () {};
                saksi == true
                    ? context
                        .read<DatasaksiBloc>()
                        .add(DatasaksiConnect(page: '1'))
                    : () {};
                penerimaakses == true
                    ? context
                        .read<DataaksesorisBloc>()
                        .add(DataaksesorisConnect(page: '1'))
                    : () {};
                hps == true
                    ? context
                        .read<DataperolehansuaraBloc>()
                        .add(DataPerolehanSuaraConnect(page: '1'))
                    : () {};
                kecurangan == true
                    ? context
                        .read<DataKecuranganBloc>()
                        .add(DataKecuranganConnect(page: '1'))
                    : () {};
              },
              child: const Text("1"),
            ),
          ),
          Flexible(
            flex: 1,
            child: TextButton(
              onPressed: () {
                tps == true
                    ? context.read<DatatpsBloc>().add(Datatpsconnect(page: '2'))
                    : () {};
                relawan == true
                    ? context
                        .read<DatarelawanBloc>()
                        .add(DataRelawanUtamaConnect(id: '2'))
                    : () {};
                kordinator == true
                    ? context
                        .read<DatakoordinatorBloc>()
                        .add(DataKoordinatorConnect(page: '2'))
                    : () {};
                saksi == true
                    ? context
                        .read<DatasaksiBloc>()
                        .add(DatasaksiConnect(page: '2'))
                    : () {};
                penerimaakses == true
                    ? context
                        .read<DataaksesorisBloc>()
                        .add(DataaksesorisConnect(page: '2'))
                    : () {};
                hps == true
                    ? context
                        .read<DataperolehansuaraBloc>()
                        .add(DataPerolehanSuaraConnect(page: '2'))
                    : () {};
                kecurangan == true
                    ? context
                        .read<DataKecuranganBloc>()
                        .add(DataKecuranganConnect(page: '2'))
                    : () {};
              },
              child: const Text("2"),
            ),
          ),
          Flexible(
            flex: 1,
            child: TextButton(
              onPressed: () {
                tps == true
                    ? context.read<DatatpsBloc>().add(Datatpsconnect(page: '3'))
                    : () {};
                relawan == true
                    ? context
                        .read<DatarelawanBloc>()
                        .add(DataRelawanUtamaConnect(id: '3'))
                    : () {};
                kordinator == true
                    ? context
                        .read<DatakoordinatorBloc>()
                        .add(DataKoordinatorConnect(page: '3'))
                    : () {};
                saksi == true
                    ? context
                        .read<DatasaksiBloc>()
                        .add(DatasaksiConnect(page: '3'))
                    : () {};
                penerimaakses == true
                    ? context
                        .read<DataaksesorisBloc>()
                        .add(DataaksesorisConnect(page: '3'))
                    : () {};
                hps == true
                    ? context
                        .read<DataperolehansuaraBloc>()
                        .add(DataPerolehanSuaraConnect(page: '3'))
                    : () {};
                kecurangan == true
                    ? context
                        .read<DataKecuranganBloc>()
                        .add(DataKecuranganConnect(page: '3'))
                    : () {};
              },
              child: const Text("3"),
            ),
          ),
          Flexible(
            flex: 1,
            child: TextButton(
              onPressed: () {
                tps == true
                    ? context.read<DatatpsBloc>().add(Datatpsconnect(page: '4'))
                    : () {};
                relawan == true
                    ? context
                        .read<DatarelawanBloc>()
                        .add(DataRelawanUtamaConnect(id: '4'))
                    : () {};
                kordinator == true
                    ? context
                        .read<DatakoordinatorBloc>()
                        .add(DataKoordinatorConnect(page: '4'))
                    : () {};
                saksi == true
                    ? context
                        .read<DatasaksiBloc>()
                        .add(DatasaksiConnect(page: '4'))
                    : () {};
                penerimaakses == true
                    ? context
                        .read<DataaksesorisBloc>()
                        .add(DataaksesorisConnect(page: '4'))
                    : () {};
                hps == true
                    ? context
                        .read<DataperolehansuaraBloc>()
                        .add(DataPerolehanSuaraConnect(page: '4'))
                    : () {};
                kecurangan == true
                    ? context
                        .read<DataKecuranganBloc>()
                        .add(DataKecuranganConnect(page: '4'))
                    : () {};
              },
              child: const Text("4"),
            ),
          ),
        ],
      ),
    ));
  }
}
