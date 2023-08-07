part of 'pages.dart';

class HalamanDatarelawancoba extends StatefulWidget {
  String gambar;
  String namarelawan;
  String gruprelawan;

  HalamanDatarelawancoba(
      {super.key,
      this.namarelawan = 'Relawan 1',
      this.gruprelawan = 'Group 1',
      this.gambar = ''});

  @override
  State<HalamanDatarelawancoba> createState() => _HalamanDatarelawancobaState();
}

class _HalamanDatarelawancobaState extends State<HalamanDatarelawancoba> {
  bool relawan_biasa = false;
  bool isselect = false;
  bool isselect2 = false;
  @override
  initState() {
    var profile = context.read<DataprofileBloc>().state;
    if (profile is DataprofileLoaded) {
      if (profile.data!.role == 'relawan_biasa') {
        setState(() {
          relawan_biasa = true;
        });
        context.read<DatarelawanBloc>().add(DataRelawanBiasaConnect());
      } else {
        context.read<DatarelawanBloc>().add(DataRelawanUtamaConnect());
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ContainerSearch(
                width: p1.maxWidth * 0.81,
                height: p1.maxHeight * 0.07,
                hinttext: 'Cari Nama Relawan',
                cari: (value) {
                  if (isselect == true) {
                    context
                        .read<DatarelawanBloc>()
                        .add(DatarelawanUtamaSearch(value: value));
                  }
                  if (isselect2 = true) {
                    context
                        .read<DatarelawanBloc>()
                        .add(DatarelawanBiasaSearch(value: value));
                  }
                },
              ),
              BlocBuilder<DataprofileBloc, DataprofileState>(
                builder: (context, state) {
                  if (state is DataprofileLoaded) {
                    if (state.data!.role == 'admin') {
                      return const Text("");
                    }
                  }
                  return ContainerTambah(
                    width: p1.maxWidth * 0.15,
                    height: p1.maxHeight * 0.07,
                    fungsi: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HalamanTemplateBaru(
                                    nama: 'Tambah Relawan',
                                    halamandata:
                                        const HalamanTambahDataRelawan(),
                                  )));
                    },
                  );
                },
              )
            ],
          ),
          SizedBox(
            height: p1.maxHeight * 0.04,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            relawan_biasa != true
                ? ButtonUtama(
                    width: p1.maxWidth * 0.4,
                    height: p1.maxHeight * 0.05,
                    namabutton: 'Relawan Utama',
                    color: isselect != true ? birumuda : pinkabu,
                    voidcallback: () {
                      setState(() {
                        isselect = true;
                        isselect2 = false;
                      });
                      context
                          .read<DatarelawanBloc>()
                          .add(DataRelawanUtamaConnect());
                    })
                : const Text(""),
            ButtonUtama(
                width: relawan_biasa == true ? p1.maxWidth : p1.maxWidth * 0.4,
                height: p1.maxHeight * 0.05,
                color: isselect2 != true ? birumuda : pinkabu,
                voidcallback: () {
                  setState(() {
                    isselect2 = true;
                    isselect = false;
                  });
                  context
                      .read<DatarelawanBloc>()
                      .add(DataRelawanBiasaConnect());
                },
                namabutton: 'Relawan Biasa'),
          ]),
          SizedBox(
              width: p1.maxWidth,
              height: p1.maxHeight * 0.75,
              child: BlocBuilder<DatarelawanBloc, DatarelawanState>(
                builder: (context, state) {
                  return state is DataRelawanLoaded
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
                                      FadeEffect(
                                          duration: Duration(seconds: 1)),
                                      ScaleEffect(
                                          duration: Duration(seconds: 1))
                                    ],
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HalamanTemplateBaru(
                                                      nama: 'Detail Relawan',
                                                      halamandata:
                                                          HalamanDetailRelawan(
                                                        relawanbiasa:
                                                            relawan_biasa,
                                                        kabupaten:
                                                            '${state.data![index].regency_id}',
                                                        kecamatan:
                                                            '${state.data![index].district_id}',
                                                        kelurahan:
                                                            '${state.data![index].villages_id}',
                                                        id: '${state.data![index].id}',
                                                        foto:
                                                            '${state.data![index].photo}',
                                                        alamat:
                                                            '${state.data![index].alamat}',
                                                        relawan:
                                                            '${state.data![index].nama}',
                                                        noktp:
                                                            '${state.data![index].nik}',
                                                        fotoktp:
                                                            '${state.data![index].scan_ktp}',
                                                        notelepon:
                                                            '${state.data![index].no_wa}',
                                                        agama:
                                                            '${state.data![index].agama}',
                                                        jeniskelamin:
                                                            '${state.data![index].jkl}',
                                                      ),
                                                    )));
                                      },
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
                                                  offset: const Offset(2, 4))
                                            ],
                                            color: abuabu,
                                            borderRadius:
                                                BorderRadius.circular(25)),
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
                                                children: [
                                                  Text(
                                                      "${state.data![index].nama}",
                                                      style:
                                                          textpoppin.copyWith(
                                                              color: hitam,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize:
                                                                  p2.maxHeight *
                                                                      0.2)),
                                                  Row(children: [
                                                    Text(
                                                        "${state.data![index].no_wa}",
                                                        style:
                                                            textpoppin.copyWith(
                                                                color: hitam,
                                                                fontSize:
                                                                    p2.maxHeight *
                                                                        0.15)),
                                                    Container(
                                                        width:
                                                            p2.maxWidth * 0.1,
                                                        height:
                                                            p2.maxHeight * 0.1,
                                                        decoration:
                                                            const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color:
                                                                    pinkabu)),
                                                  ]),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ))
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
          BlocBuilder<DatarelawanBloc, DatarelawanState>(
            builder: (context, state) {
              return state is DataRelawanLoaded
                  ? Text("Total Data ${state.data!.length}",
                      style: TextStyle(fontWeight: FontWeight.bold))
                  : Text("");
            },
          ),
          Pagination(
              width: p1.maxWidth * 0.7,
              height: p1.maxHeight * 0.05,
              relawan: true)
        ],
      ),
    );
  }
}
