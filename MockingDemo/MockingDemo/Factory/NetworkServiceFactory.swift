//
//  NetworkServiceFactory.swift
//  MockingDemo
//
//  Created by Swapnil Magar on 13/11/25.
//

import Foundation

class NetworkServiceFactory {
    
    static func create() -> NetworkService {
        
        let environment = ProcessInfo.processInfo.environment["ENV"]
        if let environment = environment {
            if environment == "TEST" {
                return MockWebservice()
            } else {
                return Webservice()
            }
        } else {
            return Webservice()
        }
    }
}

