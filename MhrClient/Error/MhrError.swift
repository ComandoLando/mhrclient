//
//  MhrError.swift
//  MhrClient
//
//  Created by Landon Reilly on 31/10/16.
//  Copyright © 2016 Landon Reilly. All rights reserved.
//

import Foundation
import SwiftFHIR

open class MhrError {
    
   public var operationOutcome: OperationOutcome?
   public var urlResponse: URLResponse?
    
    public required init(operationOutcome: OperationOutcome?, urlResponse: URLResponse?) {
        self.operationOutcome = operationOutcome
        self.urlResponse = urlResponse
    }
    
}
