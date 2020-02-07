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

	init() {
		fetchDepartments()
	}

	@Published var departments = [Department]() {
		didSet {
			didChange.send(self)
		}
	}
	private func fetchDepartments() {
		Webservice().getDepartments { (error, departments) in
			DispatchQueue.main.async {
				if let departments = departments {
					self.departments = departments
//					print("departments fetched: \(departments.count)")
				} else {
					print("did not fetch departments: \(error?.errorMessage())")
				}
			}
		}

	}
	let didChange = PassthroughSubject<DepartmentListViewModel,Never>()
}
