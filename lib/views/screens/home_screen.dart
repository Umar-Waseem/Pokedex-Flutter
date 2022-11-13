import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FormBuilder(
        key: _fbKey,
        child: Column(
          children: [
            FormBuilderTextField(
              name: 'ID',
              decoration:
                  const InputDecoration(labelText: 'Search Pokemon By ID'),
            ),
            const SizedBox(height: 16.0),
            FormBuilderTextField(
              name: 'Name',
              decoration:
                  const InputDecoration(labelText: 'Search Pokemon By Name'),
            ),
          ],
        ),
      ),
    );
  }
}
