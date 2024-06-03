//
//  LoginViewModel.swift
//  CulinaryCompass
//
//  Created by monscerrat gutierrez on 31/05/24.
//

import Foundation


import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var message: String = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var forgotPasswordEmail = ""
    @Published var forgotPasswordErrorMessage = ""
    @Published var isForgotPasswordSuccess = false
    @Published var name = ""
    @Published var isAuthenticated: Bool = false
    @Published var isRegistered: Bool = false // Nueva propiedad para rastrear el estado de registro

    init() {}

    // Register function
    func register(completion: @escaping (Bool) -> Void) {
        guard validateRegistration() else {
            completion(false)
            return
        }

        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                self?.errorMessage = error.localizedDescription
                completion(false)
                return
            }

            guard let userId = result?.user.uid else {
                self?.errorMessage = "Failed to retrieve user ID."
                completion(false)
                return
            }

            self?.insertUserRecord(id: userId)
            self?.isRegistered = true
            completion(true)
        }
    }

    private func insertUserRecord(id: String) {
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users").document(id).setData(newUser.asDictionary()) { [weak self] error in
            if let error = error {
                self?.errorMessage = "Failed to insert user record: \(error.localizedDescription)"
            } else {
                self?.isRegistered = true // Actualiza el estado de registro cuando se completa con éxito
            }
        }
    }

    func login() {
        guard validateLogin() else {
            return
        }

        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if let error = error {
                self?.errorMessage = error.localizedDescription
                self?.isAuthenticated = false
                return
            }

            self?.errorMessage = ""
            self?.isAuthenticated = true
        }
    }

    func forgotPassword() {
        guard validateForgotPassword() else {
            return
        }

        Auth.auth().sendPasswordReset(withEmail: forgotPasswordEmail) { [weak self] error in
            if let error = error {
                self?.forgotPasswordErrorMessage = error.localizedDescription
                self?.isForgotPasswordSuccess = false
            } else {
                self?.isForgotPasswordSuccess = true
            }
        }
    }

    private func validateRegistration() -> Bool {
        errorMessage = ""
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields."
            return false
        }

        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email."
            return false
        }

        guard password.count >= 6 else {
            errorMessage = "Password must be at least 6 characters long."
            return false
        }

        return true
    }

    private func validateLogin() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields."
            return false
        }

        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email."
            return false
        }

        guard password.count >= 6 else {
            errorMessage = "Password must be at least 6 characters long."
            return false
        }

        return true
    }

    private func validateForgotPassword() -> Bool {
        forgotPasswordErrorMessage = ""
        guard !forgotPasswordEmail.trimmingCharacters(in: .whitespaces).isEmpty else {
            forgotPasswordErrorMessage = "Please enter your email address."
            return false
        }

        guard forgotPasswordEmail.contains("@") && forgotPasswordEmail.contains(".") else {
            forgotPasswordErrorMessage = "Please enter a valid email address."
            return false
        }

        return true
    }
}
