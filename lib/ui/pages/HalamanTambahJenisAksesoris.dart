part of 'pages.dart';

class HalamanTambahJenisAksesoris extends StatefulWidget {
  const HalamanTambahJenisAksesoris({super.key});

  @override
  State<HalamanTambahJenisAksesoris> createState() =>
      _HalamanTambahJenisAksesorisState();
}

class _HalamanTambahJenisAksesorisState
    extends State<HalamanTambahJenisAksesoris> {
  File? _filefoto;
  // File? _scanktp;

  String? selectedagama;
  String? kabupaten;
  String? kecamatan;
  String? kelurahan;

  Future pickfoto() async {
    final myfile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 1);
    setState(() {
      _filefoto = File(myfile!.path);
    });
  }

  _tambahdata() {
    context.read<JenisaksesorisBloc>().add(CreateJenisAksesoris(
        nama_aksesoris: namaaksesoriscontrol.text, foto: _filefoto));
  }

  TextEditingController namaaksesoriscontrol = TextEditingController();

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => Stack(children: [
        BlocListener<JenisaksesorisBloc, JenisaksesorisState>(
            listener: (context, state) {
              if (state is JenisAkSukses) {
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: p1.maxHeight * 0.2),
                  ContainerInput(
                      nama: 'Nama Aksesoris',
                      control: namaaksesoriscontrol,
                      hint: 'Masukkan Jenis Aksesoris',
                      width: p1.maxWidth,
                      height: p1.maxHeight * 0.07)
                ],
              ),
              ButtonUtama(
                  width: p1.maxWidth * 0.5,
                  height: p1.maxHeight * 0.05,
                  namabutton: 'Foto Aksesoris',
                  voidcallback: () {
                    pickfoto();
                  }),
              Padding(
                padding: EdgeInsets.only(
                    left: p1.maxWidth * 0.27, top: p1.maxHeight * 0.02),
                child: BlocBuilder<JenisaksesorisBloc, JenisaksesorisState>(
                  builder: (context, state) {
                    return state is JenisAkLoading
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
                                  _tambahdata();
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
              BlocBuilder<JenisaksesorisBloc, JenisaksesorisState>(
                builder: (context, state) {
                  return state is JenisAkFailed
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
