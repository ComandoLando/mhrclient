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

class IdentificationServicesTests: TestServiceBase {
    
    
    func testGetPatientDetails() {
        
        let expectationCallback = expectation(description: "callback closure")
        
        mhrClient.identificationServices.getPatientDetails(
                                                           
          successCallback: { (result: SwiftFHIR.Bundle?) in
            
            let patient: SwiftFHIR.Patient = result?.entry?[0].resource as! SwiftFHIR.Patient
            
            TestHelper.checkPatient(patient: patient,
                              dob: "1949-10-04",
                              familyName: "Harding",
                              givenName: "Frank",
                              id: "8666701594",
                              gender: "male",
                              ihi: "8003608666701594",
                              indigenousStatus: "Not stated/ inadequately described",
                              phoneNumber: "0400 000 000",
                              country: "Australia",
                              city: "Brisbane",
                              postCode: "4000",
                              state: "QLD",
                              streetLine: "400 George Street")

            expectationCallback.fulfill()
            
        },
           failureCallback: { error in
        
                print(error?.urlResponse as Any)
        
        } )
        
        waitForExpectations(timeout: 5) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
    
    func testGetPatientDetailsPassId() {
        
        let expectationCallback = expectation(description: "callback closure")
        
        mhrClient.identificationServices.getPatientDetails(patientId: "8666701594",
                                                           
           successCallback: { (result: SwiftFHIR.Patient?) in
            
            let patient = result!
            
            TestHelper.checkPatient(patient: patient,
                              dob: "1949-10-04",
                              familyName: "Harding",
                              givenName: "Frank",
                              id: "8666701594",
                              gender: "male",
                              ihi: "8003608666701594",
                              indigenousStatus: "Not stated/ inadequately described",
                              phoneNumber: "0400 000 000",
                              country: "Australia",
                              city: "Brisbane",
                              postCode: "4000",
                              state: "QLD",
                              streetLine: "400 George Street")
            
            expectationCallback.fulfill()
            
        },
        failureCallback: { error in
        
            print(error?.urlResponse! as Any)
        
        })
        
        waitForExpectations(timeout: 5) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
    
    func testGetRecordList() {
        
        let expectationCallback = expectation(description: "callback closure")
        
        mhrClient.identificationServices.GetAccessibleRecords(
                                                           
        successCallback: { (bundle: SwiftFHIR.Bundle?) in
            
            XCTAssertEqual(3 as UInt, bundle?.total!)
            
            let patient1 = bundle?.entry?[0].resource as? SwiftFHIR.RelatedPerson
            let patient2 = bundle?.entry?[1].resource as? SwiftFHIR.RelatedPerson
            let patient3 = bundle?.entry?[2].resource as? SwiftFHIR.RelatedPerson
                
            TestHelper.checkRelatedPerson(patient: patient1!,
                                    dob: "1949-10-04",
                                    familyName: "Harding",
                                    givenName: "Frank",
                                    id: "8666701594",
                                    gender: "male",
                                    ihi: "8003608666701594")
            
            TestHelper.checkRelatedPerson(patient: patient2!,
                                    dob: "1950-12-25",
                                    familyName: "Hubbard",
                                    givenName: "Eva",
                                    id: "8166695544",
                                    gender: "male",
                                    ihi: "8003608166695544")
            
            TestHelper.checkRelatedPerson(patient: patient3!,
                                    dob: "1950-12-25",
                                    familyName: "Derrington",
                                    givenName: "Caleb",
                                    id: "8000045922",
                                    gender: "male",
                                    ihi: "8003608000045922")

            
           expectationCallback.fulfill()
                                                            
        },
        failureCallback: { error in
                                                        
          print(error?.urlResponse as Any)
            
        })
        
        waitForExpectations(timeout: 5) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
    
}
