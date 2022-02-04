//
//  FourthView.swift
//  LibraGSM
//
//  Created by Zinovatny Maksym on 25.01.2022.
//

import SwiftUI

struct AddTruckView: View {
//  @StateObject private var inputVM = AddTruckViewModel()
  @EnvironmentObject private var objectVM: AddTruckViewModel
  
  
    var body: some View {
      NavigationView{
        VStack(alignment: .center){
//          Text("Ты выбрал грузовик с номером: \(objectVM.arrayDevice[objectVM.selectorNameDevice])")
          Picker(selection: $objectVM.selectorNameDevice, label: Text("Выбери"), content: {
            ForEach(0..<objectVM.arrayDevice.count, id: \.self) { index in
              Text(objectVM.arrayDevice[index])
                      }
                  })
          


        TextField("Имя грузовика", text: $objectVM.modelItemTruck.nameTruck)
          .padding()
          .keyboardType(.default)
        TextField("Имя водителя", text: $objectVM.modelItemTruck.nameDriver)
          .padding()
          .keyboardType(.default)
        TextField("Номер телефона водителя", text: $objectVM.modelItemTruck.numberPhoneDriver)
          .padding()
          .keyboardType(.numberPad)
          
          Button(action: {
            objectVM.addItemList(item: ItemListTruck(numberPhone: Int(objectVM.modelItemTruck.numberPhoneDriver)!, nameDevice: objectVM.getNameDevice(), nameTruck: objectVM.modelItemTruck.nameTruck, nameDriver: objectVM.modelItemTruck.nameDriver, axisLeftTopWheel: 110, axisRightTopWheel: 100, axisLeftBottomWheel: 100, axisRightBottomWheel: 100))
            objectVM.deleteDevice(index: objectVM.selectorNameDevice)
        }, label: {
          Text("Добавить грузовик")
            .accentColor(.white)
            .textCase(.uppercase)
        })
          .background(Image("button"))
        
          Spacer()
      }
      .padding(.horizontal)
      .autocapitalization(.none)
      .textFieldStyle(RoundedBorderTextFieldStyle())
    }
    }
}

struct AddTruckView_Previews: PreviewProvider {
    static var previews: some View {
      AddTruckView()
    }
}
