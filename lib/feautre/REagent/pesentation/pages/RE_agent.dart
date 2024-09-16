import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/core/constance/string.dart';
import 'package:real_estate/core/widget/loading.dart';
import 'package:real_estate/feautre/city/domain/entity/neighborhood.dart';
import 'package:real_estate/feautre/city/domain/entity/region.dart';
import '../../../city/domain/entity/city.dart';
import '../../../city/pesntation/city_bloc/city_cubit.dart';
import '../../../city/pesntation/neighborhood_bloc/neighborhood_cubit.dart';
import '../../../city/pesntation/region_bloc/region_cubit.dart';
import '../bloc/reagent_cubit.dart';

class ReAgentPage extends StatefulWidget {
  ReAgentPage({Key? key});

  @override
  State<ReAgentPage> createState() => _ReAgentPageState();
}

class _ReAgentPageState extends State<ReAgentPage> {
  TextEditingController searchForReAgent = TextEditingController();

  String? selectedCity;
  String? selectedRegion;
  String? selectedNeighborhood;

  late int selectId = 0;

  List<DropdownMenuItem<String>> getCityDropdownItems(List<City> cities) {
    return cities.map((city) {
      return DropdownMenuItem<String>(
        value: city.name,
        child: Text(city.name),
      );
    }).toList();
  }

  List<DropdownMenuItem<String>> getRegionDropdownItems(List<Region> regions) {
    return regions.map((region) {
      return DropdownMenuItem<String>(
        value: region.name,
        child: Text(region.name),
      );
    }).toList();
  }

  List<DropdownMenuItem<String>> getNeighborhoodDropdownItems(List<Neighborhood> neighborhoods) {
    return neighborhoods.map((neighborhood) {
      return DropdownMenuItem<String>(
        value: neighborhood.name,
        child: Text(neighborhood.name),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "ابحث عن وكيل عقاري",
                style: TextStyle(color: pColor, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                  ),
                  Flexible(
                    child: BlocBuilder<NeighborhoodCubit, NeighborhoodState>(
                      builder: (context, state) {
                        return DropdownButton<String>(
                          isExpanded: true,
                          hint: Text('اختر حي'),
                          value: selectedNeighborhood,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedNeighborhood = newValue;
                            });
                          },
                          items: selectedRegion != null && state is NeighborhoodSuccess
                              ? getNeighborhoodDropdownItems(state.neighborhood)
                              : [],
                        );
                      },
                    ),
                  ),
                  Flexible(
                    child: BlocBuilder<RegionCubit, RegionState>(
                      builder: (context, state) {
                        return DropdownButton<String>(
                          isExpanded: true,
                          hint: Text('اختر منطقة'),
                          value: selectedRegion,
                          onChanged: (String? newValue) {
                            int regionId = 0;
                            setState(() {
                              selectedRegion = newValue;
                              selectedNeighborhood = null;
                              regionId = state is RegionSuccess
                                  ? state.region
                                  .firstWhere((region) => region.name == selectedRegion)
                                  .id
                                  : 0;
                            });
                            context.read<NeighborhoodCubit>().getAllNeighborhood(regionId);
                          },
                          items: selectedCity != null && state is RegionSuccess
                              ? getRegionDropdownItems(state.region)
                              : [],
                        );
                      },
                    ),
                  ),
                  Flexible(
                    child: BlocBuilder<CityCubit, CityState>(
                      builder: (context, state) {
                        return DropdownButton<String>(
                          isExpanded: true,
                          hint: Text('اختر مدينة'),
                          value: selectedCity,
                          onChanged: (String? newValue) {
                            int cityId = 0;
                            setState(() {
                              selectedCity = newValue;
                              cityId = state is CitySuccess
                                  ? state.city
                                  .firstWhere((city) => city.name == selectedCity)
                                  .id
                                  : 0;
                              selectedRegion = null;
                              selectedNeighborhood = null;
                            });
                            context.read<RegionCubit>().getAllRegion(cityId);
                          },
                          items: state is CitySuccess ? getCityDropdownItems(state.city) : [],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "الوكلاء العقاريين المتوفرة",
                style: TextStyle(color: pColor, fontSize: 20),
              ),
            ),
            BlocBuilder<ReagentCubit, ReagentState>(
              builder: (context, state) {
                if (state is ReagentLoading) {
                  return Center(child: LoadingWidget());
                } else if (state is ReagentSuccess) {
                  final agents = state.rEAgent;
                  if (agents.isNotEmpty) {
                    return Column(
                      children: agents.map((agent) {
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(agent.image),
                            ),
                            title: Text(agent.name),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("رقم الهاتف الأرضي: ${agent.phone}"),
                                Text("رقم الموبايل: ${agent.mobile}"),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  } else {
                    return Center(
                      child: Text("لا يوجد وكلاء عقاريين حتى الآن ..... سيتم إضافتهم قريباً"),
                    );
                  }
                } else if (state is ReagentFailure) {
                  return Center(child: Text(state.message));
                } else {
                  return Center(child: Text("حدث خطأ ما"));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}