import 'package:consultation_project/common/constants/end_points.dart';
import 'package:consultation_project/features/Expert_details/screens/expert_details_screen.dart';
import 'package:consultation_project/features/category_details/widgets/expert_card.dart';
import 'package:consultation_project/main/favorites/providers/favorites_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var favoritesList =
        Provider.of<FavoriteProvider>(context, listen: false).favorites;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Center(
          child: Text(
            'Favorite Experts',
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: favoritesList.length,
          itemBuilder: (context, i) {
            if (favoritesList.isEmpty) {
              return Center(
                child: Text('No Favorites Yet!'),
              );
            } else {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                child: Card(
                  elevation: 5,
                  shadowColor: Colors.red,
                  child: ListTile(
                    // style: ListTileStyle.list,
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(ExpertDetailsScreen.routeName);
                    },
                    leading: favoritesList[i].attributes.image == null
                        ? Image.asset('assets/images/profile2.png')
                        : Image(
                            image: NetworkImage(
                              '${Endpoints.baseUrl}${favoritesList[i].attributes.image}',
                            ),
                          ),
                    title: Row(
                      children: [
                        Flexible(
                          child: Text(
                            '${favoritesList[i].attributes.first_name} ${favoritesList[i].attributes.last_name}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40.w,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text(
                          ' ${favoritesList[i].attributes.rate}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Text(favoritesList[i].attributes.address!),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.remove_circle_outline,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              );
            }
          }),
    );
  }
}
