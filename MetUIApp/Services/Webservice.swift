//
//  Webservice.swift
//  MetUIApp
//
//  Created by Stephanie Ramirez on 2/7/20.
//  Copyright © 2020 Stephanie Ramirez. All rights reserved.
//

import Foundation
import Combine

class Webservice {
	func combineGetDepartments() {
		
	}
	func getDepartments(completionHandler: @escaping(AppError?, [Department]?) -> Void) {
		let url = "https://collectionapi.metmuseum.org/public/collection/v1/departments"
		NetworkHelper.shared.performDataTask(endpointURLString: url, httpMethod: "GET", httpBody: nil) { (error, data, response) in
			if let error = error {
				completionHandler(error, nil)
			} else if let data = data {
				do {
					let departmentData = try JSONDecoder().decode(Departments.self, from: data)
					completionHandler(nil, departmentData.departments)
				} catch {
					completionHandler(AppError.decodingError(error), nil)
				}
			}
		}
	}

	func getAllObjectsInDepartment(department: Int, completionHandler: @escaping(AppError?, [Int]?) -> Void) {
		let url = "https://collectionapi.metmuseum.org/public/collection/v1/search?departmentId=\(department)&q=cat"
		NetworkHelper.shared.performDataTask(endpointURLString: url, httpMethod: "GET", httpBody: nil) { (error, data, response) in
			if let error = error {
				completionHandler(error, nil)
			} else if let data = data {
				do {
					let objectData = try JSONDecoder().decode(ObjectIDs.self, from: data)
					completionHandler(nil, objectData.objectIDs)
				} catch {
					completionHandler(AppError.decodingError(error), nil)
				}
			}
		}
	}

	func getObjectIds(completionHandler: @escaping(AppError?, [Int]?) -> Void) {
		let url = "https://collectionapi.metmuseum.org/public/collection/v1/objects"
		NetworkHelper.shared.performDataTask(endpointURLString: url, httpMethod: "GET", httpBody: nil) { (error, data, response) in
			if let error = error {
				completionHandler(error, nil)
			} else if let data = data {
				do {
					let objectData = try JSONDecoder().decode(ObjectIDs.self, from: data)
					completionHandler(nil, objectData.objectIDs)
				} catch {
					completionHandler(AppError.decodingError(error), nil)
				}
			}
		}
	}
	
	func getObjectData(keyword: Int, completionHandler: @escaping (AppError?, ObjectData?) -> Void) {
		let url = "https://collectionapi.metmuseum.org/public/collection/v1/objects/\(keyword)"
		NetworkHelper.shared.performDataTask(endpointURLString: url, httpMethod: "GET", httpBody: nil) { (error, data, response) in
			if let error = error {
				completionHandler(error, nil)
			} else if let data = data {
				do {
					let objectData = try JSONDecoder().decode(ObjectData.self, from: data)
					completionHandler(nil, objectData)
				} catch {
					completionHandler(AppError.decodingError(error), nil)
				}
			}
		}
	}
}
