//
//  IdentificationServices.swift
//  MhrClient
//
//  Created by Landon Reilly on 31/10/16.
//  Copyright © 2016 Landon Reilly. All rights reserved.
//

import Foundation
import UIKit
import SwiftFHIR
import OAuth2

public class IdentificationServices: ServiceBase, IdentificationServicesProtocol {
    
    public func getPatientDetails(patientId: String, successCallback: @escaping (SwiftFHIR.Patient?) -> Void, failureCallback: @escaping (MhrError?) -> Void) {
        
        let session = oAuth2.session
        
        let urlString = "\(self.mhrFhirEndpoint)/\(mhrAppVersion)/Patient/\(patientId)"

        let url = URL(string: urlString)
        
        var request = MhrClientHelper.createStandardRequest(url: url!, oAuth2: oAuth2, clientAppId: clientAppId)
        
        request.httpMethod = "GET"
        
        self.processRestCall(session: session, request: request, successCallback: successCallback, failureCallback: failureCallback)
    }
    
    public func getPatientDetails(successCallback: @escaping (SwiftFHIR.Bundle?) -> Void, failureCallback: @escaping (MhrError?) -> Void) {
        
        let session = oAuth2.session
        
        let urlString = "\(self.mhrFhirEndpoint)/\(mhrAppVersion)/Patient"

        let url = URL(string: urlString)
        
        var request = MhrClientHelper.createStandardRequest(url: url!, oAuth2: oAuth2, clientAppId: clientAppId)
        
        request.httpMethod = "GET"
        
        self.processRestCall(session: session, request: request, successCallback: successCallback, failureCallback: failureCallback)
    }
    
    public func GetAccessibleRecords(successCallback: @escaping (SwiftFHIR.Bundle?) -> Void, failureCallback: @escaping (MhrError?) -> Void) {
        
        let session = oAuth2.session
        
        let urlString = "\(self.mhrFhirEndpoint)/\(mhrAppVersion)/RelatedPerson"

        let url = URL(string: urlString)
        
        var request = MhrClientHelper.createStandardRequest(url: url!, oAuth2: oAuth2, clientAppId: clientAppId)
        
        request.httpMethod = "GET"
        
        self.processRestCall(session: session, request: request, successCallback: successCallback, failureCallback: failureCallback)
        
    }
}
