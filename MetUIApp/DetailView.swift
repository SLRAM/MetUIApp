//
//  DetailView.swift
//  MetUIApp
//
//  Created by Stephanie Ramirez on 2/7/20.
//  Copyright © 2020 Stephanie Ramirez. All rights reserved.
//

import SwiftUI

struct DetailView: View {
  let object: String
  var body: some View {
    Text(object)
  }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
		DetailView(object: "Object")
    }
}
