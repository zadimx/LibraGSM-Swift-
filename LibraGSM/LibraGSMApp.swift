//
//  LibraGSMApp.swift
//  LibraGSM
//
//  Created by Zinovatny Maksym on 14.01.2022.
//

import SwiftUI

@main
struct LibraGSMApp: App {
  @StateObject var authentication = Authentication()
    var body: some Scene {
      
      WindowGroup {
        ContentView()
//        if authentication.isValidated{
//          ContentView()
//            .environmentObject(authentication)
//        } else {
//          InputView()
//            .environmentObject(authentication)
//        }
      }
    }
}
