//
//  DataController.swift
//  LibraGSM
//
//  Created by Zinovatny Maksym on 07.02.2022.
//

import CoreData
import Foundation

class DataController: ObservableObject {
  let conteiner = NSPersistentContainer(name: "TruckModel")
  init() {
    conteiner.loadPersistentStores {description, error in
      if let error = error {
        print("Core Data failed to load: \(error.localizedDescription)")
      }
    }
  }
}
