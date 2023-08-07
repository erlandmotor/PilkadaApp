part of 'pages.dart';

class UbahPassword extends StatefulWidget {
  const UbahPassword({super.key});

  @override
  State<UbahPassword> createState() => _UbahPasswordState();
}

class _UbahPasswordState extends State<UbahPassword> {
  Authentication auth = Authentication();

  _ubahdata() {
    var profile = context.read<DataprofileBloc>().state;
    if (profile is DataprofileLoaded) {
      context.read<DataprofileBloc>().add(DataProfileUpdate(
          id: profile.data!.id.toString(),
          email: emailcontrol.text,
          name: namecontrol.text,
          password: passwordcontrol.text));
    }
  }

  TextEditingController namecontrol = TextEditingController();
  TextEditingController emailcontrol = TextEditingController();
  TextEditingController passwordcontrol = TextEditingController();

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => Padding(
        padding: EdgeInsets.only(top: p1.maxHeight * 0.2),
        child: Column(
          children: [
            ContainerInput(
                nama: "Email",
                control: emailcontrol,
                width: p1.maxWidth,
                hint: 'Masukkan Email Baru',
                height: p1.maxHeight * 0.08),
            ContainerInput(
                nama: "Name",
                control: namecontrol,
                width: p1.maxWidth,
                hint: 'Masukkan Nama Baru',
                height: p1.maxHeight * 0.08),
            ContainerInput(
                nama: "Password Baru",
                control: passwordcontrol,
                width: p1.maxWidth,
                hint: 'Masukkan Password Baru',
                height: p1.maxHeight * 0.08),
            SizedBox(height: p1.maxHeight * 0.02),
            BlocListener<DataprofileBloc, DataprofileState>(
                listener: (context, state) {
                  if (state is DataprofileSukses) {
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
            BlocBuilder<DataprofileBloc, DataprofileState>(
              builder: (context, state) {
                return state is DataprofileLoading
                    ? const SpinKitFadingFour(
                        color: birumuda,
                        size: 50,
                      )
                    : ButtonUtama(
                        width: p1.maxWidth * 0.4,
                        height: p1.maxHeight * 0.05,
                        voidcallback: () {
                          _ubahdata();
                        },
                        namabutton: 'SIMPAN');
              },
            ),
            BlocBuilder<DataprofileBloc, DataprofileState>(
              builder: (context, state) {
                return state is DataprofileFailed
                    ? Text(
                        "Gagal Ubah Password",
                        style: textpoppin.copyWith(
                            fontSize: p1.maxHeight * 0.02, color: hitam),
                      )
                    : const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
