//
//  AddTruckViewModel.swift
//  LibraGSM
//
//  Created by Zinovatny Maksym on 31.01.2022.
//

import Foundation
class ListTruckViewModel: ObservableObject {
  @Published var modelItemTruck = AddTruck()
  @Published var networkService = NetworkService()
//  @Published var list: [Truck] = []
//  @Published var list: [ItemListTruck] = []
  @Published var arrayDevice: [String] = ["aa1111bb","aa2222bb","aa3333bb","aa4444bb","aa5555bb","aa6666bb","aa7777bb","aa8888bb"]
  @Published var selectorNameDevice = 0
  @Published var nameDevice = ""
  var inputDisabled: Bool {
    arrayDevice.count == 0 || modelItemTruck.numberPhoneDriver.isEmpty
  }

//  func addItemList(item: ItemTruck){
//    list.append(item)
//  }
  
  func deleteDevice(element: String) {
    arrayDevice = arrayDevice.filter() { $0 != element }
  }
//  func delete(offsets: IndexSet){
//    arrayDevice.append(list[offsets.last!].nameDevice ?? "error")
//    list.remove(atOffsets: offsets)
//  }
  func getNameDevice() -> String{
//    loadTrucks()
//    for truck in list {
//      arrayDevice.append(truck.nameDevice)
//    }
    return arrayDevice[selectorNameDevice]
  }
  
//  func loadTrucks() {
//    self.networkService.getListTrucks() { [weak self] result in
//          guard let self = self else {
//              return
//          }
//        DispatchQueue.main.async {
//              switch result {
//              case .success(let trucks):
//                  if (trucks.count != 0) {
//                    print(trucks)
//                    self.list.append(contentsOf: trucks)
//                  }
//              case .failure(let error):
//                print(error.localizedDescription)
//              }
//          }
//      }
//  }
  
}
