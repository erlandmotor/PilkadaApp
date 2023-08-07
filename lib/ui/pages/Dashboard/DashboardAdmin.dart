part of '../pages.dart';

class DashboardAdmin extends StatelessWidget {
  const DashboardAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // kasih kondisi sini
        BlocBuilder<DatadashboardBloc, DatadashboardState>(
      builder: (context, state) {
        return state is DataDashboardLoaded
            ? LayoutBuilder(
                builder: (p0, p1) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: p1.maxWidth,
                            height: p1.maxHeight,
                            decoration: BoxDecoration(
                                color: putih,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      spreadRadius: 0.5,
                                      blurRadius: 5,
                                      offset: const Offset(2, 4))
                                ],
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("Jumlah DPT",
                                    style: textpoppin.copyWith(
                                        fontWeight: FontWeight.bold)),
                                Text(state.data!.dpt.toString(),
                                    style: textpoppin.copyWith(
                                        fontWeight: FontWeight.bold)),
                              ],
                            ))
                      ],
                    ))
            : const Text("");
      },
    );
  }
}
