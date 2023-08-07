part of 'pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int? bottomindex;
  int? index;
  PageController pagecontrol = PageController();

  @override
  void initState() {
    Permission.storage.request();

    super.initState();

    bottomindex = 0;
    pagecontrol = PageController(initialPage: bottomindex!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pinkabu,
      body: LayoutBuilder(
        builder: (cont, conts) => Stack(children: [
          Image.asset(
            width: conts.maxWidth,
            'assets/background_splash.png',
            fit: BoxFit.fitWidth,
          ),
          Padding(
            padding: EdgeInsets.only(top: conts.maxHeight * 0.3),
            child: Center(
              child: Column(
                children: [
                  Text("SELAMAT DATANG",
                      style: textpoppin.copyWith(
                          color: putih,
                          fontWeight: FontWeight.w700,
                          fontSize: conts.maxHeight * 0.02)),
                  Text("DI APLIKASI PILKADA",
                      style: textpoppin.copyWith(
                          color: pink,
                          fontWeight: FontWeight.w700,
                          fontSize: conts.maxHeight * 0.03)),
                  SizedBox(height: conts.maxHeight * 0.03),
                  const CircleAvatar(
                      backgroundImage: AssetImage('assets/contohgambar.png'),
                      radius: 80),
                  SizedBox(height: conts.maxHeight * 0.06),
                  ButtonUtama(
                      width: conts.maxWidth * 0.42,
                      height: conts.maxHeight * 0.05,
                      namabutton: 'LOGIN',
                      voidcallback: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Wrapper(),
                            ));
                      }),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class Containerkecil extends StatelessWidget {
  const Containerkecil({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: birumuda, width: 5)),
      child: Container(
        padding: const EdgeInsets.all(6),
        width: 6.5,
        height: 6.5,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      ),
    );
  }
}

class ContainerkecilOff extends StatelessWidget {
  const ContainerkecilOff({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 17.5,
      height: 17.5,
      decoration: BoxDecoration(
        color: birumuda.withOpacity(0.5),
        shape: BoxShape.circle,
      ),
    );
  }
}
