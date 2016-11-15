//
//  AuthenticationServicesProtocol.swift
//  MhrClient
//
//  Created by kailoke on 3/11/16.
//  Copyright © 2016 Landon Reilly. All rights reserved.
//

import SwiftFHIR
import OAuth2
import Foundation

public protocol AuthenticationServicesProtocol {
    
    // OAuth login
    func individualInitialAuthentication(viewController: UIViewController, successCallback: @escaping(OAuth2JSON?) -> Void, failureCallback: @escaping(OAuth2Error?) -> Void)
    
    // OAuth refresh token
    func refreshToken(successCallback: @escaping(OAuth2JSON?) -> Void, failureCallback: @escaping(OAuth2Error?) -> Void)
    
    // OAuth remove token
    func forgetToken()
}

