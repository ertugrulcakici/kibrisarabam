import 'package:flutter/material.dart';
import 'package:kibrisarabam/product/widget/custom_scaffold.dart';

class CreateItemAdView extends StatefulWidget {
  const CreateItemAdView({super.key});

  @override
  State<CreateItemAdView> createState() => _CreateItemAdViewState();
}

class _CreateItemAdViewState extends State<CreateItemAdView> {
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
        child: Center(
      child: Text('CreateItemAdView'),
    ));
  }
}
