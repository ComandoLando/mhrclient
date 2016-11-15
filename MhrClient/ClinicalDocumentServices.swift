//
//  ClinicalDocumentServices.swift
//  MhrClient
//
//  Created by kailoke on 4/11/16.
//  Copyright © 2016 Landon Reilly. All rights reserved.
//

import Foundation
import UIKit
import SwiftFHIR
import OAuth2

public class ClinicalDocumentServices: ServiceBase, ClinicalDocumentServicesProtocol {

    public func getMedicationOrders(patientId: String, dateWrittenFrom: Date?, dateWrittenTo: Date?, successCallback: @escaping (SwiftFHIR.Bundle?) -> Void, failureCallback: @escaping (MhrError?) -> Void) {
        
    }
    
    public func getMedicationDispenses(patientId: String, dateHandedOverFrom: Date?, dateHandedOverTo: Date?, includeAuthorizingPrescription: Bool, successCallback: @escaping (SwiftFHIR.Bundle?) -> Void, failureCallback: @escaping (MhrError?) -> Void) {
        
    }
    
    public func getAllergies(patientId: String, successCallback: @escaping (SwiftFHIR.Bundle?) -> Void, failureCallback: @escaping (MhrError?) -> Void) {
        
    }
    
}
