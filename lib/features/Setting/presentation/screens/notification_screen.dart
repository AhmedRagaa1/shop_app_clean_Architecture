import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/Setting/presentation/controller/setting_cubit.dart';

import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/constant.dart';
import '../components/notification_component.dart';

class NotificationScreens extends StatelessWidget {
  const NotificationScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SettingCubit>()..getNotificationData(token: token),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: ()
            {

            },
            icon: const Icon(Icons.arrow_back_ios,),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: NotificationComponent(),
          ),
        ),
      ),
    );
  }
}
