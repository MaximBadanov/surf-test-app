//
//  ProfileStruct.swift
//  profileTestApp
//
//  Created by Максим Баданов on 15.09.2023.
//

import Foundation
import UIKit

struct ProfileModel {
	let imageName: String
	let name: String
	let description: String?
	let place: String?
	
	let about: String
	
	var image: UIImage? { UIImage(named: imageName) }
	
	static let pofile = ProfileModel(imageName: "me",
									  name: "Баданов Максим\nИгоревич",
									  description: "iOS developer trainee, опыт менее 1 года",
									  place: "Санкт-Петербург",
									  about: "Not enough experienced software engineer, still getting skills in developing mobile apps")
}
