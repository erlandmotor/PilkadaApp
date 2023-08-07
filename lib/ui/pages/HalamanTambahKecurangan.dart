part of 'pages.dart';

class HalamanTambahKecurangan extends StatefulWidget {
  const HalamanTambahKecurangan({super.key});

  @override
  State<HalamanTambahKecurangan> createState() =>
      _HalamanTambahKecuranganState();
}

class _HalamanTambahKecuranganState extends State<HalamanTambahKecurangan> {
  File? _filefoto;
  // File? _scanktp;
  XFile? pictureFile;
  String? selectedkota;
  String? selectedkecamatan;
  String? selectedkelurahan;
  String? tps;
  Future pickfoto() async {
    final myfile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 1);
    setState(() {
      _filefoto = File(myfile!.path);
    });
  }

  _ubahdata() {
    var state = context.read<DataKecuranganBloc>().state;
    if (state is KecuranganOutput) {
      setState(() {
        selectedkota = state.kabupaten;
        selectedkecamatan = state.kecamatan;
        selectedkelurahan = state.kelurahan;
        tps = state.tps;
      });
    }
  }

  _tambahdatakecurangan() {
    _ubahdata();
    context.read<DataKecuranganBloc>().add(DataKecuranganCreate(
        nama_kecurangan: namakecurangancontrol.text,
        deskripsi: deskripsi.text,
        fotoBukti_kecurangan: _filefoto,
        tps_id: tps,
        villages: selectedkelurahan,
        district: selectedkecamatan,
        regency: selectedkota,
        province: '73'));
  }

  TextEditingController namakecurangancontrol = TextEditingController();
  TextEditingController deskripsi = TextEditingController();
  TextEditingController tpsidcontrol = TextEditingController();
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => Stack(children: [
        BlocListener<DataKecuranganBloc, DataKecuranganState>(
            listener: (context, state) {
              if (state is DataKecuranganSukses) {
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.success,
                    text: 'Data Berhasil Disimpan',
                    onConfirmBtnTap: () {
                      Navigator.pop(context);
                    },
                    confirmBtnColor: colorbiru,
                    confirmBtnTextStyle: textpoppin.copyWith(color: putih));
              }
            },
            child: Container()),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ContainerInput(
                  nama: 'Nama Kecurangan',
                  control: namakecurangancontrol,
                  hint: 'Masukkan Kecurangan',
                  width: p1.maxWidth,
                  height: p1.maxHeight * 0.07),
              ContainerInput(
                  nama: 'Deskripsi',
                  control: deskripsi,
                  hint: 'Masukkan Deskripsi',
                  width: p1.maxWidth,
                  height: p1.maxHeight * 0.07),
              const FilterDataInput(),
              SizedBox(height: p1.maxHeight * 0.02),
              ButtonUtama(
                  width: p1.maxWidth * 0.43,
                  height: p1.maxHeight * 0.043,
                  namabutton: 'Foto Bukti',
                  voidcallback: () {
                    pickfoto();
                  }),
              Padding(
                padding: EdgeInsets.only(
                    left: p1.maxWidth * 0.27, top: p1.maxHeight * 0.02),
                child: BlocBuilder<DataKecuranganBloc, DataKecuranganState>(
                  builder: (context, state) {
                    return state is DataKecuranganLoading
                        ? const SpinKitFadingFour(
                            color: birumuda,
                            size: 50,
                          )
                        : Container(
                            width: p1.maxWidth * 0.5,
                            height: p1.maxHeight * 0.07,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: hitam.withOpacity(0.2),
                                      offset: const Offset(3, 3))
                                ],
                                color: birumuda,
                                border:
                                    Border.all(color: colorbiru, width: 1.0)),
                            child: TextButton(
                                onPressed: () {
                                  _tambahdatakecurangan();
                                  setState(() {});
                                },
                                child: Text(
                                  "Simpan",
                                  style: textpoppin.copyWith(
                                      fontSize: p1.maxHeight * 0.02,
                                      color: hitam,
                                      fontWeight: FontWeight.w600),
                                )),
                          );
                  },
                ),
              ),
              BlocBuilder<DataKecuranganBloc, DataKecuranganState>(
                builder: (context, state) {
                  return state is DataKecuranganFailed
                      ? Text(
                          "Gagal Tambah Data",
                          style: textpoppin.copyWith(
                              fontSize: p1.maxHeight * 0.02, color: hitam),
                        )
                      : const SizedBox();
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ]),
    );
  }
}
