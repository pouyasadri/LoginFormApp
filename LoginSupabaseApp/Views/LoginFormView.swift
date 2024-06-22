//
//  LoginFormView.swift
//  LoginSupabaseApp
//
//  Created by Pouya Sadri on 21/06/2024.
//

import SwiftUI

struct LoginFormView: View {
	@Bindable var viewModel = AuthViewModel()
	
    var body: some View {
		VStack(alignment: .leading,spacing: 16){
			Text("Login")
				.font(.largeTitle)
				.fontWeight(.bold)
				.padding(.bottom,20)
			
			VStack(alignment: .leading, spacing: 8){
				Label("Email", systemImage: "envelope")
					.font(.headline)
				
				TextField("Enter your Email Address", text: $viewModel.userEmail)
					.keyboardType(.emailAddress)
					.autocapitalization(.none)
					.textContentType(.emailAddress)
					.padding()
					.background(Color(.secondarySystemBackground))
					.cornerRadius(8)
			}
			
			VStack(alignment: .leading, spacing: 8){
				Label("Password", systemImage: "key")
					.font(.headline)
				
				SecureField("Enter your Password", text: $viewModel.userPassword)
					.textContentType(.password)
					.padding()
					.background(Color(.secondarySystemBackground))
					.cornerRadius(8)
			}
			
			Button(action: {
				Task{
					await viewModel.signIn()
				}
			}, label: {
				if viewModel.isLoading{
					ProgressView()
						.frame(width: 75,height: 75)
						.tint(.white)
				}else{
					Text("Login")
						.font(.headline)
						.padding()
				}
			})
			.foregroundStyle(.white)
			.frame(maxWidth: .infinity)
			.background(.blue)
			.cornerRadius(8)
			.padding(.top,20)
			.disabled(viewModel.userEmail.isEmpty || viewModel.userPassword.isEmpty)
		}
		.padding()
		.alert(isPresented: $viewModel.showAlert, content: {
			Alert(title: Text("Error"),message: Text(viewModel.errorMassage ?? "Unknown Error"),
				  dismissButton: .default(Text("Try Again")))
			
		})
    }
}

#Preview {
    LoginFormView()
}
