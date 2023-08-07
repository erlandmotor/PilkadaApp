part of 'pages.dart';

class HalamanJumlahdpt extends StatefulWidget {
  const HalamanJumlahdpt({super.key});

  @override
  State<HalamanJumlahdpt> createState() => _HalamanJumlahdptState();
}

class _HalamanJumlahdptState extends State<HalamanJumlahdpt> {
  var controller = WebViewController()
    ..setUserAgent('https://cekdptonline.kpu.go.id/')
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {},
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://cekdptonline.kpu.go.id/'));
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
              width: p1.maxWidth,
              height: p1.maxHeight * 0.9,
              child: WebViewWidget(controller: controller))
        ],
      ),
    );
  }
}
