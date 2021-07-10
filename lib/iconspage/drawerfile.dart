import 'package:blog/iconspage/class.dart';
import 'package:blog/managet/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Drawe {
  static const home = Drawermenu(title: 'Home', icon: Icons.home);
  static const search = Drawermenu(title: 'Search', icon: Icons.search);
  static const category = Drawermenu(title: 'Category', icon: Icons.category);
  static const share = Drawermenu(title: 'Share', icon: Icons.share);
  static const contact = Drawermenu(title: 'Contact', icon: Icons.call);
  static const about = Drawermenu(title: 'About Us', icon: Icons.explore);
  static const logout = Drawermenu(title: 'Logout', icon: Icons.logout);
  static final List<Drawermenu> all = [
    home,
    search,
    category,
    share,
    contact,
    about,
    logout,
  ];
}
