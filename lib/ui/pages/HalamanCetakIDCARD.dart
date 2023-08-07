part of 'pages.dart';

class CetakIdCard extends StatefulWidget {
  String nama;
  String nik;
  String nowa;
  String jabatan;

  CetakIdCard(
      {super.key, this.nama = 'Agus',
      this.nik = '7308912',
      this.nowa = '0872182121',
      this.jabatan = 'Saksi'});
  @override
  State<CetakIdCard> createState() => _CetakIdCardState();
}

class _CetakIdCardState extends State<CetakIdCard> {
  TextEditingController passwordcontrol = TextEditingController();
  TextEditingController passwordbarucontrol = TextEditingController();
  TextEditingController passwordbaruulangcontrol = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => Padding(
          padding: EdgeInsets.only(top: p1.maxHeight * 0.2),
          child: Container(
              width: p1.maxWidth,
              height: p1.maxHeight * 0.4,
              decoration: BoxDecoration(
                  color: putih, borderRadius: BorderRadius.circular(15)),
              child: LayoutBuilder(
                builder: (p0, p2) => Column(
                  children: [
                    SizedBox(
                      width: p2.maxWidth,
                      height: p2.maxHeight * 0.5,
                      child: Image.asset(
                        'assets/contohgambar.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: p2.maxWidth * 0.1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Kartu Indentitas",
                              textAlign: TextAlign.start,
                              style: textpoppin.copyWith(
                                  fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              Text(
                                  'Nama Lengkap:\nNIK:\nNo.Whatsapp:\nJabatan:',
                                  style: textpoppin),
                              Text(
                                  '${widget.nama}\n${widget.nik}\n${widget.nowa}\n${widget.jabatan}',
                                  style: textpoppin),
                              ButtonUtama(
                                  width: p1.maxWidth * 0.06,
                                  height: p1.maxHeight * 0.06,
                                  namabutton: "Cetak ID Card",
                                  voidcallback: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const PdfVieww()));
                                  }),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ))),
    );
  }
}
