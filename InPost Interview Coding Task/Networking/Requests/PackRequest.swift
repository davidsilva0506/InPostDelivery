//
//  PackRequest.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 09/10/2023.
//

import Foundation

private enum Constants {
    
    static let path = "HumbeQ"
}

public struct PackRequest: Request {
    
    public var path: String {
        
        return Constants.path
    }

    public var method: HTTPMethod {

        return .get
    }

    public var parameters: RequestParams? {

        return nil
    }
}
