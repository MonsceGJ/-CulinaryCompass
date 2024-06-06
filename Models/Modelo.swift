//
//  Modelo.swift
//  CulinaryCompass
//
//  Created by monscerrat gutierrez on 31/05/24.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let culinariCompass = try? JSONDecoder().decode(CulinariCompass.self, from: jsonData)

import Foundation

// MARK: - CulinariCompassElement
struct CulinariCompassElement: Codable, Hashable {
    let image: String?
    let title, newCategory, path: String?
}

typealias CulinariCompass = [CulinariCompassElement]?

