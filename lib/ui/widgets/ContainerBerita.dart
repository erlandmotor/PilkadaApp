part of 'widgets.dart';

class ContainerBerita extends StatelessWidget {
  final VoidCallback? fungsi;
  String judul;
  final double? width;
  final double? height;
  String? foto;

  ContainerBerita({
    super.key,
    required this.fungsi,
    this.judul = '',
    required this.height,
    this.foto = '',
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: fungsi,
          child: Container(
              margin: const EdgeInsets.only(top: 7, right: 10),
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: putih,
                borderRadius: BorderRadius.circular(12),
              ),
              child: LayoutBuilder(
                builder: (p0, p1) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: p1.maxWidth,
                      height: p1.maxHeight * 0.5,
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://websisfopilkada.taekwondosulsel.info/public/storage/$foto',
                        fit: BoxFit.fill,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: p1.maxWidth * 0.04, top: p1.maxHeight * 0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            judul,
                            style: textpoppin.copyWith(
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "01 April 2020",
                            style: textpoppin.copyWith(
                                fontSize: p1.maxHeight * 0.06),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
