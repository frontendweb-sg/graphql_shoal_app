import 'package:flutter/material.dart';

class Menu {
  final int? id;
  final String? title;
  final Icon? icon;
  final String? subtitle;
  final Function(BuildContext context)? onPressed;
  final List<Menu>? childrens;
  Menu(
      {this.id,
      this.title,
      this.subtitle,
      this.icon,
      this.onPressed,
      this.childrens});
}

List<Menu> sidebarMenus = [
  Menu(
    id: 1,
    title: 'Personal info',
    childrens: [
      Menu(
        id: 01,
        title: 'Your profile',
        icon: const Icon(Icons.people),
      ),
      Menu(
        id: 02,
        title: 'History Transection',
        icon: const Icon(Icons.history),
      )
    ],
  ),
  Menu(
    id: 2,
    title: 'Security',
    childrens: [
      Menu(
        id: 21,
        title: 'Face Id',
        icon: const Icon(Icons.face),
      ),
      Menu(
        id: 22,
        title: 'Change password',
        icon: const Icon(Icons.password),
      )
    ],
  ),
  Menu(
    id: 3,
    title: 'General',
    childrens: [
      Menu(
        id: 31,
        title: 'Notification',
        icon: const Icon(Icons.notifications),
      ),
      Menu(
        id: 32,
        title: 'Languages',
        icon: const Icon(Icons.language),
      ),
      Menu(
        id: 33,
        title: 'Help & supports',
        icon: const Icon(Icons.help),
      )
    ],
  ),
];
