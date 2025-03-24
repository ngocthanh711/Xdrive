import 'package:flutter/material.dart';

class StarRatingWidget extends StatefulWidget {
  @override
  _StarRatingWidgetState createState() => _StarRatingWidgetState();
}

class TagButtons extends StatefulWidget {
  @override
  _TagButtonsState createState() => _TagButtonsState();
}

class _TagButtonsState extends State<TagButtons> {
  List<String> tags = [
    "Tuyệt vời!",
    "Xe sạch sẽ",
    "Lái xe an toàn",
    "Ngồi êm ái",
    "Đúng giờ",
    "Di chuyển nhanh",
    "Ứng dụng dễ dùng",
  ];
  Set<String> selectedTags = {}; // Lưu trạng thái button nào được chọn

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 8,
        runSpacing: 8,
        children:
            tags.map((tag) {
              bool isSelected = selectedTags.contains(tag);

              return ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (isSelected) {
                      selectedTags.remove(tag); // Bỏ chọn nếu đã chọn trước đó
                    } else {
                      selectedTags.add(tag); // Chọn nếu chưa chọn
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isSelected ? Color(0xFF16348F) : Color(0xFFDAE4FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                ),
                child: Text(
                  tag,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    height: 1.33333,
                    color: isSelected ? Colors.white : Color(0xFF16348F),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}

class _StarRatingWidgetState extends State<StarRatingWidget> {
  int selectedStars = 0; // Số sao mặc định được chọn

  // final List<String> tags = [
  //   "Tuyệt vời!",
  //   "Xe sạch sẽ",
  //   "Lái xe an toàn",
  //   "Ngồi êm ái",
  //   "Đúng giờ",
  //   "Di chuyển nhanh",
  //   "Ứng dụng dễ dùng",
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, kTextTabBarHeight * 2, 0, 16),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/Background.png"),
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color(0xFFCAD1E4),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(137, 153, 203, 0.24),
                                // Màu với độ trong suốt
                                blurRadius: 16,
                                // Độ mờ của bóng
                                spreadRadius: 0,
                                // Độ lan rộng
                                offset: Offset(0, 4), // Độ dịch chuyển (x, y)
                              ),
                            ],
                          ),

                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Cảm ơn bạn đã chọn dịch vụ của",
                                style: TextStyle(
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
                                "assets/Logo.png",
                              ),
                              SizedBox(height: 16),
                              Text(
                                "Tổng thanh toán",
                                style: TextStyle(
                                  color: Color(0xFF909AB1),
                                  fontSize: 16,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  height: 1.5,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "34.000đ",
                                style: TextStyle(
                                  color: Color(0xFF0C215C),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  height: 1.4,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 14,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFDAE4FF),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    "Xem chi tiết chuyến đi",
                                    style: TextStyle(
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

                        Container(
                          padding: EdgeInsets.all(16),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color(0xFFCAD1E4),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(137, 153, 203, 0.24),
                                // Màu với độ trong suốt
                                blurRadius: 16,
                                // Độ mờ của bóng
                                spreadRadius: 0,
                                // Độ lan rộng
                                offset: Offset(0, 4), // Độ dịch chuyển (x, y)
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            // Giữ cho Column không chiếm toàn bộ không gian trống
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Text(
                                "Chuyến đi của bạn thế nào?",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  height: 1.5,
                                  color: Color(0xFF0C215C),
                                ),
                              ),

                              SizedBox(height: 16),

                              Row(
                                mainAxisSize: MainAxisSize.min,
                                // Giúp Row chỉ chiếm đúng nội dung bên trong
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(5, (index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedStars =
                                            index +
                                            1; // Cập nhật số sao được chọn
                                      });
                                    },
                                    borderRadius: BorderRadius.circular(20),
                                    child: Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Image.asset(
                                        index < selectedStars
                                            ? "assets/star_filled.png"
                                            : "assets/star_empty.png",
                                        width: 42,
                                        height: 42,
                                      ),
                                    ),
                                  );
                                }),
                              ),

                              SizedBox(height: 16),

                              TagButtons(),

                              SizedBox(height: 16),

                              TextField(
                                maxLines: 3,
                                decoration: InputDecoration(
                                  hintText: "Ghi chú",
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    height: 1.42857,
                                    color: Color(0xFF909AB1),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    // Bo góc
                                    borderSide: BorderSide(
                                      color: Color(0xFFCAD1E4),
                                      width: 1,
                                    ), // Viền màu xám
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(
                                      color: Color(0xFFCAD1E4),
                                      width: 1,
                                    ), // Viền khi chưa bấm vào
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                      width: 2.0,
                                    ), // Viền khi bấm vào
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 16),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFDAE4FF),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 14,
                                    horizontal: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),

                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.error_outline,
                                      color: Color(0xFF16348F),
                                      size: 20,
                                    ),
                                    Text(
                                      "Báo cáo sự cố",
                                      style: TextStyle(
                                        color: Color(0xFF16348F),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        height: 1.42857,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(width: 8),

                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFDAE4FF),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 14,
                                    horizontal: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),

                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.live_help_outlined,
                                      color: Color(0xFF16348F),
                                      size: 20,
                                    ),
                                    Text(
                                      "Hỗ trợ",
                                      style: TextStyle(
                                        color: Color(0xFF16348F),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        height: 1.42857,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 49),
                      ],
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Color(0xFFCAD1E4),
                        width: 1.0,
                      ), // Viền chỉ có phía trên
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF16348F),
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            // Khoảng cách bên trong
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            // Xử lý sự kiện khi nhấn nút
                          },
                          child: Text(
                            "Hoàn thành",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              height: 1.5,
                              color: Colors.white, // Màu chữ trắng
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: kToolbarHeight,
            child: Text(
              "Kết thúc chuyến đi",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                height: 1.4,
                color: Color(0xFF0C215C),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
