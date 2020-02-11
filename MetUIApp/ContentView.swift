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
//add a searchbar that is available on all screens to search departments or art
	@ObservedObject var model = DepartmentListViewModel()
	@EnvironmentObject var selectedDepartment: SelectedDepartment


	var body: some View {
		NavigationView {
			List {
				ForEach(model.departments, id: \.self) { department in
					NavigationLink(destination: DetailView(viewModel: DetailListViewModel(selectedDepartment: department))) {
						Text(department.displayName)
					}
				}
			}
			.navigationBarTitle("Departments")
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
