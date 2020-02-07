//
//  Object.swift
//  MetUIApp
//
//  Created by Stephanie Ramirez on 2/7/20.
//  Copyright © 2020 Stephanie Ramirez. All rights reserved.
//

import Foundation
struct Departments: Codable {
	let departments: [Department]
}
struct Department: Codable, Hashable {
	let departmentId: Int
	let displayName: String
}
struct ObjectIDs: Codable { //can be used for search and object endpoints
    let total: Int?
    let objectIDs: [Int]
}

struct ObjectData: Codable {
    let objectID: Int
    let accessionNumber: String
    let isPublicDomain: Bool
    let primaryImage: String?
    let primaryImageSmall: String
    let department: String
    let objectName: String
    let title: String?
    let culture: String
    let period: String
    let dynasty: String
    let reign: String
    let artistRole: String
    let artistPrefix: String
    let artistDisplayName: String
    let artistDisplayBio: String
    let artistSuffix: String
    let artistAlphaSort: String
    let artistNationality: String
    let artistBeginDate: String
    let artistEndDate: String
    let objectDate: String
    let objectBeginDate: Int
    let objectEndDate: Int
    let medium: String
    let dimensions: String
    let creditLine: String
    let geographyType: String
    let city: String
    let state: String
    let county: String
    let country: String
    let region: String
    let subregion: String
    let locale: String
    let locus: String
    let excavation: String
    let river: String
    let classification: String
    let rightsAndReproduction: String
    let linkResource: String
    let repository: String
    let objectURL: URL
}
