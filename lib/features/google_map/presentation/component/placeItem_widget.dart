import 'package:flutter/material.dart';
import 'package:shop_app/core/utils/app_color.dart';
import 'package:shop_app/features/google_map/domain/entites/search_maps.dart';

class PlaceItemWidget extends StatelessWidget {
  final SearchMaps placeSuggestion;

  const PlaceItemWidget({Key? key, required this.placeSuggestion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var subTitle = placeSuggestion.description
        .replaceAll(placeSuggestion.description.split(',')[0], '');
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.all(8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: AppColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.lightBlue,
              ),
              child: Icon(
                Icons.place,
                color: Colors.blue,
              ),
            ),
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${placeSuggestion.description.split(',')[0]}\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: subTitle.substring(2),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,

                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
