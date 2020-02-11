//
//  ObjectView.swift
//  MetUIApp
//
//  Created by Stephanie Ramirez on 2/11/20.
//  Copyright © 2020 Stephanie Ramirez. All rights reserved.
//

import SwiftUI

struct ObjectView: View {
	@ObservedObject var viewModel: ObjectListViewModel
	@EnvironmentObject var selectedDepartment: SelectedDepartment

	init(viewModel: ObjectListViewModel) {
		self.viewModel = viewModel
	}

	var body: some View {
		VStack {
			Text(viewModel.object.objectName)
			Image(uiImage: viewModel.image)
			.resizable()
				.frame(width: 300, height: 300, alignment: .center)
		}
  }
}

//struct ObjectView_Previews: PreviewProvider {
//    static var previews: some View {
//		ObjectView(viewModel: <#ObjectListViewModel#>)
//    }
//}
