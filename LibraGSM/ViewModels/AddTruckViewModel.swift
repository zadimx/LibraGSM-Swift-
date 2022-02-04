//
//  AddTruckViewModel.swift
//  LibraGSM
//
//  Created by Zinovatny Maksym on 31.01.2022.
//

import Foundation
class AddTruckViewModel: ObservableObject {
  @Published var modelItemTruck = AddTruck()
  @Published var list: [ItemListTruck] = []
  @Published var arrayDevice: [String] = ["aa1111bb","aa2222bb","aa3333bb","aa4444bb","aa5555bb","aa6666bb","aa7777bb"]
  @Published var selectorNameDevice = 0
  @Published var nameDevice = ""
  func addItemList(item: ItemListTruck){
    list.append(item)
  }
  func deleteDevice(index: Int) {
    arrayDevice.remove(at: index)
  }
  func delete(offsets: IndexSet){
    arrayDevice.append(list[offsets.last!].nameDevice)
    list.remove(atOffsets: offsets)
  }
  func getNameDevice() -> String{
    return arrayDevice[selectorNameDevice]
  }
}
