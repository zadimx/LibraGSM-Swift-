//
//  LoginViewModel.swift
//  LibraGSM
//
//  Created by Zinovatny Maksym on 18.01.2022.
//

import Foundation
class InputViewModel: ObservableObject {
  @Published var credentials = Credentials()
  @Published var showProgressView = false
  @Published var error: Authentication.AuthenticationError?
  
  var inputDisabled: Bool {
    credentials.login.isEmpty || credentials.password.isEmpty
  }
  
  func input(completion: @escaping (Bool) -> Void) {
    showProgressView = true
    APIService.shared.login(credentials: credentials) { [unowned self] (  result: Result<Bool, Authentication.AuthenticationError>) in
      showProgressView = false
      switch result {
        case .success:
            completion(true)
        case .failure(let authError):
          credentials = Credentials()
          error = authError
          completion(false)
      }
    }
  }
}
