//
//  ItemListTrucksView.swift
//  LibraGSM
//
//  Created by Zinovatny Maksym on 27.01.2022.
//

import SwiftUI

struct ItemListTrucksViewRaw: View {
  var itemListTruck: ItemTruck
//  var itemListTruck: ItemListTruck
  @State private var presedMapButton: Bool = false
  @State private var presedCallButton: Bool = false
  @State private var imageMap: String = "map"
  @State private var imageCall: String = "phone.circle"
    var body: some View {
      VStack{
      HStack(){
        Text(itemListTruck.nameTruck ?? "error")
          .padding(.leading)
        Spacer()
        Text(itemListTruck.nameDriver ?? "error")
          .padding(.trailing)
      }
      .background(Color.yellow)
      HStack{
        Button(action: {
          print("MAP")
          self.presedMapButton.toggle()
      }, label: {
        Image(systemName: "\(imageMap)\(presedMapButton ? ".fill" : "")")
          .font(.system(size: 50, weight: .bold))
          .foregroundColor(Color("TabSelected"))
      }).buttonStyle(BorderlessButtonStyle())
        Spacer()
        VStack{
          HStack(spacing:50){
            Text("\(itemListTruck.axisLeftTopWheel ?? 0) kg")
            Text("\(itemListTruck.axisRightTopWheel ?? 0) kg")
          }
          HStack(spacing:50){
            Text("\(itemListTruck.axisLeftBottomWheel ?? 0) kg")
            Text("\(itemListTruck.axisRightBottomWheel ?? 0) kg")
          }
        }
        Spacer()
        Button(action: {
          print("Call")
          self.presedCallButton.toggle()
      }, label: {
        Image(systemName: "\(imageCall)\(presedCallButton ? ".fill" : "")")
          .font(.system(size: 50, weight: .bold))
          .foregroundColor(Color("TabSelected"))
      }).buttonStyle(BorderlessButtonStyle())
      }
      .background(Color.gray)
    }
      .cornerRadius(20)
      
}
}

//struct ItemListTruck: Hashable {
//  var id = UUID()
//  var numberPhone: Int
//  var nameDevice: String
//  var nameTruck: String
//  var nameDriver: String
//  var axisLeftTopWheel: Int
//  var axisRightTopWheel: Int
//  var axisLeftBottomWheel: Int
//  var axisRightBottomWheel: Int
//}

struct ItemListTrucksView_Previews: PreviewProvider {
  
    static var previews: some View {
      ContentView()
    }
}
