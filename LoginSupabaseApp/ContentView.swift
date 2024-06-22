//
//  ContentView.swift
//  LoginSupabaseApp
//
//  Created by Pouya Sadri on 21/06/2024.
//

import SwiftUI

struct ContentView: View {
	@State private var isAuthenticated = false
	
    var body: some View {
		Group{
			if isAuthenticated{
				ProfileView()
			}else {
				LoginFormView()
			}
		}
		.task {
			for await state in supabase.auth.authStateChanges{
				if [.initialSession,.signedIn,.signedOut].contains( state.event){
					isAuthenticated = state.session != nil
				}
			}
		}
    }
}

#Preview {
    ContentView()
}
