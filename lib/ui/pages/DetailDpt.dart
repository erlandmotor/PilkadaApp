part of 'pages.dart';

class HalamanDetailDPT extends StatefulWidget {
  String namadpt;
  String gambar;
  String kabupaten;
  String nik;
  String kk;
  String jkl;
  String agama;
  String nohp;

  String kelurahan;
  String alamatrumah;
  String provinsi;
  String kecamatan;

  HalamanDetailDPT(
      {super.key,
      this.namadpt = 'Relawan 001',
      this.kabupaten = 'Makassar',
      this.agama = '',
      this.jkl = '',
      this.kecamatan = '',
      this.kk = '',
      this.nik = '',
      this.nohp = '',
      this.alamatrumah = '',
      this.kelurahan = '',
      this.provinsi = '',
      this.gambar = ''});

  @override
  State<HalamanDetailDPT> createState() => _HalamanDetailDPTState();
}

class _HalamanDetailDPTState extends State<HalamanDetailDPT> {
  @override
  initState() {
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
              // CircleAvatar(
              //   radius: 70,
              //   backgroundImage: NetworkImage(
              //       'https://web-sisfopilkada.taekwondosulsel.info/public/storage/${widget.gambar}'),
              // ),
              SizedBox(
                height: p1.maxHeight * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Nama DPT\nNIK\nJenis Kelamin\nAgama\nProvinsi\nKabupaten / Kota\nKecamatan\nKelurahan / Desa\nAlamat Rumah",
                    style: textpoppin,
                  ),
                  Flexible(
                    flex: 1,
                    child: Text(
                      "${widget.namadpt}\n${widget.nik}\n${widget.jkl}\n${widget.agama}\n${widget.provinsi}\n${widget.kabupaten}\n${widget.kecamatan}\n${widget.kelurahan}\n${widget.alamatrumah}",
                      style: textpoppin.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              SizedBox(height: p1.maxHeight * 0.04),
              Text("Foto KTP",
                  style: textpoppin.copyWith(fontWeight: FontWeight.bold)),
              Container(
                  width: p1.maxWidth * 0.7,
                  height: p1.maxHeight * 0.2,
                  color: abuabu,
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://websisfopilkada.taekwondosulsel.info/public/storage/${widget.gambar}',
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
