import 'package:flutter/material.dart';
import '../components/main_drawer.dart';
import '../utils/app_routes.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  var settings = Settings();

  Widget _creteSwitch(String title,
      String subtitle,
      bool value,
      Function(bool) onChanged,) {
    return SwitchListTile.adaptive(
      activeColor: Colors.green,
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Configurações'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Configurações',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleMedium,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _creteSwitch(
                    'Sem Glutén',
                    'Só exibe refeições sem glutén!',
                    settings.isGlutenFree,
                        (value) =>
                        setState(() => settings.isGlutenFree = value),
                  ),
                  _creteSwitch(
                    'Sem Lactose',
                    'Só exibe refeições sem lactose!',
                    settings.isLactoseFree,
                        (value) =>
                        setState(() => settings.isLactoseFree = value),
                  ),
                  _creteSwitch(
                    'Vegana',
                    'Só exibe refeições veganas!',
                    settings.isVegan,
                        (value) =>
                        setState(() => settings.isVegan = value),
                  ),
                  _creteSwitch(
                    'vegetariana',
                    'Só exibe refeições vegetarianas!',
                    settings.isVegetarian,
                        (value) =>
                        setState(() => settings.isVegetarian = value),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}