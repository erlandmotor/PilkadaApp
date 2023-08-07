part of 'pages.dart';

class HalamanTambahDataRelawan extends StatefulWidget {
  const HalamanTambahDataRelawan({super.key});

  @override
  State<HalamanTambahDataRelawan> createState() =>
      _HalamanTambahDataRelawanState();
}

class _HalamanTambahDataRelawanState extends State<HalamanTambahDataRelawan> {
  File? _filefoto;
  // File? _scanktp;
  XFile? pictureFile;
  List<String> itemjeniskelamin = ['laki-laki', 'perempuan'];
  List<String> itemagama = ['ISLAM', 'KRISTEN', 'HINDU', 'BUDDHA'];
  bool relawan_biasa = false;
  String? selectedjkl;
  String? selectedagama;
  String? kabupaten;
  String? kecamatan;
  String? kelurahan;
  String? selectedgrup;

  Future pickfoto() async {
    final myfile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 1);
    setState(() {
      _filefoto = File(myfile!.path);
    });
  }

  ubahdata() {
    var state = context.read<DatarelawanBloc>().state;
    if (state is RelawanOutput) {
      setState(() {
        kabupaten = state.kabupaten;
        kecamatan = state.kecamatan;
        kelurahan = state.kelurahan;
      });
    }
  }

  _tambahdataru() {
    ubahdata();
    context.read<DatarelawanBloc>().add(TambahDataRelawanUtama(
        nama: namarelawancontrol.text,
        nik: noktp.text,
        agama: selectedagama,
        alamat: alamatcontrol.text,
        jkl: selectedjkl,
        photo: _filefoto,
        scan_ktp: File(pictureFile!.path),
        villages_id: kelurahan,
        district_id: kecamatan,
        regency_id: kabupaten,
        no_wa: nohpcontrol.text,
        Province_id: '73'));
  }

  _tambahdatarb() {
    ubahdata();
    context.read<DatarelawanBloc>().add(TambahDataRelawanBiasa(
        nama: namarelawancontrol.text,
        nik: noktp.text,
        agama: selectedagama,
        alamat: alamatcontrol.text,
        jkl: selectedjkl,
        photo: _filefoto,
        scan_ktp: File(pictureFile!.path),
        villages_id: kelurahan,
        district_id: kecamatan,
        regency_id: kabupaten,
        no_wa: nohpcontrol.text,
        Province_id: '73'));
  }

  TextEditingController namarelawancontrol = TextEditingController();

  TextEditingController noktp = TextEditingController();

  TextEditingController alamatcontrol = TextEditingController();
  TextEditingController emailcontrol = TextEditingController();

  TextEditingController agamacontrol = TextEditingController();
  TextEditingController jeniskelamincontrol = TextEditingController();

  TextEditingController kabupatencontrol = TextEditingController();
  TextEditingController provinsicontrol = TextEditingController();
  TextEditingController nohpcontrol = TextEditingController();
  @override
  initState() {
    var profile = context.read<DataprofileBloc>().state;
    if (profile is DataprofileLoaded) {
      if (profile.data!.role == 'relawan_biasa') {
        setState(() {
          relawan_biasa = true;
        });
      } else {
        relawan_biasa = false;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => Stack(children: [
        BlocListener<DatarelawanBloc, DatarelawanState>(
            listener: (context, state) {
              if (state is DatarelawanSukses) {
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
                  Center(
                    child: InkWell(
                      onTap: () {
                        pickfoto();
                      },
                      child: Container(
                          width: p1.maxWidth * 0.25,
                          height: p1.maxHeight * 0.25,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: putih),
                          child: LayoutBuilder(
                            builder: (p0, p2) => (_filefoto != null)
                                ? CircleAvatar(
                                    radius: p1.maxWidth * 0.25,
                                    backgroundImage: FileImage(_filefoto!))
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.add,
                                          color: pinkabu,
                                          size: p2.maxWidth * 0.5),
                                      Text("Tambah Foto",
                                          style: textpoppin.copyWith(
                                              color: pinkabu,
                                              fontWeight: FontWeight.w600,
                                              fontSize: p2.maxHeight * 0.05))
                                    ],
                                  ),
                          )),
                    ),
                  ),
                  ContainerInput(
                      nama: 'Nama Relawan',
                      control: namarelawancontrol,
                      hint: 'Masukkan Nama Relawan',
                      width: p1.maxWidth,
                      height: p1.maxHeight * 0.07)
                ],
              ),
              ContainerInput(
                  nama: 'No.KTP',
                  control: noktp,
                  width: p1.maxWidth,
                  height: p1.maxHeight * 0.07,
                  tipekeyboard: TextInputType.number,
                  hint: 'Masukkan No KTP'),
              ContainerInput(
                  nama: 'No.Whatsapp',
                  control: nohpcontrol,
                  width: p1.maxWidth,
                  tipekeyboard: TextInputType.number,
                  hint: 'Masukkan No Wa',
                  height: p1.maxHeight * 0.07),
              ContainerInput(
                  nama: 'Alamat',
                  control: alamatcontrol,
                  hint: 'Masukkan Alamat',
                  width: p1.maxWidth,
                  height: p1.maxHeight * 0.07),
              Containerdropdown(
                  width: p1.maxWidth,
                  height: p1.maxHeight * 0.13,
                  nama: 'Jenis Kelamin',
                  oncanged: (value) {
                    setState(() {
                      selectedjkl = value;
                    });
                  },
                  items: itemjeniskelamin,
                  selecitem: selectedjkl),
              Containerdropdown(
                  width: p1.maxWidth,
                  height: p1.maxHeight * 0.13,
                  nama: 'Agama',
                  oncanged: (value) {
                    setState(() {
                      selectedagama = value;
                    });
                  },
                  items: itemagama,
                  selecitem: selectedagama),
              const FilterDataInput(),
              Container(
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
                    onPressed: () async {
                      pictureFile = await availableCameras().then(
                        (value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CameraPage(
                              cameras: value,
                            ),
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "SCAN KTP",
                      style: textpoppin.copyWith(
                          fontSize: p1.maxHeight * 0.016,
                          color: hitam,
                          fontWeight: FontWeight.w600),
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: p1.maxWidth * 0.27, top: p1.maxHeight * 0.02),
                child: BlocBuilder<DatarelawanBloc, DatarelawanState>(
                  builder: (context, state) {
                    return state is DatarelawanLoading
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
                                  if (relawan_biasa != true) {
                                    _tambahdataru();
                                  } else {
                                    _tambahdatarb();
                                  }

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
              BlocBuilder<DatarelawanBloc, DatarelawanState>(
                builder: (context, state) {
                  return state is DatarelawanFailed
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
