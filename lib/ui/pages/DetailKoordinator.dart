part of 'pages.dart';

class HalamanDetailKoordinator extends StatefulWidget {
  String koordinator;
  String noktp;
  String email;
  String notelepon;
  String alamat;
  String foto;
  String agama;
  String provinsi;
  String kecamatan;
  String kelurahan;
  String kabupaten;

  HalamanDetailKoordinator(
      {super.key,
      this.koordinator = 'Koordinator 1',
      this.noktp = '12345678',
      this.email = 'email23@gmail.com',
      this.notelepon = '081241782869',
      this.agama = 'islam',
      this.provinsi = 'Sulawesi Selatan',
      this.alamat = 'Makassar',
      this.kecamatan = '',
      this.kelurahan = '',
      this.kabupaten = 'Makassar',
      this.foto = ''});

  @override
  State<HalamanDetailKoordinator> createState() =>
      _HalamanDetailKoordinatorState();
}

class _HalamanDetailKoordinatorState extends State<HalamanDetailKoordinator> {
  @override
  void initState() {
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
                    'https://websisfopilkada.taekwondosulsel.info/public/storage/${widget.foto}'),
              ),
              SizedBox(
                height: p1.maxHeight * 0.08,
              ),
              BlocBuilder<KonekkedaerahBloc, KonekkedaerahState>(
                builder: (context, state) {
                  return state is KonekDaerahLoaded
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Nama Koordinator\nNo.KTP\nNo Whatsapp\nAlamat\nAgama\nKabupaten/Kota\nkecamatan",
                              style: textpoppin,
                            ),
                            Flexible(
                                flex: 1,
                                child: Text(
                                  "${widget.koordinator}\n${widget.noktp}\n${widget.notelepon}\n${widget.alamat}\n${widget.agama}\n${state.datakabupaten}\n${state.datakecamatan}",
                                  style: textpoppin.copyWith(
                                      fontWeight: FontWeight.w600),
                                )),
                          ],
                        )
                      : Text("Gagal Ubah Data");
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
