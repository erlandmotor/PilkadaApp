part of 'widgets.dart';

class FilterDataInput extends StatefulWidget {
  const FilterDataInput({super.key});

  @override
  State<FilterDataInput> createState() => _FilterDataInputState();
}

class _FilterDataInputState extends State<FilterDataInput> {
  List<DataProvinsi?> dataprovinsi = [];
  List<DataKabupaten?> datakabupaten = [];
  List<DataKecamatan?> datakecamatan = [];
  List<String> listtps = ['1', '2', '3', '4', '5'];
  List<DataDesa?> datadesa = [];
  Authentication auth = Authentication();
  String? selectedkecamatan;
  String? selectedkota;
  String? selectedtps;
  String? selectdesa;
  String? kecamatan;
  String? kabupaten;
  String? kelurahan;
  bool saksi = false;

  @override
  void initState() {
    auth.getdatakabupaten().then((value) => datakabupaten = value!);
    auth.getdataprovinsi().then((value) => dataprovinsi = value!);
    auth.getdatakecamatan().then((value) => datakecamatan = value!);
    auth.getdatadesa().then((value) => datadesa = value!);
    var profile = context.read<DataprofileBloc>().state;
    if (profile is DataprofileLoaded) {
      if (profile.data!.role == 'saksi') {
        setState(() {
          saksi = true;
        });
      }
    }
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
                kabupaten = datakabupaten
                    .firstWhere((e) => e!.name.toString() == selectedkota)!
                    .id
                    .toString();
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
          height: 5,
        ),
        DropdownSearch<String>(
            selectedItem: selectedkecamatan,
            onChanged: (value) {
              setState(() {
                selectedkecamatan = value;
                kecamatan = datakecamatan
                    .firstWhere((e) => e!.name.toString() == selectedkecamatan)!
                    .id
                    .toString();
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
        const SizedBox(
          height: 5,
        ),
        DropdownSearch<String>(
            selectedItem: selectdesa,
            onChanged: (value) {
              setState(() {
                selectdesa = value;
                kelurahan = datadesa
                    .firstWhere((e) => e!.name.toString() == selectdesa)!
                    .id
                    .toString();
              });

              context.read<DatarelawanBloc>().add(RelawanInput(
                  kabupaten: kabupaten,
                  kecamatan: kecamatan,
                  kelurahan: kelurahan));
              context.read<DatakoordinatorBloc>().add(KoorInput(
                  kabupaten: kabupaten,
                  kecamatan: kecamatan,
                  kelurahan: kelurahan));

              context.read<DataaksesorisBloc>().add(PenerimaInput(
                  kabupaten: kabupaten,
                  kecamatan: kecamatan,
                  kelurahan: kelurahan));
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
            )),
        const SizedBox(
          height: 5,
        ),
        saksi == true
            ? DropdownSearch<String>(
                selectedItem: selectedtps,
                onChanged: (value) {
                  setState(() {
                    selectedtps = value;
                  });
                  context.read<DataperolehansuaraBloc>().add(DPSInput(
                      kabupaten: kabupaten,
                      kecamatan: kecamatan,
                      tps: selectedtps,
                      kelurahan: kelurahan));
                  context.read<DataKecuranganBloc>().add(KecuranganInput(
                      kabupaten: kabupaten,
                      kecamatan: kecamatan,
                      tps: selectedtps,
                      kelurahan: kelurahan));
                },
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: "TPS",
                    hintText: "Cari TPS",
                  ),
                ),
                items: listtps,
                popupProps: const PopupProps.menu(
                  showSelectedItems: true,

                  // popupItemDisabled: isItemDisabled,
                  // onChanged: itemSelectionChanged,

                  showSearchBox: true,
                  searchFieldProps: TextFieldProps(cursorColor: birumuda),
                ))
            : const Text(""),
      ],
    );
  }
}
