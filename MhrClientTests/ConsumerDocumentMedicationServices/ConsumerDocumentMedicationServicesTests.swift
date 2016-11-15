//
//  ConsumerDocumentMedicationServicesTests.swift
//  MhrClient
//
//  Created by kailoke on 9/11/16.
//  Copyright © 2016 Landon Reilly. All rights reserved.
//

import SwiftFHIR
import OAuth2
import XCTest

@testable import MhrClient

class ConsumerDocumentMedicationServicesTests: TestServiceBase {
    
    func testGetMedications() {
        
        let expectationCallback = expectation(description: "callback closure")
        
        mhrClient.consumerDocumentMedicationServices.getMedications(patientId: "8666701594",
            successCallback: { (result: SwiftFHIR.Bundle?) in
                print(result?.asJSON() as Any)
                XCTAssert(result != nil, "Result is nil")
                
                expectationCallback.fulfill()
            },
            failureCallback: { error in
                print(error?.urlResponse as Any)
            }
        )
        
        waitForExpectations(timeout: 5) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }

    func testAddMedication() {
        
        let expectationCallback = expectation(description: "callback closure")
        
        mhrClient.genericDocumentServices.searchDocuments(patientId: "8666701594", class: [("100.16685", "LOINC")], type: nil, identifier: nil, author: nil, created: nil, status: nil, slotName: nil, slotValue: nil, successCallback: { (result: SwiftFHIR.Bundle?) in

                print(result?.asJSON() as Any)
            
                expectationCallback.fulfill()
            },
            failureCallback: { error in
                print(error?.urlResponse as Any)
            }
        )
        
        waitForExpectations(timeout: 5) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
        
        /*
        let medicationJson = TestHelper.readFileAsJson(path: TestHelper.getProjectDirectory().appendingPathComponent("MhrClientTests/ConsumerDocumentMedicationServices/CreateMedicationsTest.json"))
        
        let medication = SwiftFHIR.MedicationStatement(json: medicationJson)
        
        print(medication.asJSON())
        */
    }
}

