import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MassengerScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation:0 ,
        titleSpacing: 20,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              "Chats",
              style: TextStyle(
                color: Colors.black
              ),
            ),
          ],
        ),
        actions: [
          IconButton( onPressed: (){},
              icon: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.blue,
                child: Icon(
                    Icons.camera_alt,
                    size: 16,
                    color: Colors.white,
                ),
              )
          ),
          IconButton( onPressed: (){},
              icon: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.edit,
                  size: 16,
                  color: Colors.white,
                ),
              )
          ),
        ],

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[300],
                ),
                padding: EdgeInsets.all(5.0),
                child: Row(
                  children: [
                     Icon(
                       Icons.search
                     ),
                     SizedBox(
                       width: 15,
                     ),
                     Text(
                       'search'
                     ),
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //     hintText: 'search',
                    //     prefixIcon: Icon(Icons.search),
                    //     border: OutlineInputBorder(),
                    //
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 100,

                child: ListView.separated(
                  shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index)
                    {
                      return buildStoryItem();
                    },
                  separatorBuilder: (context ,index) => SizedBox(
                    width: 20,
                  ),
                  itemCount: 5,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics() ,
                shrinkWrap: true,
                  separatorBuilder: (context,index){
                    return SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: 15,
                  itemBuilder: (context,index){
                    return buildChatItem();
                  },
              ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: [
              //       Container(
              //         width: 60,
              //         child: Column(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30,
              //                   backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //                 ),
              //                 // CircleAvatar(
              //                 //   radius: 8,
              //                 //   backgroundColor: Colors.white,
              //                 //   //backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //                 // ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3,
              //                     end: 3,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7,
              //                     backgroundColor: Colors.green,
              //                   ),
              //                 )
              //               ],
              //             ),
              //             SizedBox(
              //               height: 6,
              //             ),
              //             Text(
              //               'Randa Sabra Attia',
              //               maxLines: 2,
              //               overflow: TextOverflow.ellipsis,
              //             ),
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         width: 20,
              //       ),
              //       Container(
              //         width: 60,
              //         child: Column(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30,
              //                   backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //                 ),
              //                 // CircleAvatar(
              //                 //   radius: 8,
              //                 //   backgroundColor: Colors.white,
              //                 //   //backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //                 // ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3,
              //                     end: 3,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7,
              //                     backgroundColor: Colors.green,
              //                   ),
              //                 )
              //               ],
              //             ),
              //             SizedBox(
              //               height: 6,
              //             ),
              //             Text(
              //               'Randa Sabra Attia',
              //               maxLines: 2,
              //               overflow: TextOverflow.ellipsis,
              //             ),
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         width: 20,
              //       ),
              //       Container(
              //         width: 60,
              //         child: Column(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30,
              //                   backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //                 ),
              //                 // CircleAvatar(
              //                 //   radius: 8,
              //                 //   backgroundColor: Colors.white,
              //                 //   //backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //                 // ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3,
              //                     end: 3,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7,
              //                     backgroundColor: Colors.green,
              //                   ),
              //                 )
              //               ],
              //             ),
              //             SizedBox(
              //               height: 6,
              //             ),
              //             Text(
              //               'Randa Sabra Attia',
              //               maxLines: 2,
              //               overflow: TextOverflow.ellipsis,
              //             ),
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         width: 20,
              //       ),
              //       Container(
              //         width: 60,
              //         child: Column(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30,
              //                   backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //                 ),
              //                 // CircleAvatar(
              //                 //   radius: 8,
              //                 //   backgroundColor: Colors.white,
              //                 //   //backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //                 // ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3,
              //                     end: 3,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7,
              //                     backgroundColor: Colors.green,
              //                   ),
              //                 )
              //               ],
              //             ),
              //             SizedBox(
              //               height: 6,
              //             ),
              //             Text(
              //               'Randa Sabra Attia',
              //               maxLines: 2,
              //               overflow: TextOverflow.ellipsis,
              //             ),
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         width: 20,
              //       ),
              //       Container(
              //         width: 60,
              //         child: Column(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30,
              //                   backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //                 ),
              //                 // CircleAvatar(
              //                 //   radius: 8,
              //                 //   backgroundColor: Colors.white,
              //                 //   //backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //                 // ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3,
              //                     end: 3,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7,
              //                     backgroundColor: Colors.green,
              //                   ),
              //                 )
              //               ],
              //             ),
              //             SizedBox(
              //               height: 6,
              //             ),
              //             Text(
              //               'Randa Sabra Attia',
              //               maxLines: 2,
              //               overflow: TextOverflow.ellipsis,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Expanded(
              //   child: SingleChildScrollView(
              //     child: Column(
              //       children: [
              //         SizedBox(
              //           height: 30,
              //         ),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30,
              //                   backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //                 ),
              //                 // CircleAvatar(
              //                 //   radius: 8,
              //                 //   backgroundColor: Colors.white,
              //                 //   //backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //                 // ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3,
              //                     end: 3,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7,
              //                     backgroundColor: Colors.green,
              //                   ),
              //                 )
              //               ],
              //             ),
              //             SizedBox(
              //               width: 20.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     'Sahar Sabra Attia Abo Taleb Bakhet Randa sabra',
              //                     style: TextStyle(
              //                       fontSize: 16,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     height: 5,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                             'hello, my name is sahar sabra',
              //                              maxLines: 1,
              //                              overflow: TextOverflow.ellipsis,
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(horizontal: 10),
              //                         child: Container(
              //                           width: 7,
              //                           height: 7,
              //                           decoration: BoxDecoration(
              //                             color: Colors.blue,
              //                             shape: BoxShape.circle
              //                           ),
              //                         ),
              //                       ),
              //                       Text(
              //                         '02:00 pm',
              //                       ),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             // Stack(
              //             //  // alignment: ,
              //             //   children: [
              //             //     CircleAvatar(
              //             //       radius: 30,
              //             //       backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //             //     ),
              //             //     CircleAvatar(
              //             //       radius: 6,
              //             //       backgroundColor: Colors.green,
              //             //     ),
              //             //   ],
              //             // ),
              //
              //           ],
              //         ),
              //         SizedBox(
              //           height: 20,
              //         ),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30,
              //                   backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //                 ),
              //                 // CircleAvatar(
              //                 //   radius: 8,
              //                 //   backgroundColor: Colors.white,
              //                 //   //backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //                 // ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3,
              //                     end: 3,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7,
              //                     backgroundColor: Colors.green,
              //                   ),
              //                 )
              //               ],
              //             ),
              //             SizedBox(
              //               width: 20.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     'Sahar Sabra Attia Abo Taleb Bakhet Randa sabra',
              //                     style: TextStyle(
              //                       fontSize: 16,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     height: 5,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                           'hello, my name is sahar sabra',
              //                           maxLines: 1,
              //                           overflow: TextOverflow.ellipsis,
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(horizontal: 10),
              //                         child: Container(
              //                           width: 7,
              //                           height: 7,
              //                           decoration: BoxDecoration(
              //                               color: Colors.blue,
              //                               shape: BoxShape.circle
              //                           ),
              //                         ),
              //                       ),
              //                       Text(
              //                         '02:00 pm',
              //                       ),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             // Stack(
              //             //  // alignment: ,
              //             //   children: [
              //             //     CircleAvatar(
              //             //       radius: 30,
              //             //       backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //             //     ),
              //             //     CircleAvatar(
              //             //       radius: 6,
              //             //       backgroundColor: Colors.green,
              //             //     ),
              //             //   ],
              //             // ),
              //
              //           ],
              //         ),
              //         SizedBox(
              //           height: 20,
              //         ),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30,
              //                   backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //                 ),
              //                 // CircleAvatar(
              //                 //   radius: 8,
              //                 //   backgroundColor: Colors.white,
              //                 //   //backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //                 // ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3,
              //                     end: 3,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7,
              //                     backgroundColor: Colors.green,
              //                   ),
              //                 )
              //               ],
              //             ),
              //             SizedBox(
              //               width: 20.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     'Sahar Sabra Attia Abo Taleb Bakhet Randa sabra',
              //                     style: TextStyle(
              //                       fontSize: 16,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     height: 5,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                           'hello, my name is sahar sabra',
              //                           maxLines: 1,
              //                           overflow: TextOverflow.ellipsis,
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(horizontal: 10),
              //                         child: Container(
              //                           width: 7,
              //                           height: 7,
              //                           decoration: BoxDecoration(
              //                               color: Colors.blue,
              //                               shape: BoxShape.circle
              //                           ),
              //                         ),
              //                       ),
              //                       Text(
              //                         '02:00 pm',
              //                       ),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             // Stack(
              //             //  // alignment: ,
              //             //   children: [
              //             //     CircleAvatar(
              //             //       radius: 30,
              //             //       backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //             //     ),
              //             //     CircleAvatar(
              //             //       radius: 6,
              //             //       backgroundColor: Colors.green,
              //             //     ),
              //             //   ],
              //             // ),
              //
              //           ],
              //         ),
              //         SizedBox(
              //           height: 20,
              //         ),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30,
              //                   backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //                 ),
              //                 // CircleAvatar(
              //                 //   radius: 8,
              //                 //   backgroundColor: Colors.white,
              //                 //   //backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //                 // ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3,
              //                     end: 3,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7,
              //                     backgroundColor: Colors.green,
              //                   ),
              //                 )
              //               ],
              //             ),
              //             SizedBox(
              //               width: 20.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     'Sahar Sabra Attia Abo Taleb Bakhet Randa sabra',
              //                     style: TextStyle(
              //                       fontSize: 16,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     height: 5,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                           'hello, my name is sahar sabra',
              //                           maxLines: 1,
              //                           overflow: TextOverflow.ellipsis,
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(horizontal: 10),
              //                         child: Container(
              //                           width: 7,
              //                           height: 7,
              //                           decoration: BoxDecoration(
              //                               color: Colors.blue,
              //                               shape: BoxShape.circle
              //                           ),
              //                         ),
              //                       ),
              //                       Text(
              //                         '02:00 pm',
              //                       ),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             // Stack(
              //             //  // alignment: ,
              //             //   children: [
              //             //     CircleAvatar(
              //             //       radius: 30,
              //             //       backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //             //     ),
              //             //     CircleAvatar(
              //             //       radius: 6,
              //             //       backgroundColor: Colors.green,
              //             //     ),
              //             //   ],
              //             // ),
              //
              //           ],
              //         ),
              //         SizedBox(
              //           height: 20,
              //         ),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30,
              //                   backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //                 ),
              //                 // CircleAvatar(
              //                 //   radius: 8,
              //                 //   backgroundColor: Colors.white,
              //                 //   //backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //                 // ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3,
              //                     end: 3,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7,
              //                     backgroundColor: Colors.green,
              //                   ),
              //                 )
              //               ],
              //             ),
              //             SizedBox(
              //               width: 20.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     'Sahar Sabra Attia Abo Taleb Bakhet Randa sabra',
              //                     style: TextStyle(
              //                       fontSize: 16,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     height: 5,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                           'hello, my name is sahar sabra',
              //                           maxLines: 1,
              //                           overflow: TextOverflow.ellipsis,
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(horizontal: 10),
              //                         child: Container(
              //                           width: 7,
              //                           height: 7,
              //                           decoration: BoxDecoration(
              //                               color: Colors.blue,
              //                               shape: BoxShape.circle
              //                           ),
              //                         ),
              //                       ),
              //                       Text(
              //                         '02:00 pm',
              //                       ),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             // Stack(
              //             //  // alignment: ,
              //             //   children: [
              //             //     CircleAvatar(
              //             //       radius: 30,
              //             //       backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //             //     ),
              //             //     CircleAvatar(
              //             //       radius: 6,
              //             //       backgroundColor: Colors.green,
              //             //     ),
              //             //   ],
              //             // ),
              //
              //           ],
              //         ),
              //         SizedBox(
              //           height: 20,
              //         ),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30,
              //                   backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //                 ),
              //                 // CircleAvatar(
              //                 //   radius: 8,
              //                 //   backgroundColor: Colors.white,
              //                 //   //backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //                 // ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3,
              //                     end: 3,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7,
              //                     backgroundColor: Colors.green,
              //                   ),
              //                 )
              //               ],
              //             ),
              //             SizedBox(
              //               width: 20.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     'Sahar Sabra Attia Abo Taleb Bakhet Randa sabra',
              //                     style: TextStyle(
              //                       fontSize: 16,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     height: 5,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                           'hello, my name is sahar sabra',
              //                           maxLines: 1,
              //                           overflow: TextOverflow.ellipsis,
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(horizontal: 10),
              //                         child: Container(
              //                           width: 7,
              //                           height: 7,
              //                           decoration: BoxDecoration(
              //                               color: Colors.blue,
              //                               shape: BoxShape.circle
              //                           ),
              //                         ),
              //                       ),
              //                       Text(
              //                         '02:00 pm',
              //                       ),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             // Stack(
              //             //  // alignment: ,
              //             //   children: [
              //             //     CircleAvatar(
              //             //       radius: 30,
              //             //       backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //             //     ),
              //             //     CircleAvatar(
              //             //       radius: 6,
              //             //       backgroundColor: Colors.green,
              //             //     ),
              //             //   ],
              //             // ),
              //
              //           ],
              //         ),
              //         SizedBox(
              //           height: 20,
              //         ),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30,
              //                   backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //                 ),
              //                 // CircleAvatar(
              //                 //   radius: 8,
              //                 //   backgroundColor: Colors.white,
              //                 //   //backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //                 // ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3,
              //                     end: 3,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7,
              //                     backgroundColor: Colors.green,
              //                   ),
              //                 )
              //               ],
              //             ),
              //             SizedBox(
              //               width: 20.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     'Sahar Sabra Attia Abo Taleb Bakhet Randa sabra',
              //                     style: TextStyle(
              //                       fontSize: 16,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     height: 5,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                           'hello, my name is sahar sabra',
              //                           maxLines: 1,
              //                           overflow: TextOverflow.ellipsis,
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(horizontal: 10),
              //                         child: Container(
              //                           width: 7,
              //                           height: 7,
              //                           decoration: BoxDecoration(
              //                               color: Colors.blue,
              //                               shape: BoxShape.circle
              //                           ),
              //                         ),
              //                       ),
              //                       Text(
              //                         '02:00 pm',
              //                       ),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             // Stack(
              //             //  // alignment: ,
              //             //   children: [
              //             //     CircleAvatar(
              //             //       radius: 30,
              //             //       backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //             //     ),
              //             //     CircleAvatar(
              //             //       radius: 6,
              //             //       backgroundColor: Colors.green,
              //             //     ),
              //             //   ],
              //             // ),
              //
              //           ],
              //         ),
              //         SizedBox(
              //           height: 20,
              //         ),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30,
              //                   backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //                 ),
              //                 // CircleAvatar(
              //                 //   radius: 8,
              //                 //   backgroundColor: Colors.white,
              //                 //   //backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //                 // ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3,
              //                     end: 3,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7,
              //                     backgroundColor: Colors.green,
              //                   ),
              //                 )
              //               ],
              //             ),
              //             SizedBox(
              //               width: 20.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     'Sahar Sabra Attia Abo Taleb Bakhet Randa sabra',
              //                     style: TextStyle(
              //                       fontSize: 16,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     height: 5,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                           'hello, my name is sahar sabra',
              //                           maxLines: 1,
              //                           overflow: TextOverflow.ellipsis,
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(horizontal: 10),
              //                         child: Container(
              //                           width: 7,
              //                           height: 7,
              //                           decoration: BoxDecoration(
              //                               color: Colors.blue,
              //                               shape: BoxShape.circle
              //                           ),
              //                         ),
              //                       ),
              //                       Text(
              //                         '02:00 pm',
              //                       ),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             // Stack(
              //             //  // alignment: ,
              //             //   children: [
              //             //     CircleAvatar(
              //             //       radius: 30,
              //             //       backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //             //     ),
              //             //     CircleAvatar(
              //             //       radius: 6,
              //             //       backgroundColor: Colors.green,
              //             //     ),
              //             //   ],
              //             // ),
              //
              //           ],
              //         ),
              //         SizedBox(
              //           height: 20,
              //         ),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30,
              //                   backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //                 ),
              //                 // CircleAvatar(
              //                 //   radius: 8,
              //                 //   backgroundColor: Colors.white,
              //                 //   //backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //                 // ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3,
              //                     end: 3,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7,
              //                     backgroundColor: Colors.green,
              //                   ),
              //                 )
              //               ],
              //             ),
              //             SizedBox(
              //               width: 20.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     'Sahar Sabra Attia Abo Taleb Bakhet Randa sabra',
              //                     style: TextStyle(
              //                       fontSize: 16,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     height: 5,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                           'hello, my name is sahar sabra',
              //                           maxLines: 1,
              //                           overflow: TextOverflow.ellipsis,
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(horizontal: 10),
              //                         child: Container(
              //                           width: 7,
              //                           height: 7,
              //                           decoration: BoxDecoration(
              //                               color: Colors.blue,
              //                               shape: BoxShape.circle
              //                           ),
              //                         ),
              //                       ),
              //                       Text(
              //                         '02:00 pm',
              //                       ),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             // Stack(
              //             //  // alignment: ,
              //             //   children: [
              //             //     CircleAvatar(
              //             //       radius: 30,
              //             //       backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
              //             //     ),
              //             //     CircleAvatar(
              //             //       radius: 6,
              //             //       backgroundColor: Colors.green,
              //             //     ),
              //             //   ],
              //             // ),
              //
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Text(
              //   "search",
              //   style: TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.bold,
              //   ),
              //  // textAlign: TextAlign.center,
              // ),
            ],
          ),
        ),
      ),
    );
  }
  // to built list :
  // 1- built item
  // 2- built list
  // 3- add item to list
  Widget buildChatItem() => Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
          ),
          // CircleAvatar(
          //   radius: 8,
          //   backgroundColor: Colors.white,
          //   //backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
          // ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              bottom: 3,
              end: 3,
            ),
            child: CircleAvatar(
              radius: 7,
              backgroundColor: Colors.green,
            ),
          )
        ],
      ),
      SizedBox(
        width: 20.0,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sahar Sabra Attia Abo Taleb Bakhet Randa sabra',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'hello, my name is sahar sabra',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle
                    ),
                  ),
                ),
                Text(
                  '02:00 pm',
                ),
              ],
            ),
          ],
        ),
      ),
      // Stack(
      //  // alignment: ,
      //   children: [
      //     CircleAvatar(
      //       radius: 30,
      //       backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
      //     ),
      //     CircleAvatar(
      //       radius: 6,
      //       backgroundColor: Colors.green,
      //     ),
      //   ],
      // ),

    ],
  );
  Widget buildStoryItem() => Container(
    width: 60,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
            ),
            // CircleAvatar(
            //   radius: 8,
            //   backgroundColor: Colors.white,
            //   //backgroundImage: NetworkImage("https://1.bp.blogspot.com/-lTrTF4_X-kg/YDxU5hu_ecI/AAAAAAAAKw0/MhR89DsF-rUWmzX0hgdO2P2rGygVxy6aQCLcBGAsYHQ/s1128/%25D8%25AE%25D9%2584%25D9%2581%25D9%258A%25D8%25A7%25D8%25AA-%25D8%25A8%25D9%2586%25D8%25A7%25D8%25AA-6.webp"),
            // ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3,
                end: 3,
              ),
              child: CircleAvatar(
                radius: 7,
                backgroundColor: Colors.green,
              ),
            )
          ],
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          'Randa Sabra Attia',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );

}
