//
//  ContentView.swift
//  MetUIApp
//
//  Created by Stephanie Ramirez on 2/7/20.
//  Copyright © 2020 Stephanie Ramirez. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {

	@ObservedObject var model = DepartmentListViewModel()

//	init() {
//
////		Webservice().getObjectIds { (err, list) in
////			print(list?.count)
////		}
//		Webservice().getDepartments { (error, departments) in
//			guard let departments = departments else {return}
//			for department in departments {
//				print(department.displayName)
//			}
//		}
//	}
    var body: some View {
		List(model.departments, id: \.self) { department in
			Text(department.displayName)

		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
