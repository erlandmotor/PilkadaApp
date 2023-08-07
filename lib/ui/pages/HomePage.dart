part of 'pages.dart';

class HomePage extends StatefulWidget {
  dynamic haldata;

  HomePage({super.key, this.haldata});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int endTime = DateTime.fromMillisecondsSinceEpoch(1706580507 * 1000)
      .millisecondsSinceEpoch;

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>();

    return LayoutBuilder(
      builder: (p0, p1) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: pinkabu,
        body: Animate(
          effects: const [FadeEffect(duration: Duration(seconds: 1))],
          child: Stack(
            children: [
              // SizedBox(
              //     width: p1.maxWidth,
              //     child: Image.asset(
              //       'assets/backgroundhome.png',
              //       fit: BoxFit.fitWidth,
              //     )),
              // SizedBox(
              //     width: p1.maxWidth,
              //     child: Lottie.asset('assets/clouds.json')),
              Padding(
                padding: EdgeInsets.only(
                  left: p1.maxWidth * 0.03,
                  right: p1.maxWidth * 0.03,
                ),
                child: HalamanHome(
                  haldata: widget.haldata,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: p1.maxHeight * 0.32,
                    left: p1.maxWidth * 0.09,
                    right: p1.maxWidth * 0.09),
                child: SizedBox(
                    width: p1.maxWidth,
                    height: p1.maxHeight * 0.07,
                    child: const DashboardAdmin()),
              ),
              // Container(
              //   width: p1.maxWidth,
              //   height: p1.maxHeight * 0.07,
              //   decoration: BoxDecoration(color: pinkabu),
              //   child: Align(
              //     alignment: Alignment.centerLeft,
              //     child: SizedBox(
              //         width: p1.maxWidth * 0.18,
              //         height: p1.maxHeight * 0.18,
              //         child: Image.asset('assets/logo2.png')),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.only(
                    top: p1.maxHeight * 0.5,
                    left: p1.maxWidth * 0.03,
                    right: p1.maxWidth * 0.03),
                child: SizedBox(
                  width: p1.maxWidth,
                  height: p1.maxHeight * 0.3,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Berita",
                              style: textpoppin.copyWith(
                                  fontWeight: FontWeight.bold)),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HalamanTemplateawal(
                                                nama: 'Berita',
                                                halamandata:
                                                    const HalamanBerita())));
                              },
                              child: Text("Lihat Semua", style: textpoppin)),
                        ],
                      ),
                      SizedBox(
                        width: p1.maxWidth,
                        height: p1.maxHeight * 0.2,
                        child: BlocBuilder<BeritaBloc, BeritaState>(
                          builder: (context, state) {
                            return state is BeritaLoaded
                                ? GridView.builder(
                                    itemCount: state.berita!.length,
                                    scrollDirection: Axis.horizontal,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 1),
                                    itemBuilder: (context, index) =>
                                        ContainerBerita(
                                            foto: state.berita![index].foto,
                                            fungsi: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          HalamanTemplateBaru(
                                                              nama:
                                                                  'Detail Berita',
                                                              halamandata: DetailBerita(
                                                                  foto: state
                                                                      .berita![
                                                                          index]
                                                                      .foto,
                                                                  judul: state
                                                                      .berita![
                                                                          index]
                                                                      .judul,
                                                                  isi: state
                                                                      .berita![
                                                                          index]
                                                                      .isi))));
                                            },
                                            judul: state.berita![index].judul
                                                .toString(),
                                            height: p1.maxHeight * 0.18,
                                            width: p1.maxWidth))
                                : const Text("");
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: p1.maxHeight * 0.78,
                    left: p1.maxWidth * 0.03,
                    right: p1.maxWidth * 0.03),
                child: CountdownTimer(
                  endTime: endTime,
                  widgetBuilder: (context, time) {
                    if (time == null) {
                      return const Text('Game over');
                    }
                    return Container(
                        width: p1.maxWidth,
                        height: p1.maxHeight * 0.08,
                        decoration: BoxDecoration(
                            color: putih,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Hitung Mundur Pemilu 2024",
                              style: textpoppin,
                            ),
                            Text(
                              '${time.days} Hari ${time.hours} Jam ${time.min} Menit ${time.sec} Detik',
                              style: textpoppin.copyWith(
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ));
                  },
                ),
              ),

              // Align(
              //   alignment: Alignment.topRight,
              //   child: Padding(
              //     padding: EdgeInsets.only(right: p1.maxHeight * 0.02),
              //     child: SizedBox(
              //       width: p1.maxWidth * 0.1,
              //       height: p1.maxHeight * 0.1,
              //       child: FittedBox(
              //         child: FloatingActionButton(
              //           elevation: 10,
              //           backgroundColor: birumuda,
              //           onPressed: () {
              //             // context.read<AuthBloc>().add(LoggedOut());
              //             Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                   builder: (context) => const HalamanSettings(),
              //                 ));
              //           },
              //           child: const Icon(
              //             Icons.settings,
              //             color: hitam,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
