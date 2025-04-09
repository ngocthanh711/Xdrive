import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phenikaaxdrive/features/profile/presentation/widgets/remove_location.dart';

class LikedLocationScreen extends StatefulWidget {
  const LikedLocationScreen({Key? key}) : super(key: key);

  @override
  State<LikedLocationScreen> createState() => _LikedLocationScreenState();
}

class _LikedLocationScreenState extends State<LikedLocationScreen> {
  List<Map<String, String>> likedLocations = [
    {
      'name': 'Trường Đại học Phenikaa',
      'address': 'P. Nguyễn Trác, Yên Nghĩa, Hà Đông ',
    },
    {
      'name': 'Trường Đại học Phenikaa',
      'address': 'P. Nguyễn Trác, Yên Nghĩa, Hà Đông, Hà Nội',
    },
    {
      'name': 'Trường Đại học Phenikaa',
      'address': 'P. Nguyễn Trác, Yên Nghĩa, Hà Đông, Hà Nội',
    },
    {
      'name': 'Trường Đại học Phenikaa',
      'address': 'P. Nguyễn Trác, Yên Nghĩa, Hà Đông, Hà Nội',
    },
    {
      'name': 'Trường Đại học Phenikaa',
      'address': 'P. Nguyễn Trác, Yên Nghĩa, Hà Đông, Hà Nội',
    },
  ];

  void _addLocation() {
    setState(() {
      likedLocations.add({'name': 'Địa điểm mới', 'address': 'Địa chỉ mới'});
    });
  }

  void _removeLocation(int index) {
    showRemoveLocationDialog(context, index, (int indexToRemove) {
      setState(() {
        likedLocations.removeAt(indexToRemove);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(0, kTextTabBarHeight * 1.3, 0, 0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, size: 24),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Center(
                  child: Text(
                    'Địa điểm yêu thích',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.interTight(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                      color: const Color(0xFF0C215C),
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(height: 26),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: likedLocations.length,
                itemBuilder: (context, index) {
                  final location = likedLocations[index];
                  return Container(
                    margin: const EdgeInsets.fromLTRB(13, 8, 8, 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Color(0xffCAD1E4), width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(137, 153, 203, 0.24),
                          offset: Offset(0, 4),
                          blurRadius: 16,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/svg/location_icon.svg'),
                          SizedBox(width: 16.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  location['name']!,
                                  style: GoogleFonts.interTight(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0,
                                    color: const Color(0xff0C215C),
                                    height: 1.5,
                                  ),
                                ),
                                Text(
                                  location['address']!,
                                  style: GoogleFonts.interTight(
                                    fontSize: 14.0,
                                    color: const Color(0xff909AB1),
                                    fontWeight: FontWeight.w500,
                                    height: 1.42857,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: SvgPicture.asset('assets/svg/trash_icon.svg'),
                            onPressed: () {
                              _removeLocation(index);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Color(0xFFCAD1E4), width: 1.0),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
              child: ElevatedButton.icon(
                onPressed: _addLocation,
                icon: SvgPicture.asset('assets/svg/plus.svg', color: Colors.white, height: 24,width: 24),
                label: Text(
                  'Thêm địa điểm',
                  style: GoogleFonts.interTight(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    height: 1.5
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff16348F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 14.0,
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
