//
//  Truck.swift
//  LibraGSM
//
//  Created by Zinovatny Maksym on 09.02.2022.
//
//{
//   "status":"ok",
//   "totalResults":7,
//   "trucks":[
//      {
//         "nameDevice":aa1111bb,
//         "axisTopLeft":1111,
//         "axisTopRight":1111,
//         "axisBottomLeft":1111,
//         "axisBottomLeft":1111,
//      },
//      {
//         "nameDevice":aa2222bb,
//         "axisTopLeft":2222,
//         "axisTopRight":2222,
//         "axisBottomLeft":2222,
//         "axisBottomLeft":2222,
//      },
//      {
//         "nameDevice":aa3333bb,
//         "axisTopLeft":3333,
//         "axisTopRight":3333,
//         "axisBottomLeft":3333,
//         "axisBottomLeft":3333,
//      },
//      {
//         "nameDevice":aa4444bb,
//         "axisTopLeft":4444,
//         "axisTopRight":4444,
//         "axisBottomLeft":4444,
//         "axisBottomLeft":4444,
//      },
//      {
//         "nameDevice":aa5555bb,
//         "axisTopLeft":5555,
//         "axisTopRight":5555,
//         "axisBottomLeft":5555,
//         "axisBottomLeft":5555,
//      },
//      {
//         "nameDevice":aa6666bb,
//         "axisTopLeft":6666,
//         "axisTopRight":6666,
//         "axisBottomLeft":6666,
//         "axisBottomLeft":6666,
//      },
//      {
//         "nameDevice":aa7777bb,
//         "axisTopLeft":7777,
//         "axisTopRight":7777,
//         "axisBottomLeft":7777,
//         "axisBottomLeft":7777,
//      }
//   ]
//}
import Foundation
import Foundation
struct Root: Decodable {
    var trucks: [Truck]
}
struct Truck: Decodable {
  var nameDevice: String = ""
  var axisTopLeft: String = "0"
  var axisTopRight: String = "0"
  var axisBottomLeft: String = "0"
  var axisBottomRight: String = "0"
}
