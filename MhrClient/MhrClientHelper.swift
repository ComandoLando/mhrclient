//
//  MhrClientHelper.swift
//  MhrClient
//
//  Created by Landon Reilly on 17/10/16.
//  Copyright © 2016 Landon Reilly. All rights reserved.
//

import Foundation
import UIKit
import SwiftFHIR
import OAuth2

class MhrClientHelper {
    
    static func createStandardRequest(url: URL, oAuth2: OAuth2, clientAppId: String) -> URLRequest {
        
        var request = oAuth2.request(forURL: url)
        
        request.addValue("application/json+fhir", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json+fhir", forHTTPHeaderField: "Accept")
        
        request.addValue(oAuth2.clientConfig.clientId! , forHTTPHeaderField: "App-Id")
        request.addValue(clientAppId, forHTTPHeaderField: "App-Version")
        
        
        return request
    }
    
    static func convertDataToDictionary(data: Data?) -> [String:Any]? {
        if let value = data {
            do {
                let json = try JSONSerialization.jsonObject(with: value, options: .mutableContainers) as? [String:Any]
                return json
            } catch {
                print("Error parsing response data")
            }
        }
        return nil
    }
    
    static func getCodeSystemFormattedString(a:String,b:String) -> String {
        return "\(a)^^\(b)"
    }
}
