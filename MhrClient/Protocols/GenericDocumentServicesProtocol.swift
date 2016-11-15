//
//  GenericDocumentServicesProtocol.swift
//  MhrClient
//
//  Created by kailoke on 3/11/16.
//  Copyright © 2016 Landon Reilly. All rights reserved.
//

import SwiftFHIR
import OAuth2
import Foundation

public protocol GenericDocumentServicesProtocol {
    
    // GET
    // [base/fhir/ v1.1.0]/Binary/[docID]
    func getDocument(patientId: String, docId: String, successCallback: @escaping (SwiftFHIR.Binary?) -> Void, failureCallback: @escaping (MhrError?) -> Void)
    
    // GET
    // [base/fhir/ v1.1.0]/DocumentReference
    func searchDocuments(patientId: String, class: [(classCode:String,codeSystem:String)]?, type: [(typeCode:String,codeSystem:String)]?, identifier: [String]?, author: [String]?, created: Date?, status: String?, slotName: String?, slotValue: String?, successCallback: @escaping (SwiftFHIR.Bundle?) -> Void, failureCallback: @escaping (MhrError?) -> Void)
    
}
