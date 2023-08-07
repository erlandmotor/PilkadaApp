part of 'widgets.dart';

class ButtonUtama extends StatelessWidget {
  final double? width;
  final double? height;
  final String? namabutton;
  Color? color;

  final VoidCallback? voidcallback;

  ButtonUtama(
      {super.key,
      this.width,
      this.height,
      this.namabutton,
      this.voidcallback,
      this.color = birumuda});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 0.5,
                blurRadius: 5,
                offset: const Offset(2, 4))
          ]),
      child: TextButton(
          onPressed: voidcallback,
          child: LayoutBuilder(
            builder: (p0, p1) => Text(
              '$namabutton',
              style: textpoppin.copyWith(
                  color: hitam,
                  fontSize: p1.maxHeight * 0.55,
                  fontWeight: FontWeight.w600),
            ),
          )),
    );
  }
}
