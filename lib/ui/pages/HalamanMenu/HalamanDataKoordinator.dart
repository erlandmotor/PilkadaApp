part of '../pages.dart';

class HalamanDataKoordinator extends StatelessWidget {
  List gambar = [
    'assets/icon1.svg',
    'assets/icon3.svg',
    'assets/icon4.svg',
    'assets/icon6.svg',
    'assets/icon7.svg',
    'assets/kecuranganpilkada.svg'
  ];
  List nama = ['TPS', 'RELAWAN', 'DPT', 'SAKSI TPS', 'AKSESORIS', 'KECURANGAN'];

  HalamanDataKoordinator({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: p1.maxWidth,
              height: p1.maxHeight,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: nama.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1),
                itemBuilder: (context, index) => ContainerDatabaru(
                  fungsi: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => (index == 0)
                                ? HalamanTemplateawal(
                                    nama: 'Data Tps',
                                    halamandata: HalamanDataTps())
                                : (index == 1)
                                    ? HalamanTemplateawal(
                                        nama: 'Relawan',
                                        halamandata: HalamanDatarelawancoba())
                                    : (index == 2)
                                        ? HalamanTemplateawal(
                                            nama: 'Data DPT',
                                            halamandata:
                                                const HalamanJumlahdpt())
                                        : (index == 3)
                                            ? HalamanTemplateawal(
                                                nama: 'Data Saksi',
                                                halamandata:
                                                    HalamanDataSaksitps())
                                            : (index == 4)
                                                ? HalamanTemplateawal(
                                                    nama: 'Penerima Aksesoris',
                                                    halamandata:
                                                        HalamanAksesoris())
                                                : (index == 5)
                                                    ? HalamanTemplateawal(
                                                        nama:
                                                            'Kecurangan Pilkada',
                                                        halamandata:
                                                            KecuranganPilkada())
                                                    : const Text("")));
                  },
                  gambar: gambar[index],
                  nama: nama[index],
                  width: p1.maxWidth * 0.25,
                  height: p1.maxHeight * 0.15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
