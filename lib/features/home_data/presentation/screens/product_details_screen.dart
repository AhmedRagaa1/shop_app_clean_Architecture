import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/home_data/presentation/controller/home_cubit.dart';
import '../../../../core/services/services_locator.dart';
import '../components/page_view_component.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int productId;

  ProductDetailsScreen({Key? key, required this.productId})
      : super(key: key);

  PageController boardController = PageController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) =>
      sl<HomeCubit>()
        ..getProductDetails(productId: productId),
      child: SafeArea(
        child: Scaffold(
            body: PageViewComponent(),
        ),
      ),
    );
  }
}

