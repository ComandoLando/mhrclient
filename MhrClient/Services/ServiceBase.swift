//
//  ServiceBase.swift
//  MhrClient
//
//  Created by kailoke on 3/11/16.
//  Copyright © 2016 Landon Reilly. All rights reserved.
//

import Foundation
import UIKit
import SwiftFHIR
import OAuth2

public class ServiceBase {
    
    var oAuth2: OAuth2
    var mhrFhirEndpoint: String
    var clientAppId: String
    var mhrAppVersion: String
    
    public required init(oAuth2: inout OAuth2, mhrFhirEndpoint: String, clientAppId: String, mhrAppVersion: String) {
        self.oAuth2 = oAuth2
        self.mhrFhirEndpoint = mhrFhirEndpoint
        self.clientAppId = clientAppId
        self.mhrAppVersion = mhrAppVersion
    }
    
    public func processRestCall<T: Resource>(
        session: URLSession, request: URLRequest,
        successCallback: @escaping (T?) -> Void,
        failureCallback: @escaping (MhrError?) -> Void
        ) -> Void {
        
        let task : URLSessionDataTask = session.dataTask(with: request, completionHandler: {(data, response, error) in
            
            if let data = data {
                
                if let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode {
                    
                    let dict = MhrClientHelper.convertDataToDictionary(data: data)
                    let returnValue = T(json: dict, owner: nil)
                    
                    successCallback(returnValue)
                    
                } else {
                    failureCallback(self.getMhrError(data: data, response: response))
                }
            }
            
        })
        
        task.resume()
    }
    
    public func processRestCall(
        session: URLSession, request: URLRequest,
        successCallback: @escaping () -> Void,
        failureCallback: @escaping (MhrError?) -> Void
        ) -> Void {
        
        let task : URLSessionDataTask = session.dataTask(with: request, completionHandler: {(data, response, error) in
            
            if let data = data {
                
                if let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode {
                    
                    successCallback()
                    
                } else {
                    failureCallback(self.getMhrError(data: data, response: response))
                }
            }
            
        })
        
        task.resume()
    }
    
    public func getMhrError(data: Data?, response: URLResponse?) -> MhrError {
        var operationOutcome : OperationOutcome? = nil
        let dict = MhrClientHelper.convertDataToDictionary(data: data)
        
        if dict != nil {
            operationOutcome = OperationOutcome(json: dict, owner: nil)
        }
        
        let error = MhrError(operationOutcome: operationOutcome, urlResponse: response)
        
        return error
    }
}
