//
//  ViewController.swift
//  Homework_2.3
//
//  Created by Дарья Яровая on 25.05.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var forgotUserNameButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    private let user = "User"
    private let password = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 5
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        
        setupButton(button: forgotUserNameButton, title: "Forgot\nuser name?")
        setupButton(button: forgotPasswordButton, title: "Forgot\npassword?")
        
    }
    
    private func setupButton(button: UIButton, title: String) {
        button.setTitle(title, for: .normal)
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.textAlignment = .center
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    //переход на второй экран
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeScreenVC = segue.destination as? WelcomeScreenViewController else { return }
        
        guard userNameTextField.text == user && passwordTextField.text == password else {
            showAlert(title: "Invalid login or password", message: "Please, enter correct login and password")
            return
        }
        welcomeScreenVC.userName = user
    }

    //возвращение с другого экрана
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard segue.source is WelcomeScreenViewController else { return }
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    //настройка алерта
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    @IBAction func pressedForgotButton(_ sender: UIButton) {
        sender == forgotUserNameButton
            ? showAlert(title: "Oops!", message: "Your name is User")
            : showAlert(title: "Oops!", message: "Your password is Password")
    }
}

extension LoginViewController: UITextFieldDelegate {
    //скрытие клавиатуры по тапу в другое место
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    //переход в следующее поле ввода
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            performSegue(withIdentifier: "goToWelcomeScreen", sender: self)
        }
        return true
    }
}
