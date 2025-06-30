import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/app_colors.dart';
import 'package:my_portfolio/utils/app_static_lists.dart';
import 'package:my_portfolio/utils/app_strings.dart';
import 'package:my_portfolio/utils/app_styles.dart';
import 'package:my_portfolio/widgets/contact_info_tile.dart';

class GetInTouch extends StatelessWidget {
  const GetInTouch({super.key});
  static List<ContactInfoTile> contactTiles = AppStaticLists.contactTiles;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.getInTouch,
          style: AppStyles.s28W700.copyWith(
            color: isDark ? AppColors.white : AppColors.black,
          ),
        ),
        const SizedBox(height: 30),
        ListView.separated(
          itemBuilder: (context, index) => contactTiles[index],
          separatorBuilder:
              (context, index) => Padding(
                padding: const EdgeInsets.only(right: 26),
                child: Divider(color: AppColors.accentTeal.withOpacity(.5)),
              ),
          itemCount: contactTiles.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          dragStartBehavior: DragStartBehavior.down,
        ),
      ],
    );
  }
}
