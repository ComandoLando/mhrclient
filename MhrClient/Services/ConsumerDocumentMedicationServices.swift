//
//  ConsumerDocumentMedicationServices.swift
//  MhrClient
//
//  Created by kailoke on 4/11/16.
//  Copyright © 2016 Landon Reilly. All rights reserved.
//

import Foundation
import UIKit
import SwiftFHIR
import OAuth2

public class ConsumerDocumentMedicationServices: ServiceBase, ConsumerDocumentMedicationServicesProtocol {
    
    // Get Medications
    public func getMedications(patientId: String, successCallback: @escaping (SwiftFHIR.Bundle?) -> Void, failureCallback: @escaping (MhrError?) -> Void) {
        
        let session = oAuth2.session
        
        let url = NSURLComponents(string: "\(self.mhrFhirEndpoint)/\(mhrAppVersion)/MedicationStatement")!
        
        url.queryItems = [
            NSURLQueryItem(name: "source._type", value: "Patient") as URLQueryItem,
            NSURLQueryItem(name: "patient", value: patientId) as URLQueryItem
        ]
        
        var request = MhrClientHelper.createStandardRequest(url: url.url!, oAuth2: oAuth2, clientAppId: clientAppId)
        request.httpMethod = "GET"
        
        self.processRestCall(session: session, request: request, successCallback: successCallback, failureCallback: failureCallback)
    }
    
    
    // Create Medications
    public func createMedications(medicationStatements: SwiftFHIR.Bundle, successCallback: @escaping (SwiftFHIR.Bundle?) -> Void, failureCallback: @escaping (MhrError?) -> Void) {
        
        let session = oAuth2.session
        
        let url = NSURLComponents(string: "\(self.mhrFhirEndpoint)/\(mhrAppVersion)/MedicationStatement")!
        
        url.queryItems = [
            NSURLQueryItem(name: "source._type", value: "Patient") as URLQueryItem
        ]
        
        var request = MhrClientHelper.createStandardRequest(url: url.url!, oAuth2: oAuth2, clientAppId: clientAppId)
        request.httpMethod = "POST"
        
        let jsonData = try! JSONSerialization.data(withJSONObject: medicationStatements.asJSON(), options: .prettyPrinted)
        request.httpBody = jsonData
        
        self.processRestCall(session: session, request: request, successCallback: successCallback, failureCallback: failureCallback)
    }
    
    // Add Medication
    public func addMedication(medicationStatement: SwiftFHIR.MedicationStatement, docId: String, successCallback: @escaping (SwiftFHIR.MedicationStatement?) -> Void, failureCallback: @escaping (MhrError?) -> Void) {
        
        let session = oAuth2.session
        
        let url = NSURLComponents(string: "\(self.mhrFhirEndpoint)/\(mhrAppVersion)/MedicationStatement")!
        
        url.queryItems = [
            NSURLQueryItem(name: "docId", value: docId) as URLQueryItem,
            NSURLQueryItem(name: "source._type", value: "Patient") as URLQueryItem
        ]
        
        var request = MhrClientHelper.createStandardRequest(url: url.url!, oAuth2: oAuth2, clientAppId: clientAppId)
        request.httpMethod = "POST"
        
        let jsonData = try! JSONSerialization.data(withJSONObject: medicationStatement.asJSON(), options: .prettyPrinted)
        request.httpBody = jsonData
        
        self.processRestCall(session: session, request: request, successCallback: successCallback, failureCallback: failureCallback)        
    }
    
    // Replace Medications
    public func replaceMedications(medicationStatements: SwiftFHIR.Bundle, docId: String, successCallback: @escaping (SwiftFHIR.Bundle?) -> Void, failureCallback: @escaping (MhrError?) -> Void) {
        
        let session = oAuth2.session
        
        let url = NSURLComponents(string: "\(self.mhrFhirEndpoint)/\(mhrAppVersion)/MedicationStatement")!
        
        url.queryItems = [
            NSURLQueryItem(name: "docId", value: docId) as URLQueryItem,
            NSURLQueryItem(name: "source._type", value: "Patient") as URLQueryItem
        ]
        
        var request = MhrClientHelper.createStandardRequest(url: url.url!, oAuth2: oAuth2, clientAppId: clientAppId)
        request.httpMethod = "PUT"
        
        let jsonData = try! JSONSerialization.data(withJSONObject: medicationStatements.asJSON(), options: .prettyPrinted)
        request.httpBody = jsonData
        
        self.processRestCall(session: session, request: request, successCallback: successCallback, failureCallback: failureCallback)
    }
    
    // Update Medication
    public func updateMedication(medicationStatement: SwiftFHIR.MedicationStatement, docId: String, successCallback: @escaping (SwiftFHIR.MedicationStatement?) -> Void, failureCallback: @escaping (MhrError?) -> Void) {
        
        let session = oAuth2.session
        
        let url = NSURLComponents(string: "\(self.mhrFhirEndpoint)/\(mhrAppVersion)/MedicationStatement/\(medicationStatement.id)")!
        
        url.queryItems = [
            NSURLQueryItem(name: "docId", value: docId) as URLQueryItem,
            NSURLQueryItem(name: "source._type", value: "Patient") as URLQueryItem
        ]
        
        var request = MhrClientHelper.createStandardRequest(url: url.url!, oAuth2: oAuth2, clientAppId: clientAppId)
        request.httpMethod = "PUT"
        
        let jsonData = try! JSONSerialization.data(withJSONObject: medicationStatement.asJSON(), options: .prettyPrinted)
        request.httpBody = jsonData
        
        self.processRestCall(session: session, request: request, successCallback: successCallback, failureCallback: failureCallback)
    }
    
    // Delete Medication
    public func deleteMedication(patientId: String, docId: String, medicationStatementId: String, successCallback: @escaping () -> Void, failureCallback: @escaping (MhrError?) -> Void) {

        let session = oAuth2.session
        
        let url = NSURLComponents(string: "\(self.mhrFhirEndpoint)/\(mhrAppVersion)/MedicationStatement/\(medicationStatementId)")!
        
        url.queryItems = [
            NSURLQueryItem(name: "patient", value: patientId) as URLQueryItem,
            NSURLQueryItem(name: "docId", value: docId) as URLQueryItem,
            NSURLQueryItem(name: "source._type", value: "Patient") as URLQueryItem
        ]
        
        var request = MhrClientHelper.createStandardRequest(url: url.url!, oAuth2: oAuth2, clientAppId: clientAppId)
        request.httpMethod = "DELETE"
        
        self.processRestCall(session: session, request: request, successCallback: successCallback, failureCallback: failureCallback)
    }
        
}
