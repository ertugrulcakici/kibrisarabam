import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kibrisarabam/core/theme/custom_theme_data.dart';
import 'package:kibrisarabam/product/enums/image_enums.dart';
import 'package:kibrisarabam/product/models/car_card_item.dart';
import 'package:kibrisarabam/product/widget/custom_scaffold.dart';
import 'package:kibrisarabam/view/main/search/search_viewmodel.dart';

import 'widget/car_card_item_widget.dart';
import 'widget/search_row_item.dart';

class SearchView extends ConsumerStatefulWidget {
  const SearchView({super.key});

  @override
  ConsumerState<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends ConsumerState<SearchView> {
  late final AutoDisposeChangeNotifierProvider<SearchViewModel> provider;

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    provider = ChangeNotifierProvider.autoDispose(
        (ref) => SearchViewModel(listKey: _listKey));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(provider).initPage();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isWrappedPage: true,
      isFloatingBackground: !ref.watch(provider).isResultPage,
      child: _body(),
    );
  }

  Widget _body() {
    if (ref.watch(provider).isResultPage) {
      return _resultPage();
    } else {
      return _searchPage();
    }
  }

  Widget _resultPage() {
    return Column(children: [
      _searchResultHeader(),
      Expanded(child: _resultList()),
    ]);
  }

  Widget _searchResultHeader() {
    return Container(
      height: 114.h,
      decoration: BoxDecoration(
          gradient: CustomThemeData.colorThemes.primaryGradientReversed,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(60.r),
              bottomRight: Radius.circular(60.r))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white)),
              Text(
                ref.watch(provider).selectedPaths.join(" > "),
                style: CustomThemeData.fontThemes.mPlus1.copyWith(
                  fontSize: 16.sp,
                  color: CustomThemeData.colorThemes.textColor1,
                ),
              ),
            ],
          ),
          DefaultTextStyle(
            style: CustomThemeData.fontThemes.mPlus1
                .copyWith(fontSize: 10.sp, color: Colors.white),
            child: Theme(
              data: ThemeData(
                iconTheme: const IconThemeData(color: Colors.white),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Icon(Icons.filter_alt), Text("Filtrele")],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Icon(Icons.sort_by_alpha_sharp), Text("Sırala")],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Icon(Icons.grid_view), Text("Görünüm")],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Icon(Icons.save), Text("Kaydet")],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _resultList() {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return SizedBox(height: 10.h);
      },
      padding: EdgeInsets.only(top: 20.h),
      itemCount: 5,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CarCardItemWidget(model: CarCardItem.sample());
      },
    );
  }

  Widget _searchPage() {
    return Column(
      children: [_topBar(), _categories()],
    );
  }

  Widget _topBar() {
    if (ref.watch(provider).selectedPaths.isEmpty) return _searchBar();
    return _pathBar();
  }

  Widget _pathBar() {
    return Container(
      margin: EdgeInsets.only(top: 25.h),
      height: 56.h,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white)),
        Expanded(
            child: Text(
          ref.watch(provider).selectedPaths.join(" > "),
          style: CustomThemeData.fontThemes.mPlus1.copyWith(
            fontSize: 16.sp,
            color: CustomThemeData.colorThemes.textColor1,
          ),
        ))
      ]),
    );
  }

  // Widget _title() {
  //   return Align(
  //     alignment: Alignment.centerLeft,
  //     child: Container(
  //       margin: EdgeInsets.only(top: 25.h, left: 25.w),
  //       child: Text(
  //         title != null ? "Kategoriler > ${title!}" : "Kategoriler",
  //         style: CustomThemeData.fontThemes.mPlus1.copyWith(
  //           fontSize: 16.sp,
  //           color: CustomThemeData.colorThemes.textColor1,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _searchBar() {
    return Container(
      margin: EdgeInsets.only(top: 25.h),
      width: 390.w,
      height: 56.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 80.w,
            child: Center(
                child: ImageEnums.search_page_icon
                    .toImage(width: 30.w, height: 28.h)),
          )
        ],
      ),
    );
  }

  Widget _categories() {
    return SingleChildScrollView(
      child: Container(
          margin: EdgeInsets.only(top: 72.h),
          child: AnimatedList(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            initialItemCount: ref.watch(provider).items.length,
            key: _listKey,
            itemBuilder: (context, index, animation) {
              final item = ref.watch(provider).items[index];
              return SearchRowItem(
                item: item,
                animation: animation,
                onTap: (newItems) {
                  ref.watch(provider).addToPath(item);
                },
              );
            },
          )),
    );
    // return ListView.builder(itemBuilder: itemBuilder)
  }
}
