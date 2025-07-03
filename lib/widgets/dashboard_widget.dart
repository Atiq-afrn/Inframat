import 'package:flutter/material.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({
    super.key,
    required this.imagename,
    required this.textname,
  });

  final String textname;
  final String imagename;

  @override
  Widget build(BuildContext context) {
    final String baseUrl = "http://inframart.goproject.in/";
    final String imageUrl = baseUrl + imagename;

    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width * .49,
      child: Card(
        elevation: 6,
        child: Column(
          children: [
            Container(
              height: 140,
              width: double.infinity,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.broken_image, size: 50);
                },
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
            SizedBox(height: 6),
            Text(textname, style: TextStyle(fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
