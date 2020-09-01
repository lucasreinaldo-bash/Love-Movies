//
//  LoginController.swift
//  Love Movies
//
//  Created by Lucas Reinaldo on 30/08/20.
//  Copyright © 2020 Vostore. All rights reserved.
//

import UIKit
class LoginController: UIViewController {

    //Propriedades
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var senhaField: UITextField!
    
    @IBOutlet weak var entrar: UIButton!
    
   
    
    
    lazy var emailContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, #imageLiteral(resourceName: "icons8-important-mail-100"), emailTextField)
    }()
    lazy var passwordContainerView: UIView = {
          let view = UIView()
          return view.textContainerView(view: view, #imageLiteral(resourceName: "icons8-lock-100"), passwordTextField)
      }()
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceHolder: "Seu e-mail", isSecureTextEntry: false)
    }()
    lazy var passwordTextField: UITextField = {
           let tf = UITextField()
           return tf.textField(withPlaceHolder: "Sua senha", isSecureTextEntry: true)
       }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Entrar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize:18)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        button.layer.cornerRadius = 5
        return button
        
    }()
    
    let naoTenhoContaButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Não tem uma conta ? ", attributes:[NSAttributedString.Key.font: UIFont.systemFont(ofSize:16), NSAttributedString.Key.foregroundColor:UIColor.white])
        attributedTitle.append(NSAttributedString(string: "Cadastre-se", attributes: [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleRegistro), for: .touchUpInside)
        
        return button
    }()
    
    
    //Inicializando
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        entrar.addTarget(self, action: #selector(handleRegistro), for: .touchUpInside)

        // Do any additional setup after loa
//        configureViewComponents()
        }
    

    //Seletores
    
    @objc func handleLogin(){
        
        print("Button Login")
    }
    @objc func handleRegistro(){
           navigationController?.pushViewController(RegistroController(), animated: true)
    }
    
    // Functions
    
    func configureViewComponents(){
        
        view.backgroundColor = UIColor.blue
        navigationController?.navigationBar.isHidden = true
        
        
        
       
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
