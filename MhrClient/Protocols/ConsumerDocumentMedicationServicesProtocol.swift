//
//  ConsumerDocumentServicesProtocol.swift
//  MhrClient
//
//  Created by kailoke on 3/11/16.
//  Copyright © 2016 Landon Reilly. All rights reserved.
//

import SwiftFHIR
import OAuth2
import Foundation

public protocol ConsumerDocumentMedicationServicesProtocol {
    
    // GET
    // [base/fhir/ v1.1.0]/MedicationStatement
    // Get MedicationStatements
    func getMedications(patientId: String, successCallback: @escaping (SwiftFHIR.Bundle?) -> Void, failureCallback: @escaping (MhrError?) -> Void)
    
    // POST
    // [base/fhir/v1.1.0]/MedicationStatement
    // Body contains 1 to many MedicationStatements in a bundle
    func createMedications(medicationStatements: SwiftFHIR.Bundle, successCallback: @escaping (SwiftFHIR.Bundle?) -> Void, failureCallback: @escaping (MhrError?) -> Void)
    
    // POST
    // [base/fhir/v1.1.0]/MedicationStatement
    // Body contains 1 MedicationStatement
    func addMedication(medicationStatement: SwiftFHIR.MedicationStatement, docId: String, successCallback: @escaping (SwiftFHIR.MedicationStatement?) -> Void, failureCallback: @escaping (MhrError?) -> Void)

    // PUT
    // [base/fhir/v1.1.0]/MedicationStatement
    // Body contains 1 to many MedicationStatements in a bundle
    func replaceMedications(medicationStatements: SwiftFHIR.Bundle, docId: String, successCallback: @escaping (SwiftFHIR.Bundle?) -> Void, failureCallback: @escaping (MhrError?) -> Void)
    
    // PUT
    // [base/fhir/v1.1.0]/MedicationStatement/[medicationStatementId]
    // Body contains 1 MedicationStatement to replace an existing one
    // [medicationStatementId] in URI to be extracted from the MedicationStatement
    func updateMedication(medicationStatement: SwiftFHIR.MedicationStatement, docId: String, successCallback: @escaping (SwiftFHIR.MedicationStatement?) -> Void, failureCallback: @escaping (MhrError?) -> Void)

    // DELETE
    // [base/fhir/v1.1.0]/MedicationStatement/[medicationStatementId]
    func deleteMedication(patientId: String, docId: String, medicationStatementId: String, successCallback: @escaping () -> Void, failureCallback: @escaping (MhrError?) -> Void)
}
