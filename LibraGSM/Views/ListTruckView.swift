//
//  FirstView.swift
//  LibraGSM
//
//  Created by Zinovatny Maksym on 21.01.2022.
//

import SwiftUI


struct ListTruckView: View {
  @Environment(\.managedObjectContext) var moc
  @EnvironmentObject private var objectVM: ListTruckViewModel
  @FetchRequest(sortDescriptors: []) var listTruck: FetchedResults<ItemTruck>
  // СПРОСИТЬ КАК ПОДРУГОМУ!!!!!
  var fff: String {
    for i in listTruck {
      if(objectVM.arrayDevice.contains(i.nameDevice!)){
        objectVM.deleteDevice(element: i.nameDevice!)
      }
    }
    return "Truck View"
  }
  
  @EnvironmentObject var authentication: Authentication
  
    var body: some View {
      
      
      NavigationView{

        
        List{
          ForEach(listTruck) { truck in
            ItemListTrucksViewRaw(itemListTruck: truck)
              .onTapGesture {
                
              }
          }
          .onDelete(perform: delete)
//          ForEach(objectVM.list, id: \.self) { truck in
//            ItemListTrucksViewRaw(itemListTruck: truck)
//              .onTapGesture {
//
//              }
//          }
//          .onDelete(perform: objectVM.delete)
        }
        .navigationTitle(Text(fff))
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing){
            Button("Log out"){
              authentication.updateValidation(success: false)
            }
          }
        }
      }
    }
  func delete(at offsets: IndexSet){
    for offset in offsets{
      let item = listTruck[offset]
      objectVM.arrayDevice.append(item.nameDevice!)
      moc.delete(item)
    }
    try? moc.save()
  }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
//        FirstView()
    }
}
