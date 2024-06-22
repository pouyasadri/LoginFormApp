//
//  Profile.swift
//  LoginSupabaseApp
//
//  Created by Pouya Sadri on 21/06/2024.
//

import Foundation

struct Profile: Decodable, Encodable{
	let username : String?
	let fullName : String?
	let website : String?
	let avatarURL : String?
	
	enum CodingKeys: String, CodingKey{
		case username
		case fullName = "full_name"
		case website
		case avatarURL = "avatar_url"
	}
}
