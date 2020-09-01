//
//  SignInView.swift
//  Task.it
//
//  Created by Christelle Nieves on 8/31/20.
//  Copyright © 2020 Christelle Nieves. All rights reserved.
//

import SwiftUI

struct SignInView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 300, height: 300)
                
                
                //Text("Thanks for using Task.it, Please Sign in here")
                    //.foregroundColor(Color.white)
                SignInWithAppleButton()
                    .frame(width: 280, height: 45)
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
