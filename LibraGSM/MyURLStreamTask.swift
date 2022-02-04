//
//  ServiceModel.swift
//  LibraGSM
//
//  Created by Zinovatny Maksym on 17.01.2022.
//

import Foundation

class MyURLStreamTask {
    
    let session = URLSession(configuration: .default)
    var hostIPString    = "109.87.56.237"     // or set to whatever
    let port            =   7777           // as needed
    var task : URLSessionStreamTask? = nil
    var socketRunning = false
    var status = String()
    
    func startNetworkStreams() {
         // create a URLSessionStreamTask
        task = session.streamTask(withHostName: hostIPString, port: port)
        if task != nil {
            self.task?.resume()             // start task running
            socketRunning = true
            status = ""
        }
    }
    
    var writeCounter = 0
  func sendCommand(_ flag : Int, dataBuffer : Data, len : Int ) {        // write data to socket
        guard socketRunning else { return }
//        let data = Data(bytes: dataBuffer, count: len)
        let data = dataBuffer
        let timeout = TimeInterval(2.0)
        task?.write(data, timeout: timeout, completionHandler:
            { (err: Error?) -> Void in
                if err == nil {
                    self.writeCounter += 1
                } else {
                    self.status = err!.localizedDescription   //  display somewhere when error handling
                    self.close()
                  self.socketRunning = true
                }
        } )
    }
  
    var requestedBytes = 0
    func myRead(bytes : Int) {                  // call myRead periodically as needed
        guard socketRunning else { return }
        requestedBytes = bytes
        let minBytes = 1
        var ff = [String : String]()
        let maxBytes = bytes
        let timeout = TimeInterval(2.0)
        task?.readData(ofMinLength: minBytes,   // read from socket
            maxLength: maxBytes,
            timeout: timeout, completionHandler:
            { (data: Data?, flag: Bool, err: Error?) -> Void in
                if err == nil {
                  
                    if let d = data {
                      print("REEDDDD-----\(d.base64EncodedData())")
                        let byteCount = d.count
                        var gg = d.withUnsafeBytes{ (buffer: UnsafePointer<UInt8>) -> Int in
                          

                            // copy data buffer or call a delegate return function here
                            //
                          print("READ-------\(buffer)")
                          return 0
                        }
                      
                        self.requestedBytes -= byteCount
                        if self.requestedBytes > 0 {
                            // call on main thread for low bandwidth needs
                            self.myRead(bytes: self.requestedBytes)
                        }
                    }
                } else {
                    self.status = err!.localizedDescription  // for error reporting
                    self.close()
                  self.socketRunning = true
                } } )
    }
    
    func close() {
        if task != nil && socketRunning {
            task!.closeRead()
            task!.closeWrite()
        }
        socketRunning = false
    }
}  // end of class MyURLStreamTask
