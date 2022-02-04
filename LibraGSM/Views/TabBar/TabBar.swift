//
//  TabBar.swift
//  LibraGSM
//
//  Created by Zinovatny Maksym on 24.01.2022.
//

import SwiftUI

struct TabBar: View {
  @State var tabPointAdd : Bool = false
  @Binding var selectedTab: String
  @State var tabPointsX : [CGFloat] = []
    var body: some View {
      ZStack{
        HStack(spacing: 0){
          TabBarButtom(image: ConstantValue.truck, tabPointAdd: $tabPointAdd, selectedTab: $selectedTab, tabPointsX: $tabPointsX)
          
          
          TabBarButtom(image: ConstantValue.add, tabPointAdd: $tabPointAdd, selectedTab: $selectedTab, tabPointsX: $tabPointsX)
          
          TabBarButtom(image: ConstantValue.setting, tabPointAdd: $tabPointAdd, selectedTab: $selectedTab, tabPointsX: $tabPointsX)
        }
//        TabBarButtom(image: ConstantValue.calibration, selectedTab: $selectedTab, tabPoints: $tabPoints)

      }
      .padding()
      .background(CurvedShape()
//                    .clipShape(TabCurve(tabPoint: getCurvePoint()))
      )
      .overlay(
        Circle()
          .fill(Color.red)
          .frame(width: 10, height: 10)
          .offset(x: getCurvePointX() - 5, y: tabPointAdd ? -49 : -20)
        ,alignment: .bottomLeading
      )
//      .cornerRadius(30)
//      .padding(.horizontal)
    }
  func getCurvePointX() -> CGFloat {
    if tabPointsX.isEmpty {
      return 10
    } else {
      switch selectedTab {
        case ConstantValue.truck:
          return tabPointsX[2]
        case ConstantValue.add:
          return tabPointsX[1]
        default:
          return tabPointsX[0]
      }
    }
  }
  
  
}

struct TabBarButtom: View {
  var image: String
  @Binding var tabPointAdd: Bool
  @Binding var selectedTab: String
  @Binding var tabPointsX: [CGFloat]
  var body: some View {
    GeometryReader {reader -> AnyView in
    
      let midX = reader.frame(in: .global).midX
      
      DispatchQueue.main.async {
        if tabPointsX.count <= 2 {
          tabPointsX.append(midX)
        }
      }
      if image == ConstantValue.add {
        return AnyView(
          Button(action: {
            withAnimation (.interactiveSpring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.5)){
            selectedTab = image
            tabPointAdd = true
          }
        }, label: {
          Image(systemName: "\(ConstantValue.add).fill")
            .font(.system(size: 55, weight: .bold))
            .foregroundColor(Color("TabSelected"))
            .background(tabPointAdd ? Color.red : Color.white)
            .clipShape(Circle())
            .shadow(radius: 10)
        })
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .offset(y:-55)
        )
      }
      else{
      return AnyView(
        Button(action: {          
          withAnimation (.interactiveSpring(response: 0.6, dampingFraction: 0.5, blendDuration: 0.5)){
          selectedTab = image
            tabPointAdd = false
        }
      }, label: {
        Image(systemName: "\(image)\(selectedTab == image ? ".fill" : "")")
          .font(.system(size: 25, weight: .semibold))
          .foregroundColor(Color("TabSelected"))
          .offset(y: selectedTab == image ? -10 : 0)
      })
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      )
      }
    }
    .frame(height: 50)
  }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
}
