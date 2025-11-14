import 'package:flutter/material.dart';

class OrganisasiScreen extends StatelessWidget {
  const OrganisasiScreen({super.key});

  // struktur sederhana hardcoded untuk demo
  final List<Map<String, dynamic>> struktur = const [
    {
      'unit': 'Rektorat',
      'children': [
        {
          'unit': 'Fakultas Teknik',
          'children': [
            {'unit': 'Program Studi Teknik Informatika'},
            {'unit': 'Program Studi Teknik Sipil'}
          ]
        },
        {'unit': 'Fakultas Ekonomi'}
      ]
    }
  ];

  Widget _node(Map<String, dynamic> n) {
    final children = (n['children'] as List<dynamic>?) ?? [];
    return ExpansionTile(
      title: Text(n['unit']),
      children: children.map<Widget>((c) {
        if (c is String) return ListTile(title: Text(c));
        return _node(c as Map<String, dynamic>);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Struktur Organisasi')), body: ListView(children: struktur.map((n) => _node(n)).toList()));
  }
}
