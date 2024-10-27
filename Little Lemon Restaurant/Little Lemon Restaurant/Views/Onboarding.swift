//
//  Onboarding.swift
//  Little Lemon Restaurant
//
//  Created by Mahadik, Amit on 2/5/24.
//

import SwiftUI

struct Onboarding: View {
    @StateObject private var viewModel = ViewModel()
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var phoneNumber = ""
    
    @State var isKeyboardVisible = false
    @State var contentOffset: CGSize = .zero
    
    @State var isLoggedIn = false
    
    
    var body: some View {
        
        if #available(iOS 16.0, *) {
            NavigationStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        Header()
                        Hero()
                            .padding()
                            .background(Color.primaryColor1)
                            .frame(maxWidth: .infinity, maxHeight: 240)
                        VStack {
                            NavigationLink(
                                destination: Home(),isActive: $isLoggedIn) { }
                            Text("First Name *")
                                .onboardingTextStyle()
                            TextField("First Name", text: $firstName)
                            Text("Last Name *")
                                .onboardingTextStyle()
                            TextField("Last Name", text: $lastName)
                            Text("Email *")
                                .onboardingTextStyle()
                            TextField("E-mail", text: $email)
                                .keyboardType(.emailAddress)
                        }
                        .textFieldStyle(.roundedBorder)
                        .disableAutocorrection(true)
                        .padding()
                        
                        if viewModel.errorMessageShow {
                            withAnimation() {
                                Text(viewModel.errorMessage)
                                    .foregroundColor(.red)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading)
                            }
                        }
                        
                        Button("Register") {
                            if viewModel.validateUserInput(firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber) {
                                UserDefaults.standard.set(firstName, forKey: kFirstName)
                                UserDefaults.standard.set(lastName, forKey: kLastName)
                                UserDefaults.standard.set(email, forKey: kEmail)
                                UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                                UserDefaults.standard.set(true, forKey: kOrderStatuses)
                                UserDefaults.standard.set(true, forKey: kPasswordChanges)
                                UserDefaults.standard.set(true, forKey: kSpecialOffers)
                                UserDefaults.standard.set(true, forKey: kNewsletter)
                                firstName = ""
                                lastName = ""
                                email = ""
                                isLoggedIn = true
                            }
                        }
                        .buttonStyle(ButtonStyleYellowColorWide())
                        
                        Spacer()
                        
                    }
                    .offset(y: contentOffset.height)
                    .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { notification in
                        withAnimation {
                            let keyboardRect =
                            notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                            let keyboardHeight = keyboardRect.height
                            self.isKeyboardVisible = true
                            self.contentOffset = CGSize(width: 0, height: -keyboardHeight)
                        }
                        
                    }
                    .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { notification in
                        withAnimation {
                            self.isKeyboardVisible = false
                            self.contentOffset = .zero
                        }
                    }
                    
                }
                .onAppear() {
                    if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                        isLoggedIn = true
                    }
                }
            }
            .navigationBarBackButtonHidden()
        } else {
            // Fallback on earlier versions
        }
        
      //  Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    Onboarding()
}
