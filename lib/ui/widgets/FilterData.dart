part of 'widgets.dart';

class FilterData extends StatefulWidget {
  bool kordinator;

  FilterData({super.key, this.kordinator = false});
  @override
  State<FilterData> createState() => _FilterDataState();
}

class _FilterDataState extends State<FilterData> {
  List<DataProvinsi?> dataprovinsi = [];
  List<DataKabupaten?> datakabupaten = [];
  List<DataKecamatan?> datakecamatan = [];
  List<DataDesa>? datadesa = [];
  Authentication auth = Authentication();

  String? selectedkecamatan;
  String? selectedkota;
  String? selectdesa;
  @override
  void initState() {
    auth.getdatakabupaten().then((value) => datakabupaten = value!);
    auth.getdataprovinsi().then((value) => dataprovinsi = value!);
    auth.getdatakecamatan().then((value) => datakecamatan = value!);
    auth.getdatadesa().then((value) => datadesa = value!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownSearch<String>(
            selectedItem: selectedkota,
            onChanged: (value) {
              setState(() {
                selectedkota = value;
                var baru = datakabupaten
                    .firstWhere((e) => e!.name.toString() == selectedkota)!
                    .id
                    .toString();
                context
                    .read<DataperolehansuaraBloc>()
                    .add(DPScariKabupaten(value: baru.toString()));
                context
                    .read<DataaksesorisBloc>()
                    .add(PenerimaSearchKabupaten(value: baru.toString()));
                context
                    .read<DatasaksiBloc>()
                    .add(DatasaksiSearchKabuapten(value: baru.toString()));
                context
                    .read<DatatpsBloc>()
                    .add(DatatpsSearchKabupaten(kabupaten: baru.toString()));
                context
                    .read<DatadptBloc>()
                    .add(DatadptSearchKabupaten(value: baru.toString()));
                context.read<DatakoordinatorBloc>().add(
                    DataKoordinatorSearchKabupaten(value: baru.toString()));
              });
            },
            dropdownDecoratorProps: const DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Kabupaten / Kota",
                hintText: "Cari Kabupaten",
              ),
            ),
            asyncItems: (text) => auth.getkabupatenlist(provinsi: '73'),
            popupProps: const PopupProps.menu(
              showSelectedItems: true,

              // popupItemDisabled: isItemDisabled,
              // onChanged: itemSelectionChanged,

              showSearchBox: true,
              searchFieldProps: TextFieldProps(cursorColor: birumuda),
            )),
        const SizedBox(
          height: 2,
        ),
        DropdownSearch<String>(
            selectedItem: selectedkecamatan,
            onChanged: (value) {
              setState(() {
                selectedkecamatan = value;
                var baru = datakecamatan
                    .firstWhere((e) => e!.name.toString() == selectedkecamatan)!
                    .id
                    .toString();
                context
                    .read<DataperolehansuaraBloc>()
                    .add(DPScariKecamatan(value: baru.toString()));
                context
                    .read<DataaksesorisBloc>()
                    .add(PenerimaSearchKecamatan(value: baru.toString()));
                context
                    .read<DatasaksiBloc>()
                    .add(DatasaksiSearchKecamatan(value: baru.toString()));
                context
                    .read<DatatpsBloc>()
                    .add(DatatpsSearchKecamatan(kecamatan: baru.toString()));
                context
                    .read<DatadptBloc>()
                    .add(DatadptSearchKecamatan(value: baru.toString()));
                context.read<DatakoordinatorBloc>().add(
                    DataKoordinatorSearchKecamatan(value: baru.toString()));
              });
            },
            dropdownDecoratorProps: const DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Kecamatan",
                hintText: "Cari Kecamatan",
              ),
            ),
            asyncItems: (text) =>
                auth.getkecamatanlist(provinsi: selectedkota.toString()),
            popupProps: const PopupProps.menu(
              showSelectedItems: true,

              // popupItemDisabled: isItemDisabled,
              // onChanged: itemSelectionChanged,

              showSearchBox: true,
              searchFieldProps: TextFieldProps(cursorColor: birumuda),
            )),
        widget.kordinator != true
            ? DropdownSearch<String>(
                selectedItem: selectdesa,
                onChanged: (value) {
                  setState(() {
                    selectdesa = value;
                    var baru = datadesa!
                        .firstWhere((e) => e.name.toString() == selectdesa)
                        .id
                        .toString();
                    context
                        .read<DataperolehansuaraBloc>()
                        .add(DPScariKelurahan(value: baru.toString()));
                    context
                        .read<DataaksesorisBloc>()
                        .add(PenerimaSearchkelurahan(value: baru.toString()));
                    context
                        .read<DatasaksiBloc>()
                        .add(DatasaksiSearchKelurahan(value: baru.toString()));
                    context.read<DatatpsBloc>().add(
                        DatatpsSearchKelurahan(kelurahan: baru.toString()));
                    context
                        .read<DatadptBloc>()
                        .add(DatadptSearchKelurahan(value: baru.toString()));
                    context.read<DatakoordinatorBloc>().add(
                        DataKoordinatorSearchKelurahan(value: baru.toString()));
                  });
                },
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: "Desa / Kelurahan",
                    hintText: "Cari Desa / Kelurahan",
                  ),
                ),
                asyncItems: (text) =>
                    auth.getdesalist(provinsi: selectedkecamatan.toString()),
                popupProps: const PopupProps.menu(
                  showSelectedItems: true,

                  // popupItemDisabled: isItemDisabled,
                  // onChanged: itemSelectionChanged,

                  showSearchBox: true,
                  searchFieldProps: TextFieldProps(cursorColor: birumuda),
                ))
            : const SizedBox(),
        const SizedBox(height: 2),
      ],
    );
  }
}
