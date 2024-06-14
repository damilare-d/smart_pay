import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartpay/ui/styles/colors.dart';
import 'package:stacked/stacked.dart';
import '../../../app/application.dart';
import 'country_selection_sheet_model.dart';
import '../../styles/style.dart';

class CountrySelectionSheet extends StackedView<CountrySelectionSheetModel> {
  final Function(SheetResponse)? completer;
  final SheetRequest request;

  const CountrySelectionSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
      BuildContext context,
      CountrySelectionSheetModel viewModel,
      Widget? child,
      ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: viewModel.searchController,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onChanged: viewModel.filterCountries,
                ),
              ),
              IconButton(
                icon: Icon(Icons.cancel),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: viewModel.filteredCountries.length,
              itemBuilder: (context, index) {
                final country = viewModel.filteredCountries[index];
                return ListTile(
                  leading: SvgPicture.asset(viewModel.countries[index].flag),
                  title: Text('${country.code} - ${country.name}'),
                  trailing: viewModel.selectedCountry == country
                      ? const Icon(Icons.check, color: kcPrimaryColor)
                      : null,
                  selected: viewModel.selectedCountry == country,
                  selectedTileColor: const Color(0xffF9FAFB),
                  onTap: () {
                    viewModel.selectCountry(country);
                    completer?.call(SheetResponse(confirmed: true, data: country));
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  CountrySelectionSheetModel viewModelBuilder(BuildContext context) => CountrySelectionSheetModel();
}

