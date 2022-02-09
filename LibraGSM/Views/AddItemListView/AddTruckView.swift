//
//  FourthView.swift
//  LibraGSM
//
//  Created by Zinovatny Maksym on 25.01.2022.
//

import SwiftUI

struct AddTruckView: View {
//  @StateObject private var inputVM = AddTruckViewModel()
  @Environment(\.managedObjectContext) var moc
  @EnvironmentObject private var objectVM: ListTruckViewModel
  
  
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
            let itemTruck = ItemTruck(context: moc)
            itemTruck.id = UUID()
            itemTruck.nameDevice = objectVM.getNameDevice()
            itemTruck.nameTruck = objectVM.modelItemTruck.nameTruck
            itemTruck.nameDriver = objectVM.modelItemTruck.nameDriver
            itemTruck.numberPhone = NSDecimalNumber(string: objectVM.modelItemTruck.numberPhoneDriver)
            itemTruck.axisLeftTopWheel = 100
            itemTruck.axisRightTopWheel = 100
            itemTruck.axisLeftBottomWheel = 100
            itemTruck.axisRightBottomWheel = 100
            try? moc.save()
            objectVM.deleteDevice(element: objectVM.getNameDevice())
        }, label: {
          Text("Добавить грузовик")
            .accentColor(.white)
            .textCase(.uppercase)
        })
          .background(Image("button"))
          .disabled(objectVM.inputDisabled || objectVM.arrayDevice.count == objectVM.selectorNameDevice)
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
