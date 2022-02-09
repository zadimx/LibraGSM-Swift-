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
  @StateObject private var dataController = DataController()
    var body: some Scene {
      
      WindowGroup {
//        ContentView()
        if authentication.isValidated{
          ContentView()
            .environmentObject(authentication)
            .environment(\.managedObjectContext, dataController.conteiner.viewContext)
        } else {
          InputView()
            .environmentObject(authentication)
        }
      }
    }
}
