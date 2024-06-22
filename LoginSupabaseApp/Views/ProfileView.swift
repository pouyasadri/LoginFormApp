//
//  ProfileView.swift
//  LoginSupabaseApp
//
//  Created by Pouya Sadri on 21/06/2024.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
	@Bindable var viewModel = ProfileViewModel()
	
    var body: some View {
		NavigationStack{
			Form{
				Section{
					HStack{
						Group{
							if let avatarImage = viewModel.avatarImage{
								avatarImage.image
									.resizable()
							}else{
								Color.clear
							}
						}
						.scaledToFit()
						.frame(width: 80,height: 80)
						
						Spacer()
						
						PhotosPicker(selection: $viewModel.imageSelection, matching: .images, label: {
							Image(systemName: "pencil.circle.fill")
								.symbolRenderingMode(.multicolor)
								.font(.system(size: 30))
								.foregroundColor(.accentColor)
						})
					}
				}
				
				Section{
					TextField("Username", text: $viewModel.username)
						.textContentType(.username)
						.autocapitalization(.none)
					
					TextField("Full Name",text: $viewModel.fullName)
						.textContentType(.name)
					
					TextField("Website",text: $viewModel.website)
						.textContentType(.URL)
						.autocapitalization(.none)
				}
				
				Section{
					Button("Update Profile"){
						viewModel.updateProfile()
					}
					.bold()
					
					if viewModel.isLoading{
						ProgressView()
					}
				}
			}
			.navigationTitle("Profiles")
			.toolbar(content: {
				ToolbarItem(placement:.topBarTrailing){
					Button("Sign Out",role: .destructive){
						viewModel.signOut()
					}
				}
			})
			.onChange(of: viewModel.imageSelection, perform: {
				newValue in
				if let newValue = newValue {
					viewModel.loadTransferable(from: newValue)
				}
			})
		}
		.task {
			await viewModel.getInitialProfile()
		}
    }
}

#Preview {
    ProfileView()
}
