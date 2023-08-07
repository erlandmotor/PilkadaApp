part of 'pages.dart';

class Role extends StatelessWidget {
  const Role({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>();
    context.read<DataprofileBloc>();
    context.read<DatadashboardBloc>().add(DatadashboardConnectAdmin());
    context.read<KonekkedaerahBloc>().add(ConnectKedaerah(
        provinsi: '11',
        kabupaten: '1101',
        kecamatan: '1101010',
        kelurahan: '1101010001'));
    context.read<KonekkedaerahBloc>().add(ConnectKedaerahList(listprovinsi: [
          '11',
          '11',
          '11',
          '11',
          '11',
          '11'
        ], listkabupaten: [
          '1101',
          '1101',
          '1101',
          '1101',
          '1101',
          '1101'
        ], listkecamatan: [
          '1101010',
          '1101010' '1101010',
          '1101010',
          '1101010',
          '1101010',
        ], listdesa: [
          '1101010001',
          '1101010001' '1101010001',
          '1101010001',
          '1101010001',
          '1101010001',
        ]));

    context.read<BeritaBloc>().add(BeritaConnect());

    return BlocBuilder<DataprofileBloc, DataprofileState>(
      builder: (context, state) {
        if (state is DataprofileLoaded) {
          if (state.data!.role == 'admin') {
            return HomePageBaru(haldata: HalamanDataAdmin());
          }
          if (state.data!.role == 'saksi') {
            return HomePageBaru(haldata: HalamanDataSaksi());
          }
          if (state.data!.role == 'calek') {
            return HomePageBaru(haldata: HalamanDataAdmin());
          }
          if (state.data!.role == 'kordinator') {
            return HomePageBaru(
              haldata: HalamanDataKoordinator(),
            );
          }
          if (state.data!.role == 'campaign') {
            return HomePageBaru(
              haldata: HalamanDataAdmin(),
            );
          }
          if (state.data!.role == 'relawan_utama') {
            return HomePageBaru(
              haldata: HalamanDataRelawann(),
            );
          }
          if (state.data!.role == 'relawan_biasa') {
            return HomePageBaru(
              haldata: HalamanDataRelawann(),
            );
          }
          if (state.data!.role == 'cabup') {
            return HomePageBaru(haldata: HalamanDataCalek());
          }
        }
        return const HalamanLoading();
      },
    );
  }
}
