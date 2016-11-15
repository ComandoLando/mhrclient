//
//  ClinicalDocumentServicesProtocol.swift
//  MhrClient
//
//  Created by kailoke on 3/11/16.
//  Copyright © 2016 Landon Reilly. All rights reserved.
//

import SwiftFHIR
import OAuth2
import Foundation

public protocol ClinicalDocumentServicesProtocol {
    
    // GET
    // [base/fhir/ v1.1.0]/MedicationOrder
    func getMedicationOrders(patientId: String, dateWrittenFrom: Date?, dateWrittenTo: Date?, successCallback: @escaping (SwiftFHIR.Bundle?) -> Void, failureCallback: @escaping (MhrError?) -> Void)
    
    // GET
    // [base/fhir/ v1.1.0]/MedicationDispense
    func getMedicationDispenses(patientId: String, dateHandedOverFrom: Date?, dateHandedOverTo: Date?, includeAuthorizingPrescription: Bool, successCallback: @escaping (SwiftFHIR.Bundle?) -> Void, failureCallback: @escaping (MhrError?) -> Void)
    
    // GET
    // [base/fhir/v1.1.0]/AllergyIntolerance
    func getAllergies(patientId: String, successCallback: @escaping (SwiftFHIR.Bundle?) -> Void, failureCallback: @escaping (MhrError?) -> Void)
    
}
