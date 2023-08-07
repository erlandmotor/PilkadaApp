part of 'pages.dart';

class HalamanAksesoris extends StatefulWidget {
  String nama;
  String alamat;
  String ket;

  HalamanAksesoris(
      {super.key,
      this.nama = 'Nama 1',
      this.alamat = 'Makassar',
      this.ket = '-'});

  @override
  State<HalamanAksesoris> createState() => _HalamanAksesorisState();
}

class _HalamanAksesorisState extends State<HalamanAksesoris> {
  String? itemaksesoris;
  bool kordinator = false;
  @override
  initState() {
    context.read<DataaksesorisBloc>().add(DataaksesorisConnect());
    var profile = context.read<DataprofileBloc>().state;
    if (profile is DataprofileLoaded) {
      if (profile.data!.role == 'kordinator') {
        setState(() {
          kordinator = true;
        });
      } else {
        kordinator = false;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FilterData(),
          SizedBox(
            height: p1.maxHeight * 0.02,
          ),
          ContainerSearch(
            width: p1.maxWidth,
            height: p1.maxHeight * 0.07,
            hinttext: 'Cari Nama Penerima',
            cari: (value) => context
                .read<DataaksesorisBloc>()
                .add(DataaksesorisSearch(value: value)),
          ),
          SizedBox(
              width: p1.maxWidth,
              height: p1.maxHeight * 0.5,
              child: BlocBuilder<DataaksesorisBloc, DataaksesorisState>(
                builder: (context, state) {
                  return state is Dataaksesorisloaded
                      ? state.data!.isNotEmpty
                          ? GridView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: state.data!.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: (1 / .22),
                                      crossAxisCount: 1,
                                      mainAxisSpacing: p1.maxHeight * 0.02,
                                      crossAxisSpacing: 5),
                              itemBuilder: (context, index) => Animate(
                                effects: const [
                                  FadeEffect(duration: Duration(seconds: 2)),
                                  ScaleEffect(duration: Duration(seconds: 1))
                                ],
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HalamanTemplateBaru(
                                                    nama: 'Penerima Aksesoris',
                                                    halamandata:
                                                        DetailAksesoris(
                                                      namapenerima: state
                                                          .listrelawan![index],
                                                      gambar:
                                                          '${state.data![index].foto_bukti}',
                                                      relawanpemberi:
                                                          '${state.data![index].relawan_id}',
                                                      jenisaksesoris:
                                                          state.jenisaksesoris![
                                                              index],
                                                      serahterima:
                                                          '${state.data![index].tanggal_terima}',
                                                    ))));
                                  },
                                  child: Container(
                                    width: p1.maxWidth,
                                    height: p1.maxHeight * 0.2,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              spreadRadius: 0.5,
                                              blurRadius: 5,
                                              offset: const Offset(2, 4))
                                        ],
                                        color: abuabu,
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: LayoutBuilder(
                                      builder: (p0, p2) => Column(
                                        children: [
                                          Row(children: [
                                            Container(
                                                width: p2.maxWidth * 0.1,
                                                height: p2.maxHeight * 0.1,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: pinkabu)),
                                            Text(state.listrelawan![index],
                                                style: textpoppin.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: hitam,
                                                    fontSize:
                                                        p2.maxHeight * 0.2)),
                                          ]),
                                          Row(children: [
                                            Container(
                                                width: p2.maxWidth * 0.1,
                                                height: p2.maxHeight * 0.1,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: pinkabu)),
                                            Text(state.jenisaksesoris![index],
                                                style: textpoppin.copyWith(
                                                    color: hitam,
                                                    fontSize:
                                                        p2.maxHeight * 0.2))
                                          ]),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Center(
                              child: Text(
                              "Data Tidak Ditemukan",
                              style: textpoppin.copyWith(
                                  fontSize: p1.maxWidth * 0.04),
                            ))
                      : const SpinKitDualRing(
                          color: birumuda,
                        );
                },
              )),
          kordinator == true
              ? ButtonUtama(
                  width: p1.maxWidth,
                  height: p1.maxHeight * 0.05,
                  namabutton: 'Tambah Penerima',
                  voidcallback: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HalamanTemplateBaru(
                                nama: 'Tambah Penerima',
                                halamandata:
                                    const HalamanTambahDataAksesoris())));
                  })
              : const Text(""),
          Pagination(
            width: p1.maxWidth * 0.7,
            height: p1.maxHeight * 0.05,
            penerimaakses: true,
          )
        ],
      ),
    );
  }
}
