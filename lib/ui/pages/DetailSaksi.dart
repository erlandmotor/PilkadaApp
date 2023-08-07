part of 'pages.dart';

class HalamanDetailSaksi extends StatefulWidget {
  String namasaksi;
  String alamat;

  String notelepon;
  String kelurahan;
  String kabupaten;
  String kecamatan;
  String? gambar;
  String tps;
  HalamanDetailSaksi(
      {super.key,
      this.namasaksi = 'Saksi 001',
      this.alamat = 'Makassar',
      this.notelepon = '081241782869',
      this.kabupaten = 'Makassar',
      this.kelurahan = '',
      this.kecamatan = 'Tamalanrea',
      this.gambar,
      this.tps = '001'});

  @override
  State<HalamanDetailSaksi> createState() => _HalamanDetailSaksiState();
}

class _HalamanDetailSaksiState extends State<HalamanDetailSaksi> {
  @override
  initState() {
    context.read<KonekkedaerahBloc>().add(ConnectKedaerah(
        provinsi: '11',
        kabupaten: widget.kabupaten,
        kecamatan: widget.kecamatan,
        kelurahan: widget.kelurahan));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: p1.maxHeight * 0.02,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                    'https://websisfopilkada.taekwondosulsel.info/public/storage/${widget.gambar}'),
              ),
              SizedBox(
                height: p1.maxHeight * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Nama Saksi",
                        style:
                            textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      ),
                      Text(
                        "Alamat Lengkap",
                        style:
                            textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      ),
                      Text(
                        "No WA",
                        style:
                            textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      ),
                      Text(
                        "Kabupaten/Kota",
                        style:
                            textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      ),
                      Text(
                        "Kecamatan",
                        style:
                            textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      ),
                      Text(
                        "Kelurahan",
                        style:
                            textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      ),
                      Text(
                        "Lokasi TPS",
                        style:
                            textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      ),
                    ],
                  ),
                  BlocBuilder<KonekkedaerahBloc, KonekkedaerahState>(
                    builder: (context, state) {
                      return state is KonekDaerahLoaded
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  widget.namasaksi,
                                  style: textpoppin.copyWith(
                                      fontSize: p1.maxHeight * 0.02,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  widget.alamat,
                                  style: textpoppin.copyWith(
                                      fontSize: p1.maxHeight * 0.02,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  widget.notelepon,
                                  style: textpoppin.copyWith(
                                      fontSize: p1.maxHeight * 0.02,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '${state.datakabupaten}',
                                  style: textpoppin.copyWith(
                                      fontSize: p1.maxHeight * 0.02,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '${state.datakecamatan}',
                                  style: textpoppin.copyWith(
                                      fontSize: p1.maxHeight * 0.02,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '${state.datakelurahan}',
                                  style: textpoppin.copyWith(
                                      fontSize: p1.maxHeight * 0.02,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  widget.tps,
                                  style: textpoppin.copyWith(
                                      fontSize: p1.maxHeight * 0.02,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            )
                          : Text("Gagal Ubah Data");
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
