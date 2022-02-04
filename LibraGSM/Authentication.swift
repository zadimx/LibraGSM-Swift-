//
//  Autentifycation.swift
//  LibraGSM
//
//  Created by Zinovatny Maksym on 18.01.2022.
//

import SwiftUI

class Authentication: ObservableObject {
  @Published var isValidated = false
  
  enum AuthenticationError: Error, LocalizedError, Identifiable {
    
    case invalidCredentials
    
    var id: String {
      self.localizedDescription
    }
    
    var errorDescription: String? {
      switch self {
        case .invalidCredentials:
          return NSLocalizedString("Неверный логин или пароль", comment: "")
      }
    }
  }
  func updateValidation(success: Bool) {
    withAnimation {
      isValidated = success
    }
  }
}
