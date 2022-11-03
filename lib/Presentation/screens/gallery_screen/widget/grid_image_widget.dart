import 'package:flutter/material.dart';
import 'package:my_gallery/Presentation/resources/app_size_config.dart';
import 'package:my_gallery/constants/constants.dart';

class GridImageWidget extends StatelessWidget {
  final String image;
  const GridImageWidget({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        SizeConfig.height*0.01,
      ),
      child: InkWell(
        onTap: (){},
        child: Material(
          borderRadius: BorderRadius.circular(SizeConfig.height*0.025),
          elevation: 2.0,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image(
            // image: NetworkImage(image),
            image: NetworkImage('${AppConstants.baseUrl}/media/1/$image'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
