import 'package:flutter/material.dart';
import 'package:lejit/constants/colors.dart';

void main() {
  runApp(const MaterialApp(
    home: LawyerListScreen(),
  ));
}

class LawyerListScreen extends StatelessWidget {
  const LawyerListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text("GO TO HOME PAGE",
              style: TextStyle(color: Colors.white)),
        ),
      ),
      backgroundColor: whiteLilac,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: navyBlue,
              title: IconButton(
                  onPressed: () {
                    //TODO"
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 36,
                    color: whiteLilac,
                  )),
              bottom: PreferredSize(
                preferredSize: Size(
                  MediaQuery.of(context).size.width,
                  140,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(
                    8.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(
                          8.0,
                        ),
                        child: Text(
                          'Prepare Case Documents',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Describe your case in detail with the help of ChatGPT and get tailored guidance to better understand your legal situation.",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: navyBlue,
                child: Container(
                  decoration: const BoxDecoration(
                    color: whiteLilac,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Column(
                          children: [
                            const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.edit, color: silver),
                                Icon(Icons.file_download, color: silver),
                                Icon(Icons.gavel, color: silver),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Stack(
                                children: [
                                  Positioned(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Container(
                                        height: 4,
                                        color: navyBlue,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: -5,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width -
                                          70,
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 15,
                                            width: 15,
                                            decoration: const BoxDecoration(
                                                color: navyBlue,
                                                shape: BoxShape.circle),
                                          ),
                                          Container(
                                            height: 15,
                                            width: 15,
                                            decoration: const BoxDecoration(
                                                color: navyBlue,
                                                shape: BoxShape.circle),
                                          ),
                                          Container(
                                            height: 15,
                                            width: 15,
                                            decoration: const BoxDecoration(
                                                color: navyBlue,
                                                shape: BoxShape.circle),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Write case\ndescription",
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "Get\ndocument",
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "Select\nLawyers",
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Search by location, city, Pin code",
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: const Icon(Icons.tune),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Suggested Lawyers",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text("View All"),
                          )
                        ],
                      ),
                      _buildLawyerCard(
                          name: "Will Damon",
                          expertise: "Divorce",
                          experience: 15,
                          distance: 5.2,
                          casesSolved: 200,
                          rating: 4.6),
                      _buildLawyerCard(
                          name: "Smith Davis",
                          expertise: "Divorce",
                          experience: 10,
                          distance: 1.0,
                          casesSolved: 300,
                          rating: 3.6),
                      _buildLawyerCard(
                          name: "Steve Haworth",
                          expertise: "Divorce",
                          experience: 8,
                          distance: 0.2,
                          casesSolved: 120,
                          rating: 4.6),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Nearby Lawyers",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text("View All"),
                          )
                        ],
                      ),
                      _buildLawyerCard(
                          name: "Smith Davis",
                          expertise: "Divorce",
                          experience: 10,
                          distance: 1.0,
                          casesSolved: 300,
                          rating: 3.6),
                      _buildLawyerCard(
                          name: "Steve Haworth",
                          expertise: "Divorce",
                          experience: 8,
                          distance: 0.2,
                          casesSolved: 120,
                          rating: 4.6),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLawyerCard({
    required String name,
    required String expertise,
    required int experience,
    required double distance,
    required int casesSolved,
    required double rating,
  }) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey[300],
          child: const Icon(Icons.person, size: 40, color: Colors.grey),
        ),
        title: Text("$name ($expertise)"),
        subtitle: Text(
            "Exp. - $experience yrs | ${distance.toStringAsFixed(1)} km away\nCases Solved - $casesSolved+"),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 20),
            const SizedBox(height: 2),
            Text(rating.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
