import 'package:consultation_project/common/constants/end_points.dart';
import 'package:consultation_project/features/Expert_details/screens/expert_details_screen.dart';
import 'package:consultation_project/main/favorites/providers/favorites_provider.dart';
import 'package:consultation_project/models/expert/expert_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ExpertCard extends StatefulWidget {
  ExpertModel expert;
  int categoryId;
  ExpertCard({
    required this.expert,
    required this.categoryId,
  });

  @override
  State<ExpertCard> createState() => _ExpertCardState();
}

class _ExpertCardState extends State<ExpertCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: Theme.of(context).colorScheme.secondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // color: Theme.of(context).colorScheme.primary.withOpacity(0.87),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.3, 1],
          ),
        ),
        height: 180.h,
        width: 150.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30.r,
                  backgroundColor: Colors.transparent,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: widget.expert.attributes.image != null
                        ? Image(
                            image: NetworkImage(
                                '${Endpoints.baseUrl}${widget.expert.attributes.image}'),
                          )
                        : Image.asset(
                            'assets/images/profile2.png',
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  widget.expert.attributes.rate.toString(),
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    '${widget.expert.attributes.first_name} ${widget.expert.attributes.last_name}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.expert.toggleFavriteStatus();
                      Provider.of<FavoriteProvider>(context, listen: false)
                          .favorites
                          .add(widget.expert);
                    });
                  },
                  icon: Icon(
                    widget.expert.isFavorite!
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.red,
                  ),
                )
              ],
            ),
            Text(
              widget.expert.attributes.address!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey[400], fontSize: 13.sp),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(left: 15.0.w),
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      ExpertDetailsScreen.routeName,
                      arguments: {
                        "expert": widget.expert,
                        "catId": widget.categoryId,
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        'Go to details',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Icon(
                        Icons.arrow_circle_right_outlined,
                        color: Colors.white,
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
