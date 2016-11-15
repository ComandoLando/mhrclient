//
//  MhrClient.swift
//  MhrClient
//
//  Created by Landon Reilly on 31/10/16.
//  Copyright © 2016 Landon Reilly. All rights reserved.
//

import Foundation
import UIKit
import SwiftFHIR
import OAuth2

public class MhrClient  {
    
    public var oAuth2: OAuth2
    
    // Services
    public var identificationServices: IdentificationServicesProtocol
    public var authenticationServices: AuthenticationServicesProtocol
    public var genericDocumentServices:  GenericDocumentServicesProtocol
    public var medicareInformation:  MedicareInformationProtocol
    public var consumerDocumentMedicationServices:  ConsumerDocumentMedicationServicesProtocol
    public var consumerDocumentAllergyServices:  ConsumerDocumentAllergyServicesProtocol
    public var clinicalDocumentServices:  ClinicalDocumentServicesProtocol
    
    public required init(configuration: [String: Any]) {
        
        assert(configuration["mhr_fhir_endpoint"] != nil, "fhir_endpoint must be set in the configuration file")
        assert(configuration["client_app_id"] != nil, "client_app_id must be set in the configuration file")
        assert(configuration["mhr_app_version"] != nil, "mhr_app_version must be set in the configuration file")
        
        let mhrFhirEndpoint: String = configuration["mhr_fhir_endpoint"] as! String
        let clientAppId: String = configuration["client_app_id"] as! String
        let mhrAppVersion: String = configuration["mhr_app_version"] as! String
        
        self.oAuth2 = OAuth2CodeGrant(settings: configuration)
        self.oAuth2.authConfig.authorizeEmbedded = true
        self.oAuth2.authConfig.ui.useSafariView = false
        
        // Load Services
        authenticationServices = AuthenticationServices(oAuth2: &self.oAuth2)
        identificationServices = IdentificationServices(oAuth2: &self.oAuth2, mhrFhirEndpoint: mhrFhirEndpoint, clientAppId: clientAppId, mhrAppVersion: mhrAppVersion)
        genericDocumentServices = GenericDocumentServices(oAuth2: &self.oAuth2, mhrFhirEndpoint: mhrFhirEndpoint, clientAppId: clientAppId, mhrAppVersion: mhrAppVersion)
        medicareInformation = MedicareInformation(oAuth2: &self.oAuth2, mhrFhirEndpoint: mhrFhirEndpoint, clientAppId: clientAppId, mhrAppVersion: mhrAppVersion)
        consumerDocumentMedicationServices = ConsumerDocumentMedicationServices(oAuth2: &self.oAuth2, mhrFhirEndpoint: mhrFhirEndpoint, clientAppId: clientAppId, mhrAppVersion: mhrAppVersion)
        consumerDocumentAllergyServices = ConsumerDocumentAllergyServices(oAuth2: &self.oAuth2, mhrFhirEndpoint: mhrFhirEndpoint, clientAppId: clientAppId, mhrAppVersion: mhrAppVersion)
        clinicalDocumentServices = ClinicalDocumentServices(oAuth2: &self.oAuth2, mhrFhirEndpoint: mhrFhirEndpoint, clientAppId: clientAppId, mhrAppVersion: mhrAppVersion)
    }
    

}
