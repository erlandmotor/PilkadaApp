part of 'pages.dart';

class PopUpStatus extends StatelessWidget {
  const PopUpStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<StatusBlocBloc, StatusBlocState>(
        listener: (context, state) {
          if (state is StatusSukses) {
            QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                text: 'Data Berhasil Disimpan',
                onConfirmBtnTap: () {
                  Navigator.pop(context);
                },
                confirmBtnColor: colorbiru,
                confirmBtnTextStyle: textpoppin.copyWith(color: putih));
          }
          if (state is StatusFailed) {
            QuickAlert.show(
                context: context,
                type: QuickAlertType.error,
                text: 'Data Gagal Disimpan',
                onConfirmBtnTap: () {
                  Navigator.pop(context);
                },
                confirmBtnColor: colorbiru,
                confirmBtnTextStyle: textpoppin.copyWith(color: putih));
          }
          if (state is StatusLoading) {
            print("loading");
            QuickAlert.show(
                context: context,
                type: QuickAlertType.loading,
                text: 'Proses Disimpan',
                onConfirmBtnTap: () {
                  Navigator.pop(context);
                },
                confirmBtnColor: colorbiru,
                confirmBtnTextStyle: textpoppin.copyWith(color: putih));
          }
        },
        child: Container());
  }
}
