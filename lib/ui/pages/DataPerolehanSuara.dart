part of 'pages.dart';

class DataPerolehanSuara extends StatefulWidget {
  const DataPerolehanSuara({super.key});

  @override
  State<DataPerolehanSuara> createState() => _DataPerolehanSuaraState();
}

class _DataPerolehanSuaraState extends State<DataPerolehanSuara> {
  File? _filefoto;
  File? fotobukti;
  String? selectedprovinsi;
  String? selectedkota;
  String? selectedkecamatan;
  String? selecteddesa;
  String? selectedtps;
  String? selectedjkl;
  String? itemkabupaten;
  Future pickfoto() async {
    final myfile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 1);
    setState(() {
      _filefoto = File(myfile!.path);
    });
  }

  Future pickfotobukti() async {
    final myfile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 1);
    setState(() {
      fotobukti = File(myfile!.path);
    });
  }

  _ubahdata() {
    var state = context.read<DataperolehansuaraBloc>().state;
    if (state is DPSOutput) {
      setState(() {
        selectedkota = state.kabupaten;
        selectedkecamatan = state.kecamatan;
        selecteddesa = state.kelurahan;
        selectedtps = state.tps;
      });
    }
  }

  _tambahdata() {
    _ubahdata();
    context.read<DataperolehansuaraBloc>().add(DataPerolehanSuaraCreate(
        jml_suara_sah: jumlahsuarasah.text,
        jml_suara_tidaksah: jumlahsuaratdksah.text,
        foto_bukti_perolehan_suara: fotobukti,
        tps_id: selectedtps,
        formulir_c1: _filefoto,
        Province_id: '73',
        regency_id: selectedkota,
        district_id: selectedkecamatan,
        villages_id: selecteddesa));
  }

  TextEditingController jumlahsuarasah = TextEditingController();

  TextEditingController jumlahsuaratdksah = TextEditingController();
  TextEditingController tpsid = TextEditingController();
  TextEditingController saksiid = TextEditingController();
  TextEditingController alamatcontrol = TextEditingController();
  TextEditingController emailcontrol = TextEditingController();
  TextEditingController ketcontrol = TextEditingController();
  TextEditingController tanggalahircontrol = TextEditingController();

  TextEditingController gruprelawancontrol = TextEditingController();
  TextEditingController kabupatencontrol = TextEditingController();
  TextEditingController provinsicontrol = TextEditingController();
  TextEditingController suarakandidat = TextEditingController();

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => Stack(children: [
        BlocListener<DataperolehansuaraBloc, DataperolehansuaraState>(
            listener: (context, state) {
              if (state is DPSSukses) {
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
                  nama: "Jumlah Suara Sah",
                  control: jumlahsuarasah,
                  width: p1.maxWidth,
                  height: p1.maxHeight * 0.09),
              ContainerInput(
                  nama: 'Jumlah Suara Tidak Sah',
                  control: jumlahsuaratdksah,
                  width: p1.maxWidth,
                  height: p1.maxHeight * 0.09),
              const FilterDataInput(),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    width: p1.maxWidth * 0.4,
                    height: p1.maxHeight * 0.05,
                    decoration: BoxDecoration(
                        color: birumuda,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: hitam.withOpacity(0.2),
                              offset: const Offset(3, 3))
                        ]),
                    child: TextButton(
                        onPressed: () {
                          pickfoto();
                        },
                        child: Text(
                          "Upload Formulir C1",
                          style: textpoppin.copyWith(
                              fontSize: p1.maxHeight * 0.015,
                              color: hitam,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    width: p1.maxWidth * 0.4,
                    height: p1.maxHeight * 0.05,
                    decoration: BoxDecoration(
                        color: birumuda,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: hitam.withOpacity(0.2),
                              offset: const Offset(3, 3))
                        ]),
                    child: TextButton(
                        onPressed: () {
                          pickfotobukti();
                        },
                        child: Text(
                          "Bukti Perolehan Suara",
                          style: textpoppin.copyWith(
                              fontSize: p1.maxHeight * 0.015,
                              color: hitam,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: p1.maxHeight * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: p1.maxWidth * 0.27, top: p1.maxHeight * 0.02),
                child: BlocBuilder<DataperolehansuaraBloc,
                    DataperolehansuaraState>(
                  builder: (context, state) {
                    return state is DPSloading
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
              BlocBuilder<DataperolehansuaraBloc, DataperolehansuaraState>(
                  builder: (context, state) {
                return state is DPSFailed
                    ? Center(
                        child: Text("Data Gagal Dikirim", style: textpoppin))
                    : const Text("");
              }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ]),
    );
  }
}
