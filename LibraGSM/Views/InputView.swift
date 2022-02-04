//
//  LoginView.swift
//  LibraGSM
//
//  Created by Zinovatny Maksym on 18.01.2022.
//

import SwiftUI

struct InputView: View {
  @StateObject private var inputVM = InputViewModel()
  @EnvironmentObject private var authentication: Authentication
  var body: some View {
    VStack(alignment: .center) {
      Image("logo_screen")
        .onTapGesture {
          UIApplication.shared.endEditing()
        }
        .padding()
      TextField("Логин", text: $inputVM.credentials.login)
        .padding()
        .keyboardType(.default)
      SecureField("Пароль", text: $inputVM.credentials.password)
        .padding()
      if inputVM.showProgressView{
        ProgressView()
      }
      Button{
        inputVM.input { success in
          authentication.updateValidation(success: success)
        }
      } label: {
        Text("войти")
          .accentColor(.white)
          .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
      }
      .background(Image("button"))
      .disabled(inputVM.inputDisabled)
    }
    .padding(.horizontal)
    .autocapitalization(.none)
    .textFieldStyle(RoundedBorderTextFieldStyle())
    .disabled(inputVM.showProgressView)
    .alert(item: $inputVM.error) { error in
      Alert(title: Text("Ошибка входа"), message: Text(error.localizedDescription))
    }
  }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}
