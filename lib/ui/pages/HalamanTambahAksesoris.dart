part of 'pages.dart';

class HalamanTambahDataAksesoris extends StatefulWidget {
  const HalamanTambahDataAksesoris({super.key});

  @override
  State<HalamanTambahDataAksesoris> createState() =>
      _HalamanTambahDataAksesorisState();
}

class _HalamanTambahDataAksesorisState
    extends State<HalamanTambahDataAksesoris> {
  File? _filefoto;
  // File? _scanktp;

  String? selectedagama;
  String? kabupaten;
  String? kecamatan;
  String? kelurahan;
  String? selectedrelawan;
  String? selectedaksesoris;
  String? valuerelawan;
  String? valueaksesoris;
  List<DataRelawanUtama>? relawan = [];
  List<DataJenisaksesoris>? jenisaksesoris = [];
  Future pickfoto() async {
    final myfile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 1);
    setState(() {
      _filefoto = File(myfile!.path);
    });
  }

  _ubahdata() {
    var state = context.read<DataaksesorisBloc>().state;
    if (state is PenerimarelawanOutput) {
      setState(() {
        kabupaten = state.kabupaten;
        kecamatan = state.kecamatan;
        kelurahan = state.kelurahan;
      });
    }
  }

  _tambahdata() {
    _ubahdata();
    context.read<DataaksesorisBloc>().add(TambahDataPenerima(
        relawanbiasas_id: valuerelawan,
        jenis_aksesoris: valueaksesoris,
        tanggal_terima: tanggalcontrol.text,
        foto_bukti: _filefoto,
        regency: kabupaten,
        district: kecamatan,
        villages: kelurahan,
        provinsi: '73'));
  }

  TextEditingController namapenerimacontrol = TextEditingController();

  TextEditingController noktp = TextEditingController();

  TextEditingController tanggalcontrol = TextEditingController();
  TextEditingController emailcontrol = TextEditingController();

  TextEditingController agamacontrol = TextEditingController();
  TextEditingController jeniskelamincontrol = TextEditingController();

  TextEditingController kabupatencontrol = TextEditingController();
  TextEditingController provinsicontrol = TextEditingController();
  TextEditingController jenisaksesoriscontrol = TextEditingController();
  @override
  initState() {
    tanggalcontrol.text = '';
    auth.getdatarelawanbiasa().then((value) => relawan = value);
    auth.getdatajenisaksesoris().then((value) => jenisaksesoris = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => Stack(children: [
        BlocListener<DataaksesorisBloc, DataaksesorisState>(
            listener: (context, state) {
              if (state is DataaksesorisSukses) {
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
              SizedBox(height: p1.maxHeight * 0.07),
              DropdownSearch<String>(
                  selectedItem: selectedrelawan,
                  onChanged: (value) {
                    // setState(() {
                    //   selectedrelawan = value;
                    //   valuerelawan = relawan!
                    //       .firstWhere((e) => e.id.toString() == selectedrelawan)
                    //       .id
                    //       .toString();
                    // });
                    context
                        .read<DataaksesorisBloc>()
                        .add(Penerimarelawaninput(namarelawan: value));
                  },
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Relawan",
                      hintText: "Cari Relawan",
                    ),
                  ),
                  asyncItems: (text) => auth.getrelawanlist(),
                  popupProps: const PopupProps.menu(
                    showSelectedItems: true,
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(cursorColor: birumuda),
                  )),
              DropdownSearch<String>(
                  selectedItem: selectedaksesoris,
                  onChanged: (value) {
                    setState(() {
                      selectedaksesoris = value;
                      valueaksesoris = jenisaksesoris!
                          .firstWhere((e) =>
                              e.nama_aksesoris.toString() == selectedaksesoris)
                          .id
                          .toString();
                    });
                  },
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Aksesoris",
                      hintText: "Jenis Aksesoris",
                    ),
                  ),
                  asyncItems: (text) => auth.getaksesorislist(),
                  popupProps: const PopupProps.menu(
                    showSelectedItems: true,
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(cursorColor: birumuda),
                  )),
              SizedBox(height: p1.maxHeight * 0.02),
              ContainerInput(
                  tipekeyboard: TextInputType.datetime,
                  nama: 'Tanggal Terima',
                  control: tanggalcontrol,
                  ontapfield: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2101));
                    if (pickedDate != null) {
                      print(pickedDate);
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(formattedDate);
                      setState(() {
                        tanggalcontrol.text = formattedDate;
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                  width: p1.maxWidth,
                  height: p1.maxHeight * 0.07),
              SizedBox(height: p1.maxHeight * 0.02),
              ButtonUtama(
                  width: p1.maxWidth * 0.5,
                  height: p1.maxHeight * 0.05,
                  namabutton: 'Foto Bukti',
                  voidcallback: () {
                    pickfoto();
                  }),
              Padding(
                padding: EdgeInsets.only(
                    left: p1.maxWidth * 0.27, top: p1.maxHeight * 0.02),
                child: BlocBuilder<DataaksesorisBloc, DataaksesorisState>(
                  builder: (context, state) {
                    return state is DataaksesorisLoading
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
              BlocBuilder<DataaksesorisBloc, DataaksesorisState>(
                builder: (context, state) {
                  return state is DataaksesorisFailed
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
