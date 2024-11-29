import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/controller/bloc/bloc/navigation_bloc.dart';
import 'package:social_media_app/utilities/constants.dart';
import 'package:social_media_app/view/account.dart';
import 'package:social_media_app/view/home.dart';
import 'package:social_media_app/view/search.dart';
import 'package:social_media_app/view/videos.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:social_media_app/widget/show_action_sheet.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;
  @override
  void initState() {
    BlocProvider.of<NavigationBloc>(context).add(NavigationInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationBloc, NavigationState>(
      listener: (context, state) {
        print('hi');
        if(state is NavigationShowActionSheetActionState) {
          print('dsujh');
          showActionSheet(context);
        }
      },
      listenWhen:(previous, current) => current is NavigationActionState,
      buildWhen: (previous, current) => current is! NavigationActionState,
      builder: (context, state) {
        switch (state.status) {
          case NavigationStatus.initial || NavigationStatus.loading:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(color: Colors.black),
              ),
            );
          case NavigationStatus.loaded:
            return Scaffold(
              bottomNavigationBar: NavigationBar(
                height: MediaQuery.of(context).size.height * 0.1,
                labelBehavior: labelBehavior,
                selectedIndex: state.currentPageIndex!,
                onDestinationSelected: (int index) {
                  BlocProvider.of<NavigationBloc>(context).add(NavigationChangePageEvent(index: index));
                },
                destinations: <Widget>[
                  const NavigationDestination(
                    selectedIcon: Icon(IconsaxPlusBold.home),
                    icon: Icon(IconsaxPlusLinear.home),
                    label: 'Home',
                  ),
                  const NavigationDestination(
                    selectedIcon: Icon(IconsaxPlusBold.video),
                    icon: Icon(IconsaxPlusLinear.video),
                    label: 'Videos',
                  ),
                  NavigationDestination(
                    enabled: false,
                    icon: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        BlocProvider.of<NavigationBloc>(context).add(NavigationShowActionSheetEvent());
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.13,
                        width: MediaQuery.of(context).size.height * 0.061,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(colors: [
                            Color(0xFFF41C4C),
                            Color(0xFFFC7C34),
                          ]),
                        ),
                        child: const Icon(
                          IconsaxPlusLinear.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    label: '',
                  ),
                  const NavigationDestination(
                    selectedIcon: Icon(IconsaxPlusBold.search_status),
                    icon: Icon(IconsaxPlusLinear.search_normal),
                    label: 'Search',
                  ),
                  const NavigationDestination(
                    selectedIcon: Icon(IconsaxPlusBold.user),
                    icon: Icon(IconsaxPlusLinear.profile),
                    label: 'Account',
                  ),
                ],
              ),
              body: [
                const Home(),
                const Videos(),
                const Center(),
                const Search(),
                const Account(),
              ][state.currentPageIndex!],
            );
          case NavigationStatus.error:
           return const Scaffold(
            body: Center(
              child: Text('Something went wrong'),
            ),
           );
          default:
          print('sxjn');
           return const SizedBox();
        }
      },
    );
  }
}
