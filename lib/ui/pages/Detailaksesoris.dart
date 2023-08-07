part of 'pages.dart';

class DetailAksesoris extends StatefulWidget {
  String namapenerima;
  String nik;
  String relawanpemberi;
  String jenisaksesoris;
  String serahterima;
  String gambar;

  DetailAksesoris(
      {super.key,
      this.namapenerima = 'agus',
      this.nik = '789877676',
      this.relawanpemberi = 'Rayhan',
      this.jenisaksesoris = 'Uang Tunai',
      this.gambar = '',
      this.serahterima = '17 - November - 2022'});

  @override
  State<DetailAksesoris> createState() => _DetailAksesorisState();
}

class _DetailAksesorisState extends State<DetailAksesoris> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: p1.maxHeight * 0.02,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: p1.maxHeight * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Nama Penerima\nJenis Aksesoris\nTanggal Terima',
                    style: textpoppin,
                  ),
                  Flexible(
                    flex: 1,
                    child: Text(
                      "${widget.namapenerima}\n${widget.jenisaksesoris}\n${widget.serahterima}",
                      style: textpoppin.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              SizedBox(height: p1.maxHeight * 0.04),
              Text("Dokumentasi Serah Terima Aksesoris",
                  style: textpoppin.copyWith(fontWeight: FontWeight.bold)),
              SizedBox(
                width: p1.maxWidth,
                height: p1.maxHeight * 0.3,
                child: GridView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1),
                    itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.only(right: 4),
                          width: p1.maxWidth * 0.1,
                          height: p1.maxHeight * 0.1,
                          color: abuabu,
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://websisfopilkada.taekwondosulsel.info/public/storage/${widget.gambar}',
                            fit: BoxFit.fill,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    CircularProgressIndicator(
                                        value: downloadProgress.progress),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
