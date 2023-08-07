part of 'pages.dart';

class HalamanDataTps extends StatefulWidget {
  String tps;
  String provinsi;
  String kabupaten;
  String kecamatan;
  String keterangan;

  HalamanDataTps(
      {super.key,
      this.tps = '001',
      this.provinsi = 'Sulawesi Selatan',
      this.kabupaten = 'Makassar',
      this.kecamatan = 'Tamalanrea',
      this.keterangan = '-'});

  @override
  State<HalamanDataTps> createState() => _HalamanDataTpsState();
}

class _HalamanDataTpsState extends State<HalamanDataTps> {
  Authentication auth = Authentication();
  List<String> kota = [];
  List<String> itemtps = [];
  int page = 4 + 1;

  @override
  initState() {
    // context.read<KonekkedaerahBloc>().add(ConnectKedaerahList());
    context.read<DatatpsBloc>().add(Datatpsconnect(page: '1'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocListener<DatatpsBloc, DatatpsState>(
                listener: (context, state) {
                  if (state is DatatpsLoaded) {
                    context.read<KonekkedaerahBloc>().add(ConnectKedaerahList(
                        listprovinsi: state.dataprovinsi,
                        listdesa: state.datakelurahan,
                        listkecamatan: state.datakecamatan,
                        listkabupaten: state.datakabupaten));
                  }
                },
                child: Container()),
            FilterData(),
            SizedBox(
                width: p1.maxWidth,
                height: p1.maxHeight * 0.6,
                child: BlocBuilder<DatatpsBloc, DatatpsState>(
                  builder: (context, state) {
                    return state is DatatpsLoaded
                        ? state.data!.isNotEmpty
                            ? GridView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: state.data!.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: (9 / 4),
                                        crossAxisCount: 1,
                                        mainAxisSpacing: p1.maxHeight * 0.02,
                                        crossAxisSpacing: 5),
                                itemBuilder: (context, index) => BlocBuilder<
                                        KonekkedaerahBloc, KonekkedaerahState>(
                                      builder: (context, daerah) {
                                        return daerah is KonekDaerahLoadedList
                                            ? ContainerTps(
                                                width: p1.maxWidth,
                                                height: p1.maxHeight * 0.06,
                                                alamat:
                                                    state.data![index].alamat,
                                                kabupaten:
                                                    '${daerah.listkabupaten![index]}',
                                                kecamatan:
                                                    '${daerah.listkecamatan![index]}',
                                                kelurahan:
                                                    '${daerah.listdesa![index]}',
                                                tps:
                                                    state.data![index].nama_tps)
                                            : CircularProgressIndicator();
                                      },
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
            BlocBuilder<DatatpsBloc, DatatpsState>(
              builder: (context, state) {
                return state is DatatpsLoaded
                    ? Text("Total Data ${state.data!.length}",
                        style: TextStyle(fontWeight: FontWeight.bold))
                    : Text("");
              },
            ),
            Pagination(
                width: p1.maxWidth * 0.7,
                height: p1.maxHeight * 0.05,
                tps: true)
          ],
        ),
      ),
    );
  }
}

class ContainerTps extends StatefulWidget {
  final double width;
  final double height;
  String? tps;
  String? alamat;
  String kabupaten;
  String kecamatan;
  String kelurahan;
  ContainerTps({
    required this.width,
    required this.height,
    this.alamat = '',
    this.kabupaten = '',
    this.kecamatan = '',
    this.kelurahan = '',
    this.tps = '',
    super.key,
  });

  @override
  State<ContainerTps> createState() => _ContainerTpsState();
}

class _ContainerTpsState extends State<ContainerTps> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            color: abuabu,
            borderRadius: BorderRadius.circular(17),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 0.5,
                  blurRadius: 5,
                  offset: const Offset(2, 4))
            ]),
        child: LayoutBuilder(
          builder: (p0, p2) => Padding(
              padding: EdgeInsets.only(left: p2.maxWidth * 0.1),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('TPS ${widget.tps}',
                        style: textpoppin.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: p2.maxHeight * 0.15)),
                    SizedBox(height: p2.maxHeight * 0.05),
                    Row(children: [
                      Container(
                          width: p2.maxWidth * 0.05,
                          height: p2.maxHeight * 0.05,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: pinkabu)),
                    ]),
                    SizedBox(height: p2.maxHeight * 0.05),
                    Text("${widget.alamat}",
                        overflow: TextOverflow.ellipsis,
                        style: textpoppin.copyWith(
                            color: hitam, fontSize: p2.maxHeight * 0.07)),
                    Text(
                        '${widget.kabupaten} | ${widget.kecamatan} | ${widget.kelurahan}',
                        overflow: TextOverflow.ellipsis,
                        style: textpoppin.copyWith(
                            color: hitam, fontSize: p2.maxHeight * 0.07)),
                  ])),
        ));
  }
}
