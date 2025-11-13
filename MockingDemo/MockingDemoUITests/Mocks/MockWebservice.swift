//
//  MockWebservice.swift
//  MockingDemo
//
//  Created by Swapnil Magar on 13/11/25.
//

import Foundation

class MockWebservice: NetworkService {
    
    func login(username: String, password: String, completion: @escaping (Result<Void, NetworkError>) -> Void) {
        
        if username == "testuser" && password == "Password@123" {
            completion(.success(()))
        } else {
            completion(.failure(.notAuthenticated))
        }
    }
}

