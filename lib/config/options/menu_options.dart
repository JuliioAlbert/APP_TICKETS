import 'package:flutter/material.dart' show IconData, Icons;

class MenuItem {
  final String title;
  final String subTitle;
  final String url;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.url,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: "Pendientes",
    subTitle: "Ticket Pendientes",
    url: "/",
    icon: Icons.plus_one,
  ),
  MenuItem(
      title: "Atendidos",
      subTitle: "Tickets Atendidos",
      url: "/atendidos",
      icon: Icons.smart_button),
  MenuItem(
    title: "Cancelados",
    subTitle: "Tickets Cancelados",
    url: "/cancelado",
    icon: Icons.credit_card,
  ),
];
