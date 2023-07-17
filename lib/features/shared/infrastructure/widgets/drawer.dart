import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gen_soportes/config/options/menu_options.dart';
import 'package:gen_soportes/features/auth/presentacion/providers/auth_provider.dart';
import 'package:gen_soportes/features/shared/infrastructure/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends ConsumerStatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SideMenu({super.key, required this.scaffoldKey});

  @override
  ConsumerState<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends ConsumerState<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        final page = appMenuItems[value];
        context.push(page.url);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      backgroundColor: colors.surface,
      children: [
        Container(
          margin: const EdgeInsets.all(15.0),
          child: const Image(
            image: AssetImage("assets/images/nieto.png"),
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
          child: const Text("Tickets"),
        ),
        ...appMenuItems.sublist(0, 3).map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height - 420,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(),
                ),
                const Divider(
                  thickness: 1.0,
                ),
                CustomFilledButton(
                  onPressed: () {
                    ref.read(authProvider.notifier).logout();
                  },
                  text: 'Cerrar sesión',
                ),
              ],
            )),
      ],
    );
  }
}
