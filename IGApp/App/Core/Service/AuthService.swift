//
//  AuthService.swift
//  IGApp
//
//  Created by Softprodigy on 03/05/24.
//
import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import FirebaseFirestore

class AuthService: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser:UserData?
    static let shared = AuthService()
    
    init(){
        // Initialize userSession using AuthStateDidChangeListener
        Auth.auth().addStateDidChangeListener { [weak self] (_, user) in
            self?.userSession = user
        }
        Task{try await loadUserData()}
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            print("login result==>\(result)")
            try await loadUserData()
            // userSession will be updated automatically due to AuthStateDidChangeListener
        } catch {
            print("error in login \(error.localizedDescription)")
            throw error
        }
    }
    
    @MainActor
    func register(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("New user registered")
            await uploadUserData(uid: result.user.uid, username: username, email: email)
            print("New user uploaded to collection")
        } catch {
            print("error in register \(error.localizedDescription)")
            throw error
        }
    }
    
    @MainActor
    func loadUserData() async throws {
        // Implement loading user data
        guard let loggedUserId = Auth.auth().currentUser?.uid else {return}
        let snapShot = try await Firestore.firestore().collection("users").document(loggedUserId).getDocument()
        currentUser = try snapShot.data(as: UserData.self)
    }
    
    @MainActor
    func uploadUserData(uid: String, username: String, email: String) async {
        let user = UserData(id:uid, name: username, profileImage: "", email: email)
        self.currentUser = user
        guard let encodedUser =  try? Firestore.Encoder().encode(user) else {return }
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
    
    func signout() {
        do {
            try Auth.auth().signOut()
            self.currentUser = nil
            self.userSession = nil
            // userSession will be updated automatically due to AuthStateDidChangeListener
        } catch {
            print("error in signout \(error.localizedDescription)")
        }
    }
}

