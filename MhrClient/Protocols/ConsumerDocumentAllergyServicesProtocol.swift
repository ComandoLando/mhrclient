//
//  ConsumerDocumentAllergyServicesProtocol.swift
//  MhrClient
//
//  Created by Landon Reilly on 7/11/16.
//  Copyright © 2016 Landon Reilly. All rights reserved.
//

import Foundation


import SwiftFHIR
import OAuth2
import Foundation

public protocol ConsumerDocumentAllergyServicesProtocol {
    
    // GET
    // [base/fhir/ v1.1.0]/ AllergyIntolerance
    // Get allergies
    func getAllergys(patientId: String, successCallback: @escaping (SwiftFHIR.Bundle?) -> Void, failureCallback: @escaping (MhrError?) -> Void)
    
    // POST
    // [base/fhir/v1.1.0]/AllergyIntolerance
    // Body contains 1 to many AllergyIntolerances in a bundle
    func createAllergies(allergyIntolerances: SwiftFHIR.Bundle, successCallback: @escaping (SwiftFHIR.Bundle?) -> Void, failureCallback: @escaping (MhrError?) -> Void)
    
    // POST
    // [base/fhir/v1.1.0]/AllergyIntolerance
    // Body contains 1 AllergyIntolerance
    func createAllergy(allergyIntolerance: SwiftFHIR.AllergyIntolerance, docId: String, successCallback: @escaping (SwiftFHIR.AllergyIntolerance?) -> Void, failureCallback: @escaping (MhrError?) -> Void)
    
    // PUT
    // [base/fhir/v1.1.0]/AllergyIntolerance
    // Body contains 1 to many AllergyIntolerances in a bundle
    func replaceAllergies(allergyIntolerances: SwiftFHIR.Bundle, docId: String, successCallback: @escaping (SwiftFHIR.Bundle?) -> Void, failureCallback: @escaping (MhrError?) -> Void)
    
    // PUT
    // [base/fhir/v1.1.0]/AllergyIntolerance/[allergyIntoleranceId]
    // Body contains 1 AllergyIntolerance to replace an existing one
    // [allergyIntoleranceId] in URI to be extracted from the AllergyIntolerance
    func updateAllergy(allergyIntolerance: SwiftFHIR.AllergyIntolerance, docId: String, successCallback: @escaping (SwiftFHIR.AllergyIntolerance?) -> Void, failureCallback: @escaping (MhrError?) -> Void)
    
    // DELETE
    // [base/fhir/v1.1.0]/AllergyIntolerance/[allergyIntoleranceId]
    func deleteAllergy(patientId: String, docId: String, allergyIntoleranceId: String, successCallback: @escaping () -> Void, failureCallback: @escaping (MhrError?) -> Void)
}
