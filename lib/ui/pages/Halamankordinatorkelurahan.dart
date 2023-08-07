part of 'pages.dart';

class Halamankordinatorkelurahan extends StatefulWidget {
  const Halamankordinatorkelurahan({super.key});

  @override
  State<Halamankordinatorkelurahan> createState() =>
      _HalamankordinatorkelurahanState();
}

class _HalamankordinatorkelurahanState
    extends State<Halamankordinatorkelurahan> {
  bool mastercampaign = false;
  @override
  initState() {
    context
        .read<KordinatorkelurahanBloc>()
        .add(DataKoordinatorKelurahanConnect());
    var profile = context.read<DataprofileBloc>().state;
    if (profile is DataprofileLoaded) {
      if (profile.data!.role == 'campaign') {
        setState(() {
          mastercampaign = true;
        });
      } else {
        mastercampaign = false;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) =>
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        FilterData(
          kordinator: true,
        ),
        const SizedBox(height: 4),
        ContainerSearch(
          width: p1.maxWidth,
          height: p1.maxHeight * 0.07,
          hinttext: 'Cari Nama Koordinator',
          cari: (value) => context
              .read<KordinatorkelurahanBloc>()
              .add(DataKoordinatorKelurahanSearch(value: value)),
        ),
        SizedBox(
            width: p1.maxWidth,
            height: p1.maxHeight * 0.6,
            child:
                BlocBuilder<KordinatorkelurahanBloc, KordinatorkelurahanState>(
              builder: (context, state) {
                return state is DataKoordinatorKelurahanLoaded
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
                                                nama: 'Detail Koordinator',
                                                halamandata: HalamanDetailKoordinator(
                                                    koordinator:
                                                        '${state.data![index].nama}',
                                                    noktp:
                                                        '${state.data![index].nik}',
                                                    notelepon:
                                                        '${state.data![index].no_wa}',
                                                    agama:
                                                        '${state.data![index].agama}',
                                                    kecamatan:
                                                        '${state.data![index].district_id}',
                                                    kelurahan:
                                                        '${state.data![index].villages_id}',
                                                    provinsi:
                                                        '${state.data![index].Province_id}',
                                                    kabupaten:
                                                        '${state.data![index].regency_id}',
                                                    foto:
                                                        '${state.data![index].photo}'),
                                              )));
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
                                      borderRadius: BorderRadius.circular(25)),
                                  child: LayoutBuilder(
                                    builder: (p0, p2) => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        CircleAvatar(
                                          radius: 30,
                                          backgroundImage: NetworkImage(
                                              'https://websisfopilkada.taekwondosulsel.info/public/storage/${state.data![index].photo}'),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text("${state.data![index].nama}",
                                                style: textpoppin.copyWith(
                                                    color: hitam,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize:
                                                        p2.maxHeight * 0.2)),
                                            Row(children: [
                                              Container(
                                                  width: p2.maxWidth * 0.1,
                                                  height: p2.maxHeight * 0.1,
                                                  decoration:
                                                      const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: pinkabu)),
                                              Text(
                                                  '${state.data![index].alamat}',
                                                  style: textpoppin.copyWith(
                                                      color: hitam,
                                                      fontSize:
                                                          p2.maxHeight * 0.1))
                                            ]),
                                            Row(children: [
                                              Container(
                                                  width: p2.maxWidth * 0.1,
                                                  height: p2.maxHeight * 0.1,
                                                  decoration:
                                                      const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: pinkabu)),
                                              Text('${state.data![index].nik}',
                                                  style: textpoppin.copyWith(
                                                      color: hitam,
                                                      fontSize:
                                                          p2.maxHeight * 0.1)),
                                            ]),
                                            Row(children: [
                                              Container(
                                                  width: p2.maxWidth * 0.1,
                                                  height: p2.maxHeight * 0.1,
                                                  decoration:
                                                      const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: pinkabu)),
                                              Text(
                                                  '${state.data![index].no_wa}',
                                                  style: textpoppin.copyWith(
                                                      color: hitam,
                                                      fontSize:
                                                          p2.maxHeight * 0.1)),
                                            ]),
                                          ],
                                        ),
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
        mastercampaign == true
            ? ButtonUtama(
                width: p1.maxWidth,
                height: p1.maxHeight * 0.05,
                voidcallback: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HalamanTemplateBaru(
                              nama: 'Tambah Koordinator',
                              halamandata:
                                  const HalamanTambahDataKoordinator())));
                },
                namabutton: 'Tambah Data')
            : const Text(""),
        const SizedBox(height: 0.04),
        Pagination(
            width: p1.maxWidth * 0.7,
            height: p1.maxHeight * 0.05,
            kordinator: true)
      ]),
    );
  }
}
