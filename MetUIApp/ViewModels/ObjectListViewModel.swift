//
//  ObjectListViewModel.swift
//  MetUIApp
//
//  Created by Stephanie Ramirez on 2/11/20.
//  Copyright © 2020 Stephanie Ramirez. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class ObjectListViewModel: ObservableObject, Identifiable {
	init(selectedObject: Int) {
		loadObjectData(object: selectedObject)
	}

	@Published var object = ObjectData.default
	@Published var image = UIImage()

	func loadObjectData(object: Int) {
		guard let url = URL(string: "https://collectionapi.metmuseum.org/public/collection/v1/objects/\(object)") else { return }
			URLSession.shared.dataTask(with: url) { (data, response, error) in
				do {
					guard let data = data else { return }
					let objectData = try JSONDecoder().decode(ObjectData.self, from: data)
					DispatchQueue.main.async {
						let imageURL = URL(string: objectData.primaryImageSmall)!
						self.object = objectData
						let session = URLSession(configuration: .default)
						let downloadPicTask = session.dataTask(with: imageURL) { (data, response, error) in
							if let error = error {
								print("Error downloading picture: \(error)")
							} else {
								if let response = response as? HTTPURLResponse {
									print("Downloaded picture with response code \(response.statusCode)")
									if let imageData = data {
										guard let image = UIImage(data: imageData) else {return}
										self.image = image
									} else {
										print("Couldn't get image: Image is nil")
									}
								} else {
									print("Couldn't get response code for some reason")
								}
							}
						}
						downloadPicTask.resume()
					}
				} catch {
					print("Failed to load object data: ", error)
				}
		}.resume()
	}
}
