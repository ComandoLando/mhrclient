//
//  MedicareInformation.swift
//  MhrClient
//
//  Created by kailoke on 4/11/16.
//  Copyright © 2016 Landon Reilly. All rights reserved.
//

import Foundation
import UIKit
import SwiftFHIR
import OAuth2

public class MedicareInformation: ServiceBase, MedicareInformationProtocol {
    
    public func getPbsItems(patientId: String, createdDateFrom: Date?, createdDateTo: Date?, successCallback: @escaping (SwiftFHIR.Bundle?) -> Void, failureCallback: @escaping (MhrError?) -> Void) {
        
    }
    
    public func getMbsItems(patientId: String, createdDateFrom: Date?, createdDateTo: Date?, successCallback: @escaping (SwiftFHIR.Bundle?) -> Void, failureCallback: @escaping (MhrError?) -> Void) {
        
    }
    
}
