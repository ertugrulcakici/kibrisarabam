import 'package:flutter/material.dart';
import 'package:kibrisarabam/product/widget/custom_scaffold.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: _body(),
    );
  }

  Widget _body() {
    return Container(
      child: const Text("profle"),
    );
  }
}
