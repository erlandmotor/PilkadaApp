part of 'pages.dart';

class HomePageBaru extends StatefulWidget {
  dynamic haldata;

  HomePageBaru({super.key, this.haldata});

  @override
  State<HomePageBaru> createState() => _HomePageBaruState();
}

class _HomePageBaruState extends State<HomePageBaru> {
  int? bottomnavbarindex;
  PageController pagecontrol = PageController();
  @override
  void initState() {
    context.read<KonekkedaerahBloc>().add(ConnectKedaerahList(listprovinsi: [
          '11',
          '11',
          '11',
          '11',
          '11',
          '11'
        ], listkabupaten: [
          '1101',
          '1101',
          '1101',
          '1101',
          '1101',
          '1101'
        ], listkecamatan: [
          '1101010',
          '1101010' '1101010',
          '1101010',
          '1101010',
          '1101010',
        ], listdesa: [
          '1101010001',
          '1101010001' '1101010001',
          '1101010001',
          '1101010001',
          '1101010001',
        ]));

    super.initState();

    bottomnavbarindex = 0;
  }

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>();
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, p2) => SafeArea(
          child: Stack(
            children: [
              Container(
                color: putih,
                width: p2.maxWidth,
                height: p2.maxHeight * 0.1,
              ),
              PageView(
                controller: pagecontrol,
                onPageChanged: (value) {
                  setState(() {
                    bottomnavbarindex = value;
                  });
                },
                children: [
                  HomePage(haldata: widget.haldata),
                  const HalamanSettings()
                ],
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 46,
                    width: 46,
                    margin: EdgeInsets.only(bottom: p2.maxHeight * 0.07),
                    child: FloatingActionButton(
                      elevation: 0,
                      backgroundColor: birumuda,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HalamanTemplateawal(
                                      halamandata: HalamanPerolehanSuara(),
                                    )));
                      },
                      child: SizedBox(
                          height: 34,
                          width: 34,
                          child: SvgPicture.asset('assets/icon1.svg')
                          // child: Icon(
                          //   Icons.data_array,
                          //   color: Colors.black.withOpacity(0.54),
                          // ),
                          ),
                    ),
                  )),
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  child: ClipPath(
                    clipper: BottomNavbarclipper(),
                    child: SizedBox(
                        width: p2.maxWidth,
                        height: p2.maxHeight * 0.1,
                        child: LayoutBuilder(
                          builder: (p0, btm) => BottomNavigationBar(
                              backgroundColor: Colors.white,
                              onTap: (value) {
                                setState(() {
                                  bottomnavbarindex = value;
                                  pagecontrol.jumpToPage(value);
                                });
                              },
                              currentIndex: bottomnavbarindex!,
                              selectedLabelStyle: textpoppin.copyWith(
                                  fontSize: btm.maxHeight * 0.2),
                              unselectedLabelStyle: textpoppin.copyWith(
                                  fontSize: btm.maxHeight * 0.2),
                              selectedItemColor: birumuda,
                              items: [
                                BottomNavigationBarItem(
                                    label: 'HOME',
                                    icon: SizedBox(
                                        height: btm.maxHeight * 0.34,
                                        child: const Icon(Icons.home))),
                                BottomNavigationBarItem(
                                    label: 'AKUN',
                                    icon: SizedBox(
                                        height: btm.maxHeight * 0.34,
                                        child: const Icon(Icons.person))),
                              ]),
                        )),
                  ),
                ),
              ),
              WillPopScope(
                  child: const Text(""),
                  onWillPop: () async {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                          title: Text(
                            "Apakah anda yakin ingin keluar ?",
                            style: textpoppin.copyWith(
                                fontSize: p2.maxHeight * 0.02),
                          ),
                          content: Row(
                            children: [
                              Container(
                                width: p2.maxWidth * 0.3,
                                height: p2.maxHeight * 0.07,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: putih,
                                    border: Border.all(
                                        color: colorbiru, width: 1.0)),
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop();
                                    },
                                    child: Text(
                                      "Tidak",
                                      style: textpoppin.copyWith(
                                          color: colorbiru,
                                          fontWeight: FontWeight.w600),
                                    )),
                              ),
                              SizedBox(
                                width: p2.maxWidth * 0.01,
                              ),
                              Container(
                                width: p2.maxWidth * 0.3,
                                height: p2.maxHeight * 0.07,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                          color: hitam.withOpacity(0.2),
                                          offset: const Offset(3, 3))
                                    ],
                                    color: Colors.red,
                                    border: Border.all(
                                        color: colorbiru, width: 1.0)),
                                child: TextButton(
                                    onPressed: () {
                                      context.read<AuthBloc>().add(LoggedOut());
                                      setState(() {});

                                      Navigator.of(context, rootNavigator: true)
                                          .pop();
                                    },
                                    child: Text(
                                      "Ya",
                                      style: textpoppin.copyWith(
                                          color: putih,
                                          fontWeight: FontWeight.w600),
                                    )),
                              ),
                            ],
                          )),
                    );
                    return false;
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavbarclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(size.width / 2 - 28, 0);
    path.quadraticBezierTo(size.width / 2 - 28, 33, size.width / 2, 33);
    path.quadraticBezierTo(size.width / 2 + 28, 33, size.width / 2 + 28, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
