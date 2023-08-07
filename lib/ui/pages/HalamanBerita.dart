part of 'pages.dart';

class HalamanBerita extends StatefulWidget {
  const HalamanBerita({super.key});

  @override
  State<HalamanBerita> createState() => _HalamanBeritaState();
}

class _HalamanBeritaState extends State<HalamanBerita> {
  @override
  initState() {}

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContainerSearch(
              width: p1.maxWidth,
              height: p1.maxHeight * 0.07,
              cari: (value) =>
                  context.read<BeritaBloc>().add(CariBerita(cari: value)),
              hinttext: 'Search'),
          SizedBox(
            height: p1.maxHeight * 0.02,
          ),
          SizedBox(
              width: p1.maxWidth,
              height: p1.maxHeight * 0.8,
              child: BlocBuilder<BeritaBloc, BeritaState>(
                builder: (context, state) {
                  return state is BeritaLoaded
                      ? GridView.builder(
                          itemCount: state.berita!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) => ContainerBerita(
                              foto: state.berita![index].foto,
                              judul: state.berita![index].judul.toString(),
                              fungsi: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HalamanTemplateBaru(
                                                nama: 'Detail Berita',
                                                halamandata: DetailBerita(
                                                    judul: state
                                                        .berita![index].judul
                                                        .toString(),
                                                    isi: state
                                                        .berita![index].isi
                                                        .toString(),
                                                    foto: state
                                                        .berita![index].foto
                                                        .toString()))));
                              },
                              height: p1.maxHeight * 0.18,
                              width: p1.maxWidth))
                      : const Text("");
                },
              ))
        ],
      ),
    );
  }
}
