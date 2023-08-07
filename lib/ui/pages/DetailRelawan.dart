part of 'pages.dart';

class HalamanDetailRelawan extends StatefulWidget {
  String relawan;
  String noktp;
  String foto;
  String kecamatan;
  String kelurahan;
  String fotoktp;
  String notelepon;
  String id;
  String alamat;
  String agama;
  String jeniskelamin;
  String provinsi;
  bool relawanbiasa;
  String kabupaten;
  String? gambar;

  HalamanDetailRelawan({
    super.key,
    this.relawan = 'Relawan 001',
    this.foto = '',
    this.relawanbiasa = false,
    this.kecamatan = '',
    this.alamat = '',
    this.fotoktp = '',
    this.provinsi = '',
    this.kelurahan = '',
    this.id = '',
    this.noktp = '12345678',
    this.notelepon = '081241782869',
    this.agama = 'islam',
    this.gambar,
    this.jeniskelamin = 'Laki - Laki',
    this.kabupaten = 'Makassar',
  });

  @override
  State<HalamanDetailRelawan> createState() => _HalamanDetailRelawanState();
}

class _HalamanDetailRelawanState extends State<HalamanDetailRelawan> {
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
            height: p1.maxHeight * 0.04,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                    'https://websisfopilkada.taekwondosulsel.info/public/storage/${widget.foto}'),
              ),
              SizedBox(
                height: p1.maxHeight * 0.03,
              ),
              BlocBuilder<KonekkedaerahBloc, KonekkedaerahState>(
                builder: (context, state) {
                  return state is KonekDaerahLoaded
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Nama Relawan\nNo.KTP\nNo Whatsapp\nAlamat\nAgama\nJenis Kelamin\nKabupaten/Kota\nKecamatan\nKelurahan/Desa",
                              style: textpoppin,
                            ),
                            Flexible(
                              flex: 1,
                              child: Text(
                                "${widget.relawan}\n${widget.noktp}\n${widget.notelepon}\n${widget.alamat}\n${widget.agama}\n${widget.jeniskelamin}\n${state.datakabupaten}\n${state.datakecamatan}\n${state.datakelurahan}",
                                style: textpoppin.copyWith(
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        )
                      : Text("Gagal Ubah Data");
                },
              ),
              widget.relawanbiasa == false
                  ? Column(
                      children: [
                        Text("Relawan Biasa Yang Ditambahkan",
                            style: textpoppin.copyWith(
                                fontWeight: FontWeight.bold)),
                        BlocBuilder<DatarelawanBloc, DatarelawanState>(
                          builder: (context, state) {
                            return state is RelawanDetailLoaded
                                ? SizedBox(
                                    width: p1.maxWidth,
                                    height: p1.maxHeight * 0.1,
                                    child: ListView.builder(
                                      itemCount:
                                          state.data![0].relawan_biasa!.length,
                                      itemBuilder: (context, index) => Center(
                                        child: Text(
                                            "${state.data![0].relawan_biasa![index].nama}",
                                            style: textpoppin.copyWith(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                  )
                                // ?
                                : const Text("Gagal Mengambil Data");
                          },
                        ),
                      ],
                    )
                  : const Text(""),
              SizedBox(height: p1.maxHeight * 0.04),
              Text("Foto KTP",
                  style: textpoppin.copyWith(fontWeight: FontWeight.bold)),
              Container(
                  width: p1.maxWidth * 0.7,
                  height: p1.maxHeight * 0.2,
                  color: abuabu,
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://websisfopilkada.taekwondosulsel.info/public/storage/${widget.fotoktp}',
                    fit: BoxFit.fill,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
