//
//  AuthenticationServices.swift
//  MhrClient
//
//  Created by kailoke on 3/11/16.
//  Copyright © 2016 Landon Reilly. All rights reserved.
//

import Foundation
import UIKit
import SwiftFHIR
import OAuth2

public class AuthenticationServices: AuthenticationServicesProtocol {
    
    var oAuth2 : OAuth2
    
    public required init(oAuth2: inout OAuth2) {
        self.oAuth2 = oAuth2
    }
    
    public func individualInitialAuthentication(viewController: UIViewController, successCallback: @escaping(OAuth2JSON?) -> Void, failureCallback: @escaping(OAuth2Error?) -> Void) {
        
        self.oAuth2.authConfig.authorizeContext = viewController
        
        if (self.oAuth2.isAuthorizing) {
            self.oAuth2.abortAuthorization()
            return
        }
        
        self.oAuth2.authorize(callback: { (json : OAuth2JSON?, error: OAuth2Error?) -> Void in
            if (json != nil) {
                successCallback(json)
            }
            else if (error != nil) {
                failureCallback(error)
            }
        })
    }
    
    public func refreshToken(successCallback: @escaping(OAuth2JSON?) -> Void, failureCallback: @escaping(OAuth2Error?) -> Void) {
        if (self.oAuth2.isAuthorizing) {
            self.oAuth2.abortAuthorization()
            return
        }
        
        self.oAuth2.doRefreshToken(callback: { (json : OAuth2JSON?, error: OAuth2Error?) -> Void in
            
            if (json != nil) {
                
                if (self.oAuth2.useKeychain)
                {
                    self.oAuth2.storeTokensToKeychain()
                }
                
                successCallback(json)
            }
            else if (error != nil) {
                failureCallback(error)
            }
        })
    }
    
    public func forgetToken(){
         self.oAuth2.forgetTokens()
    }
    
}
