//
//  FirstView.swift
//  LibraGSM
//
//  Created by Zinovatny Maksym on 21.01.2022.
//

import SwiftUI


struct ListTruckView: View {
  @EnvironmentObject private var objectVM: ListTruckViewModel
  @EnvironmentObject var authentication: Authentication
  
    var body: some View {
      
      
      NavigationView{

        List{
          
          ForEach(objectVM.list, id: \.self) { truck in
            ItemListTrucksViewRaw(itemListTruck: truck)
              .onTapGesture {
                
              }
          }
          .onDelete(perform: objectVM.delete)
        }
        .navigationTitle(Text("Truck View"))
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing){
            Button("Log out"){
              authentication.updateValidation(success: false)
            }
          }
        }
      }
      

      
    }
  
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
//        FirstView()
    }
}
