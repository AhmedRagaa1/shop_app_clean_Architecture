import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/Setting/presentation/controller/setting_cubit.dart';

import '../../../../core/utils/app_color.dart';

class NotificationComponent extends StatelessWidget {
  const NotificationComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
  builder: (context, state)
  {
    var cubit = SettingCubit.get(context);
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: cubit.notifications.length,
      itemBuilder: (context, index) =>Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Container(
                width: MediaQuery.of(context).size.width*.9,
                height: 50,
                child: Text(
                  cubit.notifications[index].title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style:Theme.of(context).textTheme.displayLarge,
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width*.9,
                height: 70,
                child: Text(
                  cubit.notifications[index].message,
                  maxLines: 5,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),
        ],
      ),
      separatorBuilder: (BuildContext context, int index) => Divider(thickness: 2,color: AppColors.primaryColor,), );
  },
);
  }
}
