//
//  UserViewModel.swift
//  Experience View
//
//  Created by Italo Rossy on 13/03/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

enum ErrorFields: Error {
    case invalidFields
    case errorToCreate
}

class RegisterViewModel {
    private let model: UserModel
    private let auth: Auth!
    private let firestore: Firestore!
    private let storage: Storage!
    
    init(model: UserModel) {
        self.model = model
        auth = Auth.auth()
        firestore = Firestore.firestore()
        storage = Storage.storage()
    }
    
    init() {
        self.model = UserModel()
        auth = Auth.auth()
        firestore = Firestore.firestore()
        storage = Storage.storage()
    }
    
    var email : String {
        model.email
    }
    
    func registerNewUser(_ nome: String, _ email : String,_ password: String, _ imgSend: UIImage , completion: @escaping (NSDictionary) -> Void) {
        var resultReturn:NSDictionary = [:]
        guard nome != "" && email != "" && password != "" else {
            completion(["result":"error", "message_error":"invalidFields"])
            return
        }
        
        auth.createUser(withEmail: email, password: password) { (result, error) in
            if error == nil {
                if let idResultado = result?.user.uid {
                    let imagemSelecionada = imgSend
                    if let imagemSend = imagemSelecionada.jpegData(compressionQuality: 0.3) {
                        let idImg = UUID().uuidString
                        let imgPathRef = self.storage.reference().child("Imagens").child("\(idImg).jpg")
                            imgPathRef.putData(imagemSend, metadata: nil) { storageMetadata, error in
                                if error == nil {
                                    imgPathRef.downloadURL { url, erro in
                                        if erro == nil {
                                            if let urlImage = url?.absoluteString {
                                                self.firestore.collection("usuarios").document(idResultado).setData(["nome": nome, "email": email, "url_img": urlImage]) { err in
                                                    if let err = err {
                                                        print("Error writing document: \(err)")
                                                        resultReturn = ["result":"error", "message_error": err.localizedDescription]
                                                        completion(resultReturn)
                                                        return
                                                    } else {
                                                        resultReturn = ["result":"success", "message_error":""]
                                                        do {
                                                            try self.auth.signOut()
                                                            completion(resultReturn)
                                                            return
                                                        }
                                                        catch {
                                                            resultReturn = ["result":"error", "message_error": "erro ao deslogar usuario"]
                                                            completion(resultReturn)
                                                            return
                                                        }
                                                    }
                                                }
                                                
                                            } else {
                                                resultReturn = ["result":"error", "message_error": erro?.localizedDescription ?? "Erro na obtenção da URL da imagem"]
                                                completion(resultReturn)
                                                return
                                            }
                                        } else {
                                            resultReturn = ["result":"error", "message_error": erro?.localizedDescription ?? "Erro na obtenção da URL da imagem"]
                                            completion(resultReturn)
                                            return
                                        }
                                        
                                    }
                                } else {
                                    resultReturn = ["result":"error", "message_error": error?.localizedDescription ?? "error on upload img"]
                                    completion(resultReturn)
                                    return
                                }
                        
                        
                        }
                    } else {
                        resultReturn = ["result":"error", "message_error": error?.localizedDescription ?? "Erro ao cadastrar usuario"]
                        completion(resultReturn)
                        return
                    }
                    
                }
            }
        }
    }
}

