//
//  TestServiceBase.swift
//  MhrClientSample
//
//  Created by Landon Reilly on 9/11/16.
//  Copyright © 2016 Landon Reilly. All rights reserved.
//

import Foundation
import SwiftFHIR
import OAuth2
import XCTest

@testable import MhrClient

class TestServiceBase: XCTestCase {
    
    var mhrClient : MhrClient!
    
    override func setUp() {
        super.setUp()
        
        let testBundle = Bundle(for: type(of: self))
        let pathConfiguration = testBundle.path(forResource: "MhrConfigurationDrp", ofType: "plist")
        let configuration = NSDictionary(contentsOfFile: pathConfiguration!) as! [String : Any]
        
        let pathCredentials = testBundle.path(forResource: "AccessCredentials", ofType: "plist")
        let accessToken = (NSDictionary(contentsOfFile: pathCredentials!) as! [String : Any])["access_token"] as! String
        
        // Pass In Configuration File
        mhrClient = MhrClient(configuration: configuration)
        mhrClient.oAuth2.accessToken = accessToken
    }
        
    override func tearDown() {
        mhrClient = nil
        super.tearDown()
    }
 }
