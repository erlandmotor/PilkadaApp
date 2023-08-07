part of 'pages.dart';

class PdfVieww extends StatefulWidget {
  const PdfVieww({Key? key}) : super(key: key);

  @override
  State<PdfVieww> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfVieww> {
  String? id;
  Uint8List? _pdfBytes;
  File? localfile;
  double? onprogress;
  Authentication auth = Authentication();
  @override
  initState() {
    var profile = context.read<DataprofileBloc>().state;
    if (profile is DataprofileLoaded) {
      setState(() {
        id = profile.data!.id.toString();
      });
      // auth.downloadpdf(userku: profile.data!.id.toString()).then((value) => {
      //       setState(() {
      //         _pdfBytes = value;
      //       })
      //     });
      auth.getdatapdf(userku: profile.data!.id.toString()).then((value) {
        setState(() {
          localfile = value;
        });
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      localfile != null
          ? Container(
              child:
                  SfPdfViewer.file(localfile!, canShowPaginationDialog: false))
          : const Center(child: CircularProgressIndicator()),
      Align(
          alignment: Alignment.bottomCenter,
          child: onprogress != null
              ? const CircularProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: ButtonUtama(
                      width: 120,
                      height: 40,
                      namabutton: 'Download',
                      voidcallback: () {
                        FileDownloader.downloadFile(
                            name: 'ID_CARD.pdf',
                            onProgress: (fileName, progress) {
                              setState(() {
                                onprogress = progress;
                              });
                            },
                            onDownloadCompleted: (path) {
                              setState(() {
                                onprogress = null;
                              });
                              QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.success,
                                  text: 'ID CARD Disimpan Di Download',
                                  onConfirmBtnTap: () {
                                    Navigator.pop(context);
                                  },
                                  confirmBtnColor: colorbiru,
                                  confirmBtnTextStyle:
                                      textpoppin.copyWith(color: putih));
                            },
                            url:
                                'https://websisfopilkada.taekwondosulsel.info/api/pdf/user/$id');
                      }),
                ))
      // SfPdfViewer.memory(bytes)
      // _pdfBytes != null
      //     ? SfPdfViewer.memory(_pdfBytes!)
      //     : Center(child: CircularProgressIndicator())
    ]));
  }
}
