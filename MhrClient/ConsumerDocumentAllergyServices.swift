//
//  ConsumerDocumentAllergyServices.swift
//  MhrClient
//
//  Created by kailoke on 4/11/16.
//  Copyright © 2016 Landon Reilly. All rights reserved.
//

import Foundation
import UIKit
import SwiftFHIR
import OAuth2

public class ConsumerDocumentAllergyServices: ServiceBase, ConsumerDocumentAllergyServicesProtocol {
    
    public func getAllergy(patientId: String, successCallback: @escaping (SwiftFHIR.Bundle?) -> Void, failureCallback: @escaping (MhrError?) -> Void) {
    }
    
    public func createAllergies(allergyIntolerances: SwiftFHIR.Bundle, successCallback: @escaping (SwiftFHIR.Bundle?) -> Void, failureCallback: @escaping (MhrError?) -> Void) {
    }
    
    public func createAllergy(allergyIntolerance: SwiftFHIR.Bundle, docId: String, successCallback: @escaping (SwiftFHIR.Bundle?) -> Void, failureCallback: @escaping (MhrError?) -> Void) {
    }
    
    public func replaceAllergies(allergyIntolerances: SwiftFHIR.Bundle, docId: String, successCallback: @escaping (SwiftFHIR.Bundle?) -> Void, failureCallback: @escaping (MhrError?) -> Void) {
    }
    
    public func updateAllergy(allergyIntolerance: SwiftFHIR.Bundle, docId: String, successCallback: @escaping (SwiftFHIR.Bundle?) -> Void, failureCallback: @escaping (MhrError?) -> Void) {
    }
    
    public func deleteAllergy(patientId: String, docId: String, allergyIntoleranceId: String, successCallback: @escaping () -> Void, failureCallback: @escaping (MhrError?) -> Void) {
    }
    
}
