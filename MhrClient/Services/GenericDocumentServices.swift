//
//  GenericDocumentServices.swift
//  MhrClient
//
//  Created by kailoke on 4/11/16.
//  Copyright © 2016 Landon Reilly. All rights reserved.
//

import Foundation
import UIKit
import SwiftFHIR
import OAuth2

public class GenericDocumentServices: ServiceBase, GenericDocumentServicesProtocol {

    ///Refer to section 3.4.1 of documenation on this method for this protocol defined by My Health Record FHIR Gateway -API
    public func getDocument(patientId: String, docId: String, successCallback: @escaping (SwiftFHIR.Binary?) -> Void,
                     failureCallback: @escaping (MhrError?) -> Void) {
               
        
        let session = oAuth2.session
        
        let url = NSURLComponents(string: "\(self.mhrFhirEndpoint)/\(mhrAppVersion)/Binary/\(docId)")!
        
        url.queryItems = [
            NSURLQueryItem(name: "patient", value: patientId) as URLQueryItem
        ]
        
        var request = MhrClientHelper.createStandardRequest(url: url.url!, oAuth2: oAuth2, clientAppId: clientAppId)
        request.httpMethod = "GET"
        
        self.processRestCall(session: session, request: request, successCallback: successCallback, failureCallback: failureCallback)
        
    }
    
    ///Refer to section 3.4.2 of documenation on this method for this protocol defined by My Health Record FHIR Gateway -API
    public func searchDocuments(patientId: String, class: [(classCode:String,codeSystem:String)]? = nil, type: [(typeCode:String,codeSystem:String)]? = nil, identifier: [String]? = nil, author: [String]? = nil, created: Date? = nil, status: String? = nil, slotName: String? = nil, slotValue: String? = nil, successCallback: @escaping (SwiftFHIR.Bundle?) -> Void, failureCallback: @escaping (MhrError?) -> Void) {
        
        
        
        let session = oAuth2.session
        
        let url = NSURLComponents(string: "\(self.mhrFhirEndpoint)/\(mhrAppVersion)/DocumentReference")!
        
        url.queryItems = [
            NSURLQueryItem(name: "patient", value: patientId) as URLQueryItem
        ]
        
     
        //Required params
        
        var classPresent : Bool = false
        var typePresent : Bool = false
        
        
        if `class` != nil && `class`!.count > 0{
            classPresent = true;
        }
        
        if type != nil && type!.count > 0 {
            typePresent=true;
        }
        if classPresent == true {
            
            var result : String = ""
            
            for (i,j) in `class`!.enumerated()
            {
                var formatted = MhrClientHelper.getCodeSystemFormattedString(a: j.classCode, b: j.codeSystem)
                if(formatted.isEmpty){
                    result += "\(formatted)";
                    if(i != `class`!.count - 1 ){
                        result+=","
                    }
                }
            }
            if(result.hasSuffix(","))
            {
                
                result = result.substring(to: (result.index(result.endIndex, offsetBy: -1)))
            }
            
            
            url.queryItems?.append( NSURLQueryItem(name: "class", value: result) as URLQueryItem)
            
        }
        if typePresent == true {
            
            var result : String = ""
            
            for (i,j) in type!.enumerated()
            {
                var formatted = MhrClientHelper.getCodeSystemFormattedString(a: j.typeCode, b: j.codeSystem)
                if(formatted.isEmpty){
                    result += "\(formatted)";
                    if(i != type!.count - 1 ){
                        result+=","
                    }
                }
            }
            if(result.hasSuffix(","))
            {
                result = result.substring(to: (result.index(result.endIndex, offsetBy: -1)))
            }
            
            url.queryItems?.append( NSURLQueryItem(name: "type", value: result) as URLQueryItem)
         }
        
        
        
        
        
        
        //Optional Params
        
        
        if (identifier != nil) {
            url.queryItems?.append( NSURLQueryItem(name: "identifier", value: identifier?.joined(separator: ",") )as URLQueryItem)
        }
        
        
        if (author != nil) {
            url.queryItems?.append( NSURLQueryItem(name: "author", value: author?.joined(separator: ",")) as URLQueryItem)
        }
        
        if (created != nil) {
            
            let dayTimePeriodFormatter = DateFormatter()
            dayTimePeriodFormatter.dateFormat = "yyyy-mm-dd" //as specified in spec
            let dateString:String = "ge\(dayTimePeriodFormatter.string(from: created!))"
            url.queryItems?.append( NSURLQueryItem(name: "created", value: dateString) as URLQueryItem)
        }
        
        
        if (status != nil) {
            url.queryItems?.append( NSURLQueryItem(name: "status", value: status) as URLQueryItem)
        }
        
        
        if (slotName != nil) {
            url.queryItems?.append( NSURLQueryItem(name: "slotName", value: slotName) as URLQueryItem)
        }
        
        
        if (slotValue != nil) {
            url.queryItems?.append( NSURLQueryItem(name: "slotValue", value: slotValue) as URLQueryItem)
        }

        
        var request = MhrClientHelper.createStandardRequest(url: url.url!, oAuth2: oAuth2, clientAppId: clientAppId)
        request.httpMethod = "GET"
        
        self.processRestCall(session: session, request: request, successCallback: successCallback, failureCallback: failureCallback)
 
       
    }
    
}
