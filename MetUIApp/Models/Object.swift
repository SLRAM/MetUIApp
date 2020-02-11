//
//  Object.swift
//  MetUIApp
//
//  Created by Stephanie Ramirez on 2/7/20.
//  Copyright © 2020 Stephanie Ramirez. All rights reserved.
//

import Foundation
import Combine

struct StaticDepartment {

	static var id: Int = 1
}
class SelectedDepartment: ObservableObject {
	@Published var department = Department.default
}
struct Departments: Codable {
	let departments: [Department]
}
struct Department: Codable, Hashable {
	let departmentId: Int
	let displayName: String
}
extension Department {
	static var `default`: Department {
		Department(departmentId: 1, displayName: "default")
	}
}
struct ObjectIDs: Codable { //can be used for search and object endpoints
    let total: Int?
    let objectIDs: [Int]
}

struct ObjectData: Codable, Hashable {
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
extension ObjectData {
	static var `default`: ObjectData {
		ObjectData(objectID: 0, accessionNumber: "", isPublicDomain: false, primaryImage: nil, primaryImageSmall: "", department: "", objectName: "Default", title: "default", culture: "", period: "", dynasty: "", reign: "", artistRole: "", artistPrefix: "", artistDisplayName: "", artistDisplayBio: "", artistSuffix: "", artistAlphaSort: "", artistNationality: "", artistBeginDate: "", artistEndDate: "", objectDate: "", objectBeginDate: 0, objectEndDate: 0, medium: "", dimensions: "", creditLine: "", geographyType: "", city: "", state: "", county: "", country: "", region: "", subregion: "", locale: "", locus: "", excavation: "", river: "", classification: "", rightsAndReproduction: "", linkResource: "", repository: "", objectURL: URL(string: "https://www.metmuseum.org/art/collection/search/471266")!)
	}
}
