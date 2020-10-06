import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/screens/settings_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(15),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking up!',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 35, color: Colors.red),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _buildListTile(
            title: 'Meals',
            icon: Icons.restaurant,
            onTap: () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          _buildListTile(
              title: 'Settings',
              icon: Icons.settings,
              onTap: () => Navigator.of(context)
                  .pushReplacementNamed(SettingsScreen.routeName))
        ],
      ),
    );
  }

  ListTile _buildListTile({String title, IconData icon, Function onTap}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: GoogleFonts.robotoCondensed()
            .copyWith(fontSize: 25, fontWeight: FontWeight.w600),
      ),
      onTap: onTap,
    );
  }
}
