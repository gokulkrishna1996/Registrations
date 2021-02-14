//
//  RegistrationData.swift
//  Registration
//
//  Created by Gokulkrishna Jayachandran on 14/2/21.
//

import Foundation

class RegistrationData: Codable {
    let registrations: [Registrations]
}

class Registrations: Codable {
    let plate_number: String
    let registration: Registration
    let vehicle: Vehicle
    let insurer: Insurer
}

class Registration: Codable {
    let expired: Bool
    let expiry_date: String
}

class Vehicle: Codable {
    let type: String
    let make: String
    let model: String
    let colour: String
    let vin: String
    let tare_weight: Double
    let gross_mass: Int?
    
}

class Insurer: Codable {
    let name: String
    let code: Int
}
