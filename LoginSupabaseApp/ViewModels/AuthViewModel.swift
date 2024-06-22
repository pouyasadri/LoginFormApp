//
//  AuthViewModel.swift
//  LoginSupabaseApp
//
//  Created by Pouya Sadri on 21/06/2024.
//

import SwiftUI
import Supabase
import Observation

@Observable
class AuthViewModel{
	var userEmail = ""
	var userPassword = ""
	var isLoading = false
	var authResult: Result<Void,Error>?{
		didSet{
			if case .failure = authResult{
				showAlert = true
			}
		}
	}
	var showAlert = false
	var errorMassage : String?
	
	private func toggleLoadingState(){
		withAnimation{
			isLoading.toggle()
		}
	}
	
	@MainActor
	func signIn() async{
		toggleLoadingState()
		
		defer{ toggleLoadingState() }
		
		do{
			try await supabase.auth.signIn(email: userEmail, password: userPassword)
			authResult = .success(())
		}catch{
			authResult = .failure(error)
			errorMassage = error.localizedDescription
		}
	}
}
