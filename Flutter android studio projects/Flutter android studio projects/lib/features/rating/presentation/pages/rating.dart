import 'package:flutter/material.dart';
import 'package:phenikaaxdrive/features/rating/presentation/widgets/tag_buttons.dart';
import 'package:phenikaaxdrive/features/rating/presentation/widgets/stars_rating_widget.dart';
import 'package:phenikaaxdrive/features/trip_detail/presentation/pages/trip_detail_screen.dart';
import 'package:google_fonts/google_fonts.dart';


class Rating extends StatefulWidget {
  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  int selectedStars = 0; // Số sao được chọn
  List<String> tagList = [];

  void initState() {
    super.initState();
    updateTags(0); // Gọi để cập nhật tag khi màn hình khởi chạy
  }// Danh sách tag động

  void updateTags(int stars) {
    setState(() {
      selectedStars = stars;
      switch (stars) {
        case 1:
        case 2:
          tagList = ["Không an toàn", "Giá quá cao", "Ứng dụng lỗi", "Bị gián đoạn", "Hỗ trợ kém", "Di chuyển chậm"];
          break;
        case 3:
          tagList = ["Bình thường", "Giá hơi cao", "Xe ổn", "Không mượt"];
          break;
        case 4:
        case 5:
          tagList = ["Tuyệt vời!", "Xe sạch sẽ", "Lái xe an toàn","Ngồi êm ái", "Đúng giờ", "Di chuyển nhanh", "Ứng dụng dễ dùng"];
          break;
        default:
          tagList = ["Tuyệt vời!", "Xe sạch sẽ", "Lái xe an toàn","Ngồi êm ái", "Đúng giờ", "Di chuyển nhanh", "Ứng dụng dễ dùng"];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, kTextTabBarHeight * 1.3, 0, 16),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/Background.png"),
              ),
            ),
            child: Column(
              children: [
                // Thanh tiêu đề
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: 0,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Center(
                      child: Text(
                        'Chi tiết chuyến đi',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.interTight(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          height: 1.4,
                          color: Color(0xFF0C215C),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 21),

                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        // Khung thông tin chuyến đi
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Color(0xFFCAD1E4), width: 1),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(137, 153, 203, 0.24),
                                blurRadius: 16,
                                spreadRadius: 0,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Cảm ơn bạn đã chọn dịch vụ của",
                                style: GoogleFonts.interTight(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  height: 1.5,
                                  color: Color(0xFF0C215C),
                                ),
                              ),
                              SizedBox(height: 4),
                              Image.asset(
                                height: 18,
                                width: 148,
                                "assets/images/Logo.png",
                              ),
                              SizedBox(height: 16),
                              Text(
                                "Tổng thanh toán",
                                style: GoogleFonts.interTight(
                                  color: Color(0xFF909AB1),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  height: 1.5,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "34.000đ",
                                style: GoogleFonts.interTight(
                                  color: Color(0xFF0C215C),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  height: 1.4,
                                ),
                              ),
                              SizedBox(height: 16),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TripDetail(),
                                      ), // Điều hướng tới SecondScreen
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFDAE4FF),
                                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    "Xem chi tiết chuyến đi",
                                    style: GoogleFonts.interTight(
                                      color: Color(0xFF16348F),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 16),

                        // Đánh giá chuyến đi
                        Container(
                          padding: EdgeInsets.all(16),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Color(0xFFCAD1E4), width: 1),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(137, 153, 203, 0.24),
                                blurRadius: 16,
                                spreadRadius: 0,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Chuyến đi của bạn thế nào?",
                                style: GoogleFonts.interTight(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  height: 1.5,
                                  color: Color(0xFF0C215C),
                                ),
                              ),
                              SizedBox(height: 16),

                              // Widget đánh giá sao
                              StarRatingWidget(
                                onRatingChanged: (stars) {
                                  updateTags(stars);
                                },
                              ),

                              SizedBox(height: 16),

                              // Danh sách tag động
                              TagButtons(tags: tagList),

                              SizedBox(height: 16),

                              TextField(
                                maxLines: 3,
                                decoration: InputDecoration(
                                  hintText: "Ghi chú",
                                  hintStyle:GoogleFonts.interTight(
                                    color: Color(0xFF909AB1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    height: 1.42857,
                                  ) ,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Color(0xFFCAD1E4), width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 16),

                        // Nút hoàn thành

                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Color(0xFFCAD1E4), width: 1.0),
                      ),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF16348F),
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Hoàn thành",
                          style: GoogleFonts.interTight(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
