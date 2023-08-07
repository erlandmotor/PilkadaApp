part of 'pages.dart';

class HalamanPerolehanSuara extends StatefulWidget {
  String alamat;
  String email;

  HalamanPerolehanSuara(
      {super.key, this.alamat = 'Makassar', this.email = 'email23@gmail.com'});

  @override
  State<HalamanPerolehanSuara> createState() => _HalamanPerolehanSuaraState();
}

class _HalamanPerolehanSuaraState extends State<HalamanPerolehanSuara> {
  bool saksi = false;
  String? selectedtps;
  @override
  initState() {
    var profile = context.read<DataprofileBloc>().state;
    if (profile is DataprofileLoaded) {
      if (profile.data!.role == 'saksi') {
        setState(() {
          saksi = true;
        });
      } else {
        saksi = false;
      }
    }
    context.read<DataperolehansuaraBloc>().add(DataPerolehanSuaraConnect());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          saksi != true ? FilterData() : const Text(""),
          SizedBox(height: p1.maxHeight * 0.04),
          BlocListener<DataperolehansuaraBloc, DataperolehansuaraState>(
              listener: (context, state) {
                if (state is DataPerolehanSuaraLoaded) {
                  context.read<KonekkedaerahBloc>().add(ConnectKedaerahList(
                      listprovinsi: state.provinsi,
                      listdesa: state.kelurahan,
                      listkecamatan: state.kecamatan,
                      listkabupaten: state.kabupaten));
                }
              },
              child: Container()),
          SizedBox(
              width: p1.maxWidth,
              height: saksi != true ? p1.maxHeight * 0.5 : p1.maxHeight * 0.8,
              child:
                  BlocBuilder<DataperolehansuaraBloc, DataperolehansuaraState>(
                builder: (context, state) {
                  return state is DataPerolehanSuaraLoaded
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
                                                duration: Duration(seconds: 2)),
                                            ScaleEffect(
                                                duration: Duration(seconds: 1))
                                          ],
                                          child: Container(
                                            width: p1.maxWidth,
                                            height: p1.maxHeight * 0.2,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.5),
                                                      spreadRadius: 0.5,
                                                      blurRadius: 5,
                                                      offset:
                                                          const Offset(2, 4))
                                                ],
                                                border: Border.all(
                                                    color:
                                                        hitam.withOpacity(0.5),
                                                    width: 1.0),
                                                color: pinkabu,
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            child: LayoutBuilder(
                                              builder: (p0, p2) => Padding(
                                                padding: EdgeInsets.only(
                                                    top: p1.maxHeight * 0.02,
                                                    left: p1.maxHeight * 0.02,
                                                    right: p1.maxHeight * 0.02),
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          'TPS ${state.data![index].tps_id}',
                                                          style: textpoppin.copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize:
                                                                  p2.maxHeight *
                                                                      0.12)),
                                                      Row(children: [
                                                        Container(
                                                            width: p2.maxWidth *
                                                                0.05,
                                                            height: p2
                                                                    .maxHeight *
                                                                0.05,
                                                            decoration:
                                                                const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color:
                                                                        abuabu)),
                                                        Text(
                                                            "SAKSI ${state.data![index].saksi_id}",
                                                            style: textpoppin
                                                                .copyWith(
                                                                    color:
                                                                        hitam,
                                                                    fontSize:
                                                                        p2.maxHeight *
                                                                            0.07))
                                                      ]),
                                                      Row(
                                                        children: [
                                                          Text(
                                                              "JUMLAH SUARA SAH ${state.data![index].jml_suara_sah}",
                                                              style: textpoppin
                                                                  .copyWith(
                                                                      color:
                                                                          hitam,
                                                                      fontSize:
                                                                          p2.maxHeight *
                                                                              0.07)),
                                                          const SizedBox(
                                                              width: 12),
                                                          Text(
                                                              "JUMLAH SUARA TIDAK SAH ${state.data![index].jml_suara_tidaksah}",
                                                              style: textpoppin
                                                                  .copyWith(
                                                                      color:
                                                                          hitam,
                                                                      fontSize:
                                                                          p2.maxHeight *
                                                                              0.07)),
                                                        ],
                                                      ),
                                                      Text(
                                                          "KABUPATEN '${daerah.listkabupaten![index]}",
                                                          style: textpoppin.copyWith(
                                                              color: hitam,
                                                              fontSize:
                                                                  p2.maxHeight *
                                                                      0.07)),
                                                      Text(
                                                          "KECAMATAN ${daerah.listkecamatan![index]}",
                                                          style: textpoppin.copyWith(
                                                              color: hitam,
                                                              fontSize:
                                                                  p2.maxHeight *
                                                                      0.07)),
                                                      Text(
                                                          "KELURAHAN ${daerah.listdesa![index]}",
                                                          style: textpoppin.copyWith(
                                                              color: hitam,
                                                              fontSize:
                                                                  p2.maxHeight *
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
              width: p1.maxWidth * 0.7, height: p1.maxHeight * 0.05, hps: true)
        ],
      ),
    );
  }
}
