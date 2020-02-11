//
//  DetailView.swift
//  MetUIApp
//
//  Created by Stephanie Ramirez on 2/7/20.
//  Copyright © 2020 Stephanie Ramirez. All rights reserved.
//

import SwiftUI
struct DetailView: View {
	@ObservedObject var viewModel: DetailListViewModel
	@EnvironmentObject var selectedDepartment: SelectedDepartment

	init(viewModel: DetailListViewModel) {
		self.viewModel = viewModel
	}

	var body: some View {
	  NavigationView {
		  List {
			ForEach(viewModel.objects, id: \.self) { object in
//				Text(String(object))
				NavigationLink(destination: ObjectView(viewModel: ObjectListViewModel(selectedObject: object))) {
					Text(String(object))
				}
			  }
		  }
		  .navigationBarTitle("ObjectIDs")
	  }
  }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
		DetailView(viewModel: DetailListViewModel(selectedDepartment: Department.default))
    }
}
