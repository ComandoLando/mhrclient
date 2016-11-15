//
//  MedicareInformationProtocol.swift
//  MhrClient
//
//  Created by kailoke on 3/11/16.
//  Copyright © 2016 Landon Reilly. All rights reserved.
//

import SwiftFHIR
import OAuth2
import Foundation

public protocol MedicareInformationProtocol {
    
    // GET
    // [base/fhir/v1.1.0]/ExplanationOfBenefit
    func getPbsItems(patientId: String, createdDateFrom: Date?, createdDateTo: Date?, successCallback: @escaping (SwiftFHIR.Bundle?) -> Void, failureCallback: @escaping (MhrError?) -> Void)
    
    // GET
    // [base/fhir/ v1.1.0]/ExplanationOfBenefit
    func getMbsItems(patientId: String, createdDateFrom: Date?, createdDateTo: Date?, successCallback: @escaping (SwiftFHIR.Bundle?) -> Void, failureCallback: @escaping (MhrError?) -> Void)
    
}


