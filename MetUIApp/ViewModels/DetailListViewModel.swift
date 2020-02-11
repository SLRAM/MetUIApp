//
//  DetailListViewModel.swift
//  MetUIApp
//
//  Created by Stephanie Ramirez on 2/7/20.
//  Copyright © 2020 Stephanie Ramirez. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class DetailListViewModel: ObservableObject, Identifiable {
	init(selectedDepartment: Department) {
		loadIDs(department: selectedDepartment.departmentId)
	}

	@Published var objects = [Int]() {
		didSet {
//			didChange.send(self)
		}
	}
	@Published var allObjectData = [ObjectData]() {
				didSet {
		//			didChange.send(self)
				}
	}
//	func getAllObjectsInDepartment(department: Int, completionHandler: @escaping(AppError?, [Int]?) -> Void) {
//		let url = "https://collectionapi.metmuseum.org/public/collection/v1/search?departmentId=\(department)&q=cat"
//		NetworkHelper.shared.performDataTask(endpointURLString: url, httpMethod: "GET", httpBody: nil) { (error, data, response) in
//			if let error = error {
//				completionHandler(error, nil)
//			} else if let data = data {
//				do {
//					let objectData = try JSONDecoder().decode(ObjectIDs.self, from: data)
//					completionHandler(nil, objectData.objectIDs)
//				} catch {
//					completionHandler(AppError.decodingError(error), nil)
//				}
//			}
//		}
//	}

	func loadIDs(department: Int) {
		guard let url = URL(string: "https://collectionapi.metmuseum.org/public/collection/v1/search?departmentId=\(department)&q=cat") else { return }
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			do {
				guard let data = data else { return }
				let objectData = try JSONDecoder().decode(ObjectIDs.self, from: data)
				DispatchQueue.main.async {
					self.objects = objectData.objectIDs
//					self.allObjectData = self.objects.map { (self.loadObjectData(object: $0)) }
//					self.loadAllObjectData(objects: self.objects)
				}
			} catch {
				print("Failed to load IDs: ", error)
			}
		}.resume()
	}
	func loadObjectData(object: Int) -> ObjectData {
		guard let url = URL(string: "https://collectionapi.metmuseum.org/public/collection/v1/objects/\(object)") else { return ObjectData.default}
			URLSession.shared.dataTask(with: url) { (data, response, error) in
				do {
					guard let data = data else { return }
					let objectData = try JSONDecoder().decode(ObjectData.self, from: data)
					DispatchQueue.main.async {
//						self.allObjectData.append(objectData)
						return objectData
					}
				} catch {
					print("Failed to load object data: ", error)
				}
		}.resume()
		return ObjectData.default
	}
	func loadAllObjectData(objects: [Int]) {
		var array = [ObjectData]()
		for object in objects {
			guard let url = URL(string: "https://collectionapi.metmuseum.org/public/collection/v1/objects/\(object)") else { return }
				URLSession.shared.dataTask(with: url) { (data, response, error) in
					do {
						guard let data = data else { return }
						let objectData = try JSONDecoder().decode(ObjectData.self, from: data)
						DispatchQueue.main.async {
							self.allObjectData.append(objectData)
							array.append(objectData)
						}
					} catch {
						print("Failed to load object data: ", error)
					}
				}
		}
//		self.allObjectData = array
		print("All object data count: \(self.allObjectData.count)")
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

//	let didChange = PassthroughSubject<ObjectListViewModel,Never>()
}
