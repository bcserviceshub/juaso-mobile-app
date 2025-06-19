import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:juaso_mobile_app/core/utils/app_colors.dart';
import 'package:juaso_mobile_app/core/widgets/app_buttons.dart';
import 'package:juaso_mobile_app/core/widgets/text_widgets.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  int currentIndex = 0;

  Widget _buildChip(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: const Color(0xffDBFFE1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black87,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildDotIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: images.asMap().entries.map((entry) {
        bool isActive = currentIndex == entry.key;
        return Container(
          width: isActive ? 16.w : 8.w,
          height: 8.h,
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          decoration: BoxDecoration(
            shape: isActive ? BoxShape.rectangle : BoxShape.circle,
            borderRadius: isActive ? BorderRadius.circular(4) : null,
            color: isActive ? AppColors.primary : Colors.grey[300],
          ),
        );
      }).toList(),
    );
  }

  final List<String> images = [
    "assets/images/home/banner_promo/banner_one.png",
    "assets/images/home/banner_promo/banner_two.png",
    "assets/images/home/banner_promo/banner_three.png",
    "assets/images/home/banner_promo/banner_four.png",
  ];
  final List<String> itemsListImages = [
    "assets/images/home/item_list_one/cream.png",
    "assets/images/home/item_list_one/stationary.png",
    "assets/images/home/item_list_one/airpod.png",
  ];

  final List<Map<String, dynamic>> products = [
    {
      "image": "assets/images/home/item_list_two/suits.jpg",
      "title": "Lorem ipsum dolor sit amet",
      "price": "GHS 14.99",
      "oldPrice": "GHS 22.99",
      "rating": 4.9,
      "isFavorite": true,
    },
    {
      "image": "assets/images/home/item_list_two/skin_care_r.jpg",
      "title": "Skincare essentials",
      "price": "GHS 14.99",
      "oldPrice": "GHS 32.99",
      "rating": 4.0,
      "isFavorite": false,
    },
    {
      "image": "assets/images/home/item_list_two/camera.jpg",
      "title": "Camera",
      "price": "GHS 14.99",
      "oldPrice": "GHS 32.99",
      "rating": 4.0,
      "isFavorite": false,
    },
    // Add more items as needed
  ];

  final List<Map<String, dynamic>> socialItems = [
    {
      "image": "assets/images/home/social_ban1.png",
      "title": "Lorem ipsum dolor Lorem ipsum dolor siur",
      "backgroundColor": const Color(0xffD5ECE6),
    },
    {
      "image": "assets/images/home/social_ban2.png",
      "title": "Lorem ipsum dolor Lorem ipsum dolor siur",
      "backgroundColor": const Color(0xffD6C8F1),
    },
    {
      "image": "assets/images/home/social_ban3.png",
      "title": "Lorem ipsum dolor Lorem ipsum dolor siur",
      "backgroundColor": const Color(0xffF6C065),
    },
  ];

  final List<Map<String, dynamic>> recentlyViewed = [
    {
      "image": "assets/images/home/recently_viewed/recently_viewed1.jpg",
      "title": "Lorem ipsum dolor sit amet",
      "price": "GHS 14.99",
      "rating": 4.9,
    },
    {
      "image": "assets/images/home/recently_viewed/recently_viewed2.jpg",
      "title": "Lorem ipsum dolor sit amet",
      "price": "GHS 14.99",
      "rating": 4.9,
    },
    {
      "image": "assets/images/home/recently_viewed/recently_viewed3.jpg",
      "title": "Lorem ipsum dolor sit amet",
      "price": "GHS 14.99",
      "rating": 4.9,
    },
  ];

  // Define a constant for consistent horizontal padding
  static final double kHorizontalPadding =
      16.w; // Using ScreenUtil for responsiveness

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // Apply the main horizontal padding here once
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                // The header which contains an icon and a search field
                // Removed redundant Padding here, as it's now handled by the parent Padding
                Row(
                  children: [
                    Image.asset(
                      "assets/images/splash_screen/juaso_logo.png",
                      height: 28.h,
                      width: 38.w,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Container(
                        height: 38.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: AppColors.nutural400,
                            ),
                            suffixIcon: Icon(
                              Icons.mic,
                              color: AppColors.nutural400,
                            ),
                            hintText: 'Search or ask question',
                            hintStyle: TextStyle(
                              color: AppColors.nutural400,
                              fontSize: 14.sp,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 8.h,
                              horizontal: 5.w,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                  ],
                ),

                // Horizontal list with location and categories
                const SizedBox(height: 20),
                SizedBox(
                  height: 40.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets
                        .zero, // Removed external padding to align with main column
                    children: [
                      _buildChip("📍 Devtraco Comm. 25"),
                      SizedBox(width: 8.w),
                      _buildChip("Fashion"),
                      SizedBox(width: 8.w),
                      _buildChip("Groceries"),
                      SizedBox(width: 8.w),
                      _buildChip("Beauty"),
                      SizedBox(width: 8.w),
                      _buildChip("Electronics"),
                      SizedBox(width: 8.w),
                      _buildChip("Home & Garden"),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                // CarouselSlider and Dot Indicator are already centered or
                // use their own internal spacing, so no additional padding needed here.
                CarouselSlider.builder(
                  itemCount: images.length,
                  itemBuilder: (context, index, realIndex) {
                    return Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            images[index],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 20,
                          child: ElevatedButton(
                            onPressed: () {
                              // Add your action here
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green.shade600,
                              shape: StadiumBorder(),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                            ),
                            child: Text(
                              'Shop now',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  options: CarouselOptions(
                    height: 200,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    aspectRatio: 16 / 9,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 10),
                _buildDotIndicator(),

                const SizedBox(
                  height: 50,
                ),
                // Removed padding from the ListView.builder for itemsListImages
                SizedBox(
                  height: 120.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets
                        .zero, // Removed padding to align with parent column's padding
                    itemCount: itemsListImages.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100.h,
                        width: 100.w,
                        margin: EdgeInsets.only(right: 10.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(itemsListImages[index]),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),

                // Removed Padding from Row to leverage parent Padding
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Header2Text(text: "Donkomi (Flash sales)"),
                        BodyText(text: "up to 55% off"),
                      ],
                    ),
                    LinkText(
                      text: "view all",
                      textColor: AppColors.primary,
                      fontSize: 14.sp,
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                SizedBox(
                  height: 200
                      .h, // Retained original height, adjusted below for blur content
                  child: ListView.separated(
                    padding:
                        EdgeInsets.zero, // Removed padding to align with parent
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    separatorBuilder: (_, __) => SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Stack(
                          children: [
                            Container(
                              width: 160.w,
                              height: 260
                                  .h, // Adjusted height for image to fit blur content
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(product['image']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 8.h,
                              right: 8.w,
                              child: Icon(
                                product['isFavorite']
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.redAccent,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Padding(
                                padding: EdgeInsets.all(
                                    6.w), // adds spacing from image border
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(14),
                                  child: BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                    child: Container(
                                      padding: EdgeInsets.all(10.w),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.3),
                                        border: Border.all(
                                            color: Colors.white, width: 1.2),
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start, // Align prices to the left
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  product['title'],
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14),
                                                ),
                                              ),
                                              SizedBox(width: 4.w),
                                              Icon(Icons.star,
                                                  color: Colors.amber,
                                                  size: 12.sp),
                                              SizedBox(width: 2.w),
                                              Text(
                                                product['rating'].toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10.sp),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 6.h),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                product['price'],
                                                style: TextStyle(
                                                    color: Colors.greenAccent,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                product['oldPrice'],
                                                style: TextStyle(
                                                  color: Colors.white60,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                              height: 8
                                                  .h), // Added spacing between prices and add button
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .end, // Align +Add to the right
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.w,
                                                    vertical: 4.h),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.white,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                                child: Text(
                                                  '+ Add',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12.sp),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),

                // Removed Padding from Container as parent Padding now handles it
                // and the internal padding of the Container is already symmetric.
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  width: double
                      .infinity, // Use double.infinity to fill available width
                  height: 200.h,
                  decoration: BoxDecoration(
                    color: const Color(0xffE6F2F8),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Header2Text(text: "Join Juaso in Seconds!"),
                      const SizedBox(
                        height: 10,
                      ),
                      BodyText(
                          text:
                              "Create your free account or sign in to unlock the best Juaso deals!"),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/home/buy_protect.png",
                            height: 15.h,
                            width: 15.w,
                          ),
                          BodyText(text: "100% Buyer Protection"),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/home/secure_pay.png",
                            height: 15.h,
                            width: 15.w,
                          ),
                          BodyText(text: "Secure Payments"),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: 130.w,
                              height: 35.h,
                              child:
                                  AppButton(text: "Sign in", onPressed: () {})),
                          SizedBox(
                            width: 130.w,
                            height: 35.h,
                            child: AppButtonAlt(
                                text: "Sign up",
                                textColor: AppColors.primary,
                                onPressed: () {}),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                Header1Text(text: "Social trending"),
                // Added a final SizedBox for scrollability at the bottom
                const SizedBox(height: 20),

                Image.asset("assets/images/home/social_media.png"),

                const SizedBox(height: 20),

                Container(
                  height: 180.h,
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: socialItems[0]["backgroundColor"],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Header2Text(text: socialItems[0]["title"]),
                      SizedBox(height: 4.h),
                      LinkText(text: "shop now"),
                      SizedBox(height: 4.h),
                      Image.asset(
                        socialItems[0]["image"],
                        height: 100.h,
                        width: 300.w,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 200.h,
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: socialItems[1]["backgroundColor"],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Header2Text(text: socialItems[1]["title"]),
                            SizedBox(height: 4.h),
                            LinkText(text: "shop now"),
                            SizedBox(height: 4.h),
                            Image.asset(
                              socialItems[1]["image"],
                              height: 50.h,
                              width: 100.w,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Container(
                        height: 200.h,
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: socialItems[2]["backgroundColor"],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Header2Text(
                              text: socialItems[2]["title"],
                              fontSize: 14.sp,
                            ),
                            SizedBox(height: 4.h),
                            LinkText(text: "shop now"),
                            Image.asset(
                              socialItems[2]["image"],
                              height: 90.h,
                              width: 200.w,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                Image.asset("assets/images/home/video_ads.png"),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Header1Text(text: "Recently viewed"),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 10.r,
                          backgroundColor: Colors.grey[200],
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 14.sp,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        CircleAvatar(
                          radius: 10.r,
                          backgroundColor: Colors.grey[200],
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 14.sp,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),

                SizedBox(
                  height: 200.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    itemCount: recentlyViewed.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 160.w,
                        margin: EdgeInsets.only(right: 12.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    recentlyViewed[index]["image"],
                                    height: 120.h,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 8.h,
                                  right: 8.w,
                                  child: CircleAvatar(
                                    radius: 7.5.r,
                                    backgroundColor: Colors.white,
                                    child: Image.asset(
                                      "assets/images/home/recently_viewed/Vector.png",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                Expanded(
                                  child: BodyText(
                                    text: recentlyViewed[index]["title"],
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Icon(Icons.star,
                                    color: Colors.amber, size: 14.sp),
                                SizedBox(width: 2.w),
                                BodyText(
                                  text: recentlyViewed[index]['rating']
                                      .toString(),
                                  fontSize: 12.sp,
                                  textColor: AppColors.nutural500,
                                ),
                              ],
                            ),
                            SizedBox(height: 4.h),
                            BodyText(
                              text: recentlyViewed[index]["price"],
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              textColor: AppColors.primary,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Header1Text(text: "Popular products"),
                      LinkText(
                        text: "view all",
                        textColor: AppColors.primary,
                        fontSize: 14.sp,
                      ),
                    ]),
                const SizedBox(height: 20),

                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16.h,
                    crossAxisSpacing: 16.w,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: 6, // Adjust based on number of images
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey[200]!),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                            child: Image.asset(
                              'assets/images/home/popular/popular${index + 1}.jpg',
                              height: 140.h,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Popular Item ${index + 1}',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),

              Align(
                alignment: Alignment.centerRight,
                child: FloatingActionButton(
                  onPressed: () {
                    // Add your action here
                  },
                  backgroundColor: AppColors.primary,
                  child:Image.asset(
                    "assets/images/home/chat.png",
                  )
                ),
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
