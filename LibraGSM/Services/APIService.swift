//
//  APIService.swift
//  LibraGSM
//
//  Created by Zinovatny Maksym on 18.01.2022.
//

import Foundation
class  APIService {
  static let shared = APIService()
  private var urlSessionStreamTask: URLSessionStreamTask?
  
  func login(credentials: Credentials, completion: @escaping (Result<Bool, Authentication.AuthenticationError>) -> Void){
    DispatchQueue.main.asyncAfter(deadline: .now () + 1){
      if credentials.password == "db" {
        self.connect(token: credentials.login.appending(credentials.password))
        completion(.success(true))
      } else {
        completion(.failure(.invalidCredentials))
      }
    }
  }
  
  
  
  // MARK: - Connection
  
  func connect(token: String) {
    let cp1251Data = token.data(using: .utf8)! as Data
//    let ss = cp1251Data.bytes
    let serv = MyURLStreamTask()
    serv.startNetworkStreams()
    serv.sendCommand(10, dataBuffer: cp1251Data, len: 2)
    serv.myRead(bytes: 100000)
//    serv.close()
//    print(cp1251Data)
//    let myIntData = Data(bytes: ss,
//                         count: cp1251Data.length)
//    urlSessionStreamTask = URLSession.shared.streamTask(withHostName: "109.87.56.237", port: 7777) // 4
//    urlSessionStreamTask?.write(myIntData, timeout: 1000, completionHandler: onReceive)
//    urlSessionStreamTask?.closeWrite()
//    urlSessionStreamTask?.resume() // 6
//    urlSessionStreamTask?.readData(ofMinLength: 0, maxLength: 1000, timeout: 1000, completionHandler: onReceiveRead)
//
//    urlSessionStreamTask?.closeRead()
//    urlSessionStreamTask?.resume() // 6
    
  }
  
  func disconnect() { // 7
//    webSocketTask?.cancel(with: .normalClosure, reason: nil) // 8
  }

  private func onReceive(incoming: Error?) -> Void {
    // Nothing yet...
    print("ERRROOOORRRR")
  }
  private func onReceiveRead(incoming: Data?, t: Bool, s: Error?) -> Void {
    // Nothing yet...
    let str = String(decoding: incoming!, as: UTF8.self)
    print("READ------\(str)")
  }
  
  deinit { // 9
    disconnect()
  }
}
