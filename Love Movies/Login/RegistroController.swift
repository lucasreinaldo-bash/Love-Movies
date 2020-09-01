//
//  RegistroController.swift
//  Love Movies
//
//  Created by Lucas Reinaldo on 30/08/20.
//  Copyright © 2020 Vostore. All rights reserved.
//
import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
class RegistroController: UIViewController {
    //Propriedades
      
      let logoImageView: UIImageView = {
          let img = UIImageView()
          img.contentMode = .scaleAspectFit
          img.clipsToBounds = true
          img.image = #imageLiteral(resourceName: "logo")
          
          return img
      }()
      
      lazy var emailContainerView: UIView = {
          let view = UIView()
          return view.textContainerView(view: view, #imageLiteral(resourceName: "icons8-important-mail-100"), emailTextField)
      }()
    
      lazy var usernameContainerView: UIView = {
           let view = UIView()
           return view.textContainerView(view: view, #imageLiteral(resourceName: "icons8-lock-100"), usernameTextField)
       }()
    
      lazy var passwordContainerView: UIView = {
            let view = UIView()
            return view.textContainerView(view: view, #imageLiteral(resourceName: "icons8-lock-100"), passwordTextField)
        }()
      
      lazy var emailTextField: UITextField = {
           let tf = UITextField()
           return tf.textField(withPlaceHolder: "E-mail", isSecureTextEntry: false)
       }()
   
      lazy var usernameTextField: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceHolder: "Nome", isSecureTextEntry: false)
      }()
   
    lazy var passwordTextField: UITextField = {
      let tf = UITextField()
      return tf.textField(withPlaceHolder: "Senha", isSecureTextEntry: true)
    }()
    
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Registrar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize:18)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(handleRegistro), for: .touchUpInside)
        button.layer.cornerRadius = 5
        return button
        
    }()
  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
      @objc func handleRegistro(){
               
        guard let email = emailTextField.text else {return}
        guard let senha = passwordTextField.text else {return}
        guard let nome = usernameTextField.text else {return}
        
        createUser(withEmail: email, password: senha, username: nome)

           }
        
        // Functions
        
    
    
   //Cadastro no Firebase
    
    func createUser(withEmail email: String, password: String, username: String){
        
        Auth.auth().createUser(withEmail: email, password: password) {
            (result, error) in
            
            if let error = error {
                print("Failed to sign user up with error: ", error.localizedDescription)
                return
            }
            guard let uid = result?.user.uid else {
                return
            }
            
            let values = ["email": email, "nome": username]
            
            Database.database().reference().child("Usuários").child(uid).updateChildValues(values, withCompletionBlock: {(error, ref) in
                if let error = error {
                    print("Falha ao atualizar os valores , erro: ", error.localizedDescription)
                    return
                }
                print("Cadastro realizado com sucesso!")
            })
        }
        
    }
        func configureViewComponents(){
            
            view.backgroundColor = UIColor.blue
            navigationController?.navigationBar.isHidden = true
            
            
            
            view.addSubview(logoImageView)
            logoImageView.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 60, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 150, height: 150)
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            
            view.addSubview(emailContainerView)
            emailContainerView.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 24, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
            
            view.addSubview(passwordTextField)
                   emailContainerView.anchor(top: passwordContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 16, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
            
            
       
    }
    
        /*
        // MARK: - Navigation

        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
        */

    }
