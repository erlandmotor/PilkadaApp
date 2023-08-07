part of 'pages.dart';

class KecuranganPilkada extends StatefulWidget {
  String tps;
  String provinsi;
  String kabupaten;
  String kecamatan;
  String keterangan;

  KecuranganPilkada(
      {super.key,
      this.tps = '001',
      this.provinsi = 'Sulawesi Selatan',
      this.kabupaten = 'Makassar',
      this.kecamatan = 'Tamalanrea',
      this.keterangan = '-'});

  @override
  State<KecuranganPilkada> createState() => _KecuranganPilkadaState();
}

class _KecuranganPilkadaState extends State<KecuranganPilkada> {
  Authentication auth = Authentication();
  List<String> kota = [];
  List<String> itemtps = [];

  @override
  void initState() {
    context.read<DataKecuranganBloc>().add(DataKecuranganConnect());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocListener<DataKecuranganBloc, DataKecuranganState>(
                listener: (context, state) {
                  if (state is DataKecuranganLoaded) {
                    context.read<KonekkedaerahBloc>().add(ConnectKedaerahList(
                        listdesa: state.kelurahan,
                        listkecamatan: state.kecamatan,
                        listkabupaten: state.kabupaten));
                  }
                },
                child: Container()),
            FilterData(),
            SizedBox(
                width: p1.maxWidth,
                height: p1.maxHeight * 0.65,
                child: BlocBuilder<DataKecuranganBloc, DataKecuranganState>(
                  builder: (context, state) {
                    return state is DataKecuranganLoaded
                        ? state.data!.isNotEmpty
                            ? GridView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: state.data!.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: (1 / .4),
                                        crossAxisCount: 1,
                                        mainAxisSpacing: p1.maxHeight * 0.02,
                                        crossAxisSpacing: 5),
                                itemBuilder: (context, index) => BlocBuilder<
                                    KonekkedaerahBloc, KonekkedaerahState>(
                                  builder: (context, daerah) {
                                    return daerah is KonekDaerahLoadedList
                                        ? Animate(
                                            effects: const [
                                              FadeEffect(
                                                  duration:
                                                      Duration(seconds: 1)),
                                              ScaleEffect(
                                                  duration:
                                                      Duration(seconds: 1))
                                            ],
                                            child: Container(
                                              width: p1.maxWidth,
                                              height: p1.maxHeight * 0.06,
                                              decoration: BoxDecoration(
                                                  color: abuabu,
                                                  borderRadius:
                                                      BorderRadius.circular(17),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.5),
                                                        spreadRadius: 0.5,
                                                        blurRadius: 5,
                                                        offset:
                                                            const Offset(2, 4))
                                                  ]),
                                              child: LayoutBuilder(
                                                builder: (p0, p2) => Padding(
                                                  padding: EdgeInsets.only(
                                                      left: p2.maxWidth * 0.1),
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            'TPS ${state.data![index].tps_id}',
                                                            style: textpoppin.copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize:
                                                                    p2.maxHeight *
                                                                        0.15)),
                                                        SizedBox(
                                                            height:
                                                                p2.maxHeight *
                                                                    0.05),
                                                        Text(
                                                            '${state.data![index].nama_kecurangan}\n${state.data![index].deskripsi}',
                                                            style: textpoppin),
                                                        Text(
                                                            '${daerah.listkabupaten![index]} | ${daerah.listkecamatan![index]} | ${daerah.listdesa![index]}',
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: textpoppin
                                                                .copyWith(
                                                                    color:
                                                                        hitam,
                                                                    fontSize: p2
                                                                            .maxHeight *
                                                                        0.07)),
                                                      ]),
                                                ),
                                              ),
                                            ),
                                          )
                                        : CircularProgressIndicator();
                                  },
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
            Pagination(
              width: p1.maxWidth * 0.7,
              height: p1.maxHeight * 0.05,
              kecurangan: true,
            )
          ],
        ),
      ),
    );
  }
}
