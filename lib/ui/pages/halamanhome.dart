part of 'pages.dart';

class HalamanHome extends StatelessWidget {
  dynamic haldata;

  HalamanHome({super.key, this.haldata});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<DataprofileBloc, DataprofileState>(
              builder: (context, state) {
                return Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: putih, width: 4.0)),
                        width: p1.maxWidth * 0.13,
                        height: p1.maxHeight * 0.13,
                        child: state is DataprofileLoaded
                            ? state.data!.foto == null
                                ? const CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        AssetImage('assets/avatar.png'))
                                : CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                        'https://web-sisfopilkada.taekwondosulsel.info/public/storage/${state.data!.foto}'))
                            : const Text(""),
                      ),
                    ),
                    SizedBox(width: p1.maxWidth * 0.02),
                    Flexible(
                      flex: 1,
                      child: BlocBuilder<DataprofileBloc, DataprofileState>(
                        builder: (context, state) {
                          if (state is DataprofileLoaded) {
                            return Text("Halo, ${state.data!.name}",
                                style: textpoppin.copyWith(
                                    fontWeight: FontWeight.w600));
                          }
                          return const Text("");
                        },
                      ),
                    ),
                    SizedBox(width: p1.maxWidth * 0.34),
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                          width: p1.maxWidth * 0.2,
                          height: p1.maxHeight * 0.07,
                          child: Image.asset('assets/logo2.png',
                              fit: BoxFit.fill)),
                    ),
                  ],
                );
              },
            ),
            Container(
                width: p1.maxWidth,
                height: p1.maxHeight * 0.24,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset('assets/gambarhome.png',
                        fit: BoxFit.fill))),
            SizedBox(height: p1.maxHeight * 0.04),
            SizedBox(
              width: p1.maxWidth,
              height: p1.maxHeight * 0.08,
              //kasih kondisi sini
              child: haldata,
            ),
          ],
        ),
      ),
    );
  }
}
