//
//  MhrClientTests.swift
//  MhrClientTests
//
//  Created by Landon Reilly on 20/10/16.
//  Copyright © 2016 Landon Reilly. All rights reserved.
//

import SwiftFHIR
import OAuth2
import XCTest


@testable import MhrClient

class GenericDocumentServicesTest   : TestServiceBase {
    
    func testGetGenericDocument() {
        
        let expectationCallback = expectation(description: "callback closure")
 
        //The following test data is derived by using FRANK HARDING account
        
        mhrClient.genericDocumentServices.getDocument(patientId: "8666701594", docId: "2.25.9257539009924929108838322672477564518",
                  successCallback: { (result: SwiftFHIR.Binary?) in
                                     print(result?.asJSON())
                                     expectationCallback.fulfill()
        },
                                     failureCallback: { error in
                                     print(error?.urlResponse)
                                                        
        })
        
        waitForExpectations(timeout: 5) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
    
    
    
    
//    func testSearchGenericDocumentWithInvalidArguments() {
//        
//        let expectationCallback = expectation(description: "callback closure")
//        
//        //The following test data is derived by using FRANK HARDING account
//        
//        mhrClient.genericDocumentServices.searchDocumentList(patientId: "8666701594", class: nil, type: nil, identifier: nil, author: nil, created: nil, status: nil, slotName: nil, slotValue: nil, successCallback: {
//            (result:SwiftFHIR.DocumentReference?) in
//            print(result?.asJSON())
//            expectationCallback.fulfill()
//       
//        }, failureCallback:  {
//            error in
//            print(error?.urlResponse)
//            
//        })
//        waitForExpectations(timeout: 5) { error in
//            if let error = error {
//               // expecting error only
//            }
//        }
//    }

    
//    func testSearchGenericDocumentWithValidArguments() {
//        
//        let expectationCallback = expectation(description: "callback closure")
//        
//        //The following test data is derived by using FRANK HARDING account
//        
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy/MM/dd HH:mm"
//        let someDateTime = formatter.date(from: "2014/10/08 22:31")
//        
//        //var a = [SearchDocumentTypeCode]()
//        
//        
//        
//        
//        mhrClient.genericDocumentServices.searchDocumentList(patientId: "8666701594", class: nil, type: nil, identifier: nil, author: nil, created: someDateTime, status: nil, slotName: nil, slotValue: nil, successCallback: {
//            (result:SwiftFHIR.Bundle?) in
//            
//            var r =  [DocumentReference]()
//            
//            print(result?.asJSON())
//            if(result != nil && result!.entry != nil && result!.entry!.count > 0){
//                for i in result!.entry!
//                {
//                   res.append(i.resource)
//                }
//            }
//
//            
//            
//            
//            expectationCallback.fulfill()
//            
//        }, failureCallback:  {
//            error in
//            print(error?.urlResponse)
//            
//        })
//        waitForExpectations(timeout: 5) { error in
//            if let error = error {
//                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
//            }
//        }
//    }

    
}
    
    

