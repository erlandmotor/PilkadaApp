part of 'pages.dart';

class JenisAksesoris extends StatefulWidget {
  const JenisAksesoris({super.key});

  @override
  State<JenisAksesoris> createState() => _JenisAksesorisState();
}

class _JenisAksesorisState extends State<JenisAksesoris> {
  @override
  initState() {
    context.read<JenisaksesorisBloc>().add(JenisAksesorisConnect());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (p0, p1) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ContainerSearch(
                        width: p1.maxWidth * 0.6,
                        height: p1.maxHeight * 0.07,
                        cari: (value) {
                          context
                              .read<JenisaksesorisBloc>()
                              .add(JenisAksesorisSearch(value: value));
                        }),
                    ContainerTambah(
                        width: p1.maxWidth * 0.2,
                        height: p1.maxHeight * 0.07,
                        fungsi: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HalamanTemplateBaru(
                                        nama: 'Tambah Aksesoris',
                                        halamandata:
                                            const HalamanTambahJenisAksesoris(),
                                      )));
                        })
                  ],
                ),
                SizedBox(
                    width: p1.maxWidth,
                    height: p1.maxHeight * 0.8,
                    child: BlocBuilder<JenisaksesorisBloc, JenisaksesorisState>(
                      builder: (context, state) {
                        return state is JenisAksesorisLoaded
                            ? GridView.builder(
                                itemCount: state.data!.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemBuilder: (context, index) => Container(
                                    margin: const EdgeInsets.all(7),
                                    width: p1.maxWidth * 0.3,
                                    height: p1.maxHeight * 0.3,
                                    decoration: BoxDecoration(
                                        color: putih,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: LayoutBuilder(
                                      builder: (p0, p2) => Column(
                                        children: [
                                          SizedBox(
                                            width: p2.maxWidth,
                                            height: p2.maxHeight * 0.7,
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  'https://websisfopilkada.taekwondosulsel.info/public/storage/${state.data![index].foto}',
                                              fit: BoxFit.fill,
                                              progressIndicatorBuilder:
                                                  (context, url,
                                                          downloadProgress) =>
                                                      CircularProgressIndicator(
                                                          value:
                                                              downloadProgress
                                                                  .progress),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                          ),
                                          Text(
                                              "${state.data![index].nama_aksesoris}",
                                              style: textpoppin.copyWith(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    )))
                            : const Text("");
                      },
                    ))
              ],
            ));
  }
}
