//
//  DepartmentListViewModel.swift
//  MetUIApp
//
//  Created by Stephanie Ramirez on 2/7/20.
//  Copyright © 2020 Stephanie Ramirez. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class DepartmentListViewModel: ObservableObject {
    @Published var pushed = false

	init() {
//		fetchDepartments()
		load()
	}

	@Published var departments = [Department]() {
		didSet {
//			didChange.send(self)
		}
	}
	func load() {
		guard let url = URL(string: "https://collectionapi.metmuseum.org/public/collection/v1/departments") else { return }
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			do {
				guard let data = data else { return }
				let departments = try JSONDecoder().decode(Departments.self, from: data)
				DispatchQueue.main.async {
					self.departments = departments.departments
				}
			} catch {
				print("Failed to decode: ", error)
			}
		}.resume()
	}
//	private func fetchDepartments() {
//		Webservice().getDepartments { (error, departments) in
//			DispatchQueue.main.async {
//				if let departments = departments {
//					self.departments = departments
//					print("departments fetched: \(departments.count)")
//				} else {
//					print("did not fetch departments: \(error?.errorMessage())")
//				}
//			}
//		}
//
//	}
//	let didChange = PassthroughSubject<DepartmentListViewModel,Never>()
}
