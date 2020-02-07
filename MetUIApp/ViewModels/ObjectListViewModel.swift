//
//  ObjectListViewModel.swift
//  MetUIApp
//
//  Created by Stephanie Ramirez on 2/7/20.
//  Copyright © 2020 Stephanie Ramirez. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class ObjectListViewModel: ObservableObject {
	let department: Int

	init(department: Int) {
		self.department = department
		fetchObjects()
	}

	@Published var objects = [Int]() {
		didSet {
			didChange.send(self)
		}
	}
	private func fetchObjects() {
		Webservice().getAllObjectsInDepartment(department: department) { (error, objects) in
			DispatchQueue.main.async {
				if let objects = objects {
					self.objects = objects
				} else {
					print("did not fetch object Ids: \(error?.errorMessage())")
				}
			}
		}
//		Webservice().getDepartments { (error, departments) in
//			DispatchQueue.main.async {
//				if let departments = departments {
//					self.departments = departments
////					print("departments fetched: \(departments.count)")
//				} else {
//					print("did not fetch departments: \(error?.errorMessage())")
//				}
//			}
//		}

	}
	let didChange = PassthroughSubject<ObjectListViewModel,Never>()
}
