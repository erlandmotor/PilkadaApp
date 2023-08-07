part of 'pages.dart';

class DetailBerita extends StatefulWidget {
  String? judul;
  String? isi;
  String? foto;
  DetailBerita({super.key, this.judul = '', this.isi = '', this.foto = ''});
  @override
  State<DetailBerita> createState() => _DetailBeritaState();
}

class _DetailBeritaState extends State<DetailBerita> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: p1.maxHeight * 0.1,
            ),
            SizedBox(
              width: p1.maxWidth,
              height: p1.maxHeight * 0.3,
              child: CachedNetworkImage(
                imageUrl:
                    'https://websisfopilkada.taekwondosulsel.info/public/storage/${widget.foto}',
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: p1.maxHeight * 0.04,
            ),
            Text("${widget.judul}",
                style: textpoppin.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: p1.maxHeight * 0.03)),
            Text("01 April 2020", style: textpoppin),
            SizedBox(
              height: p1.maxHeight * 0.02,
            ),
            Text('${widget.isi}', style: textpoppin),
            SizedBox(height: p1.maxHeight * 0.04),
            Text("Berita Lainnya",
                style: textpoppin.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(
                width: p1.maxWidth,
                height: p1.maxHeight * 0.6,
                child: BlocBuilder<BeritaBloc, BeritaState>(
                  builder: (context, state) {
                    return state is BeritaLoaded
                        ? GridView.builder(
                            itemCount: state.berita!.length,
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    childAspectRatio: (16 / 9)),
                            itemBuilder: (context, index) => ContainerBerita(
                                judul: '${state.berita![index].judul}',
                                foto: '${state.berita![index].foto}',
                                fungsi: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HalamanTemplateBaru(
                                              nama: 'Detail Berita',
                                              halamandata: DetailBerita(
                                                  judul:
                                                      '${state.berita![index].judul}',
                                                  isi:
                                                      '${state.berita![index].isi}',
                                                  foto:
                                                      '${state.berita![index].foto}'))));
                                },
                                height: p1.maxHeight * 0.18,
                                width: p1.maxWidth))
                        : const Text("");
                  },
                ))
          ],
        ),
      ),
    );
  }
}
