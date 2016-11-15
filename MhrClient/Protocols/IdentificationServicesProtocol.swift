//
//  IdentificationServicesProtocol.swift
//  MhrClient
//
//  Created by Landon Reilly on 31/10/16.
//  Copyright © 2016 Landon Reilly. All rights reserved.
//

import SwiftFHIR
import OAuth2
import Foundation

public protocol IdentificationServicesProtocol {
    
    // GET
    // [base/fhir/v1.1.0]/Patient/
    func getPatientDetails(successCallback: @escaping (SwiftFHIR.Bundle?) -> Void, failureCallback: @escaping (MhrError?) -> Void)
    
    // GET
    // [base/fhir/v1.1.0]/Patient/[patientId]
    func getPatientDetails(patientId: String, successCallback: @escaping (SwiftFHIR.Patient?) -> Void, failureCallback: @escaping (MhrError?) -> Void)
    
    // GET
    // [base/fhir/ v1.1.0]/RelatedPerson
    func GetAccessibleRecords(successCallback: @escaping (SwiftFHIR.Bundle?) -> Void, failureCallback: @escaping (MhrError?) -> Void)
}

