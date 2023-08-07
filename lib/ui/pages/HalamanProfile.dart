part of 'pages.dart';

class HalamanProfile extends StatefulWidget {
  String nama;
  String nik;
  String alamat;
  String namadaerah;
  String namapartai;

  HalamanProfile(
      {super.key,
      this.nama = '',
      this.nik = '',
      this.alamat = '',
      this.namadaerah = '',
      this.namapartai = ''});
  @override
  State<HalamanProfile> createState() => _HalamanProfileState();
}

class _HalamanProfileState extends State<HalamanProfile> {
  TextEditingController nikcontrol = TextEditingController();
  TextEditingController namacontrol = TextEditingController();
  TextEditingController alamatcontrol = TextEditingController();

  TextEditingController namadaerahcontrol = TextEditingController();

  TextEditingController namapartaicontrol = TextEditingController();

  @override
  initState() {
    nikcontrol.text = widget.nik;
    namacontrol.text = widget.nama;
    alamatcontrol.text = widget.alamat;
    namadaerahcontrol.text = widget.namadaerah;
    namapartaicontrol.text = widget.namapartai;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (p0, p1) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: putih, width: 8.0)),
                    width: p1.maxWidth * 0.3,
                    height: p1.maxHeight * 0.3,
                    child: BlocBuilder<DataprofileBloc, DataprofileState>(
                      builder: (context, state) {
                        return state is DataprofileLoaded
                            ? state.data!.foto == null
                                ? const CircleAvatar(
                                    radius: 50,
                                    backgroundImage:
                                        AssetImage('assets/avatar.png'))
                                : CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage(
                                        'https://web-sisfopilkada.taekwondosulsel.info/public/storage/${state.data!.foto}'))
                            : const Text("");
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nama",
                          style: textpoppin.copyWith(
                              fontSize: p1.maxHeight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Email",
                          style: textpoppin.copyWith(
                              fontSize: p1.maxHeight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Role",
                          style: textpoppin.copyWith(
                              fontSize: p1.maxHeight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    BlocBuilder<DataprofileBloc, DataprofileState>(
                      builder: (context, state) {
                        return state is DataprofileLoaded
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${state.data!.name}",
                                    style: textpoppin.copyWith(
                                        fontSize: p1.maxHeight * 0.02),
                                  ),
                                  Text(
                                    "${state.data!.email}",
                                    style: textpoppin.copyWith(
                                        fontSize: p1.maxHeight * 0.02),
                                  ),
                                  Text(
                                    "${state.data!.role}",
                                    style: textpoppin.copyWith(
                                        fontSize: p1.maxHeight * 0.02),
                                  ),
                                ],
                              )
                            : const SpinKitDualRing(
                                color: birumuda,
                              );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: p1.maxHeight * 0.01,
                ),
              ],
            ));
  }
}
