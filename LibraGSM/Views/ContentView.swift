//
//  ContentView.swift
//  LibraGSM
//
//  Created by Zinovatny Maksym on 14.01.2022.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject private var authentication: Authentication
  @State private var selectedTab = ConstantValue.truck
  @StateObject private var addTuckViewModel = ListTruckViewModel()
  @State private var presedMapButton: Bool = false
    var body: some View {
        ZStack(alignment: .bottom, content: {
          
          containedView()
            .padding(.bottom, 50)
          TabBar(selectedTab: $selectedTab)
          
        })
        .ignoresSafeArea()
        .environmentObject(addTuckViewModel)
    }
  func containedView() -> AnyView {
       switch selectedTab {
       case ConstantValue.truck:
        return AnyView(ListTruckView())
       case ConstantValue.add:
        return AnyView(AddTruckView())
       case ConstantValue.setting:
        return AnyView(ThirdView())
        default: return AnyView(ListTruckView())
       }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
