//
//  PackRequest.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 09/10/2023.
//

import Foundation

private enum Constants {
    
    static let path = ""
}

public struct PackRequest: Request {
    
    var path: String {
        
        return Constants.path
    }

    var method: HTTPMethod {

        return .get
    }

    var parameters: RequestParams? {

        return nil
    }
}
