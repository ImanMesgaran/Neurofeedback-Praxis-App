import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:neurofeedback_praxis_app/core/utils/utils.dart';
import 'package:neurofeedback_praxis_app/features/events/presentation/cubits/events_cubit.dart';
import 'package:neurofeedback_praxis_app/features/events/presentation/pages/event_screen_page.dart';
import 'package:neurofeedback_praxis_app/features/events/presentation/pages/media_page.dart';
import 'package:neurofeedback_praxis_app/features/events/presentation/pages/news_page.dart';
import 'package:neurofeedback_praxis_app/features/events/presentation/pages/notification_page.dart';
import 'package:neurofeedback_praxis_app/features/events/presentation/pages/profile_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class NavBarPage extends StatefulWidget {
  final String? initialPage;

  final Widget? page;

  const NavBarPage({
    super.key,
    this.initialPage,
    this.page,
  });

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'page_dashboard';
  late Widget? _currentPage;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventsCubit, EventsState>(
      builder: (context, state) {
        _currentPageName = state.currentTabIndexName;
        final tabs = {
          'page_news': const NewsPage(),
          'page_media': const MediaPage(),
          'page_events': const EventScreen(),
          'page_notification': const NotificationPage(),
          'page_profile': const ProfileScreen(),
        };
        final currentIndex = tabs.keys.toList().indexOf(_currentPageName);

        return Scaffold(
          body: _currentPage ??
              IndexedStack(
                index: currentIndex,
                children: tabs.values.toList(),
              ),
          bottomNavigationBar: Visibility(
            visible: responsiveVisibility(
              context: context,
              tabletLandscape: false,
              desktop: false,
            ),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (i) {
                context
                    .read<EventsCubit>()
                    .changeCurrentTab(tabName: tabs.keys.toList()[i]);
              },
              showSelectedLabels: true,
              showUnselectedLabels: true,
              backgroundColor: Colors.black,
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(LucideIcons.fileText), label: "News"),
                BottomNavigationBarItem(
                    icon: Icon(LucideIcons.image), label: "Media"),
                BottomNavigationBarItem(
                    icon: Icon(LucideIcons.calendar), label: "Event"),
                BottomNavigationBarItem(
                    icon: Icon(LucideIcons.bell), label: "Notification"),
                BottomNavigationBarItem(
                    icon: Icon(LucideIcons.user), label: "Profile"),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;

    WidgetsBinding.instance.addPostFrameCallback(callback);
  }

  void callback(Duration timeStamp) async {}

  void listenForNewConversations() {}

  void listenForNewMessages() {}
}
