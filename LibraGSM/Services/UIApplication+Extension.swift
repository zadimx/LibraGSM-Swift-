//
//  UIApplication+Extension.swift
//  LibraGSM
//
//  Created by Zinovatny Maksym on 18.01.2022.
//

import UIKit

extension UIApplication{
  func endEditing(){
    sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}
