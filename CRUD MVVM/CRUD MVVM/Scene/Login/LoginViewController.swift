//
//  LoginViewController.swift
//  CRUD MVVM
//
//  Created by Ancarinha on 11/05/22.
//

import UIKit

class LoginViewController: UIViewController {
    let viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .MyTheme.backgroundColor
        //UIColor.MyTheme.mainPinkColor
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.agencyTextField.addBottomLineWithColor(color: .MyTheme.defaultTextColor, width: 1.0)
        self.accountTextField.addBottomLineWithColor(color: .MyTheme.defaultTextColor, width: 1.0)
        self.passwordTextField.addBottomLineWithColor(color: .MyTheme.defaultTextColor, width: 1.0)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        agencyTextField.text = ""
        accountTextField.text = ""
        passwordTextField.text = ""
    }
    
    //MARK: - UI Elements
    
    private lazy var welcomeLabel: UILabel = {
        let view = UILabel()
        
        let attrs1 = [NSAttributedString.Key.font : UIFont.MyTheme.boldTitleText, NSAttributedString.Key.foregroundColor : UIColor.white]
        let attrs2 = [NSAttributedString.Key.font : UIFont.MyTheme.boldTitleText, NSAttributedString.Key.foregroundColor : UIColor.black]
        let attrs3 = [NSAttributedString.Key.font : UIFont.MyTheme.boldTitleText, NSAttributedString.Key.foregroundColor : UIColor.white]
        
        let atritutedString1 = NSMutableAttributedString(string: "Seja bem-vindo ao ", attributes: attrs1 as [NSAttributedString.Key : Any])
        let atritutedString2 = NSMutableAttributedString(string: "OinkBank, ", attributes: attrs2 as [NSAttributedString.Key : Any])
        let atritutedString3 = NSMutableAttributedString(string: "seu mais novo banco.", attributes: attrs3 as [NSAttributedString.Key : Any])
        
        
        atritutedString1.append(atritutedString2)
        atritutedString1.append(atritutedString3)
        view.numberOfLines = 3
        view.attributedText = atritutedString1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    
    }()
    
    private lazy var rectangleImage: UIImageView = {
        let wallpapper = UIImageView()
        wallpapper.tintColor = .MyTheme.mainBlueColor
        wallpapper.translatesAutoresizingMaskIntoConstraints = false
        wallpapper.image = UIImage(named: "rectangle1")
        return wallpapper
    }()
    

    //Label
    private lazy var agencyLabel: UILabel = {
       let view = UILabel()
        view.textColor = .MyTheme.defaultTextColor
        //.MyTheme.whiteTextColor
        view.font = .MyTheme.defaultText
        view.text = "Agência"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var accountLabel: UILabel = {
       let view = UILabel()
        view.textColor = .MyTheme.defaultTextColor
        //.MyTheme.whiteTextColor
        view.text = "Conta com dígito"
        view.font = .MyTheme.defaultText
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //TextField
    private lazy var agencyTextField: UITextField = {
       let view = UITextField()
        view.borderStyle = .none
        view.placeholder = "1-9"
        view.backgroundColor = .clear
        view.textColor = .MyTheme.mainBlueColor
        
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.keyboardType = .decimalPad
        view.layer.cornerRadius = 5
        return view
    }()
    
    private lazy var accountTextField: UITextField = {
       let view = UITextField()
        view.borderStyle = .none
        view.placeholder = "1-9"
        view.backgroundColor = .clear
        view.textColor = .MyTheme.mainBlueColor
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.keyboardType = .decimalPad
        view.layer.cornerRadius = 5
        return view
    }()
    
    // MARK: - password label and textfield
    private lazy var passwordLabel: UILabel = {
       let view = UILabel()
        view.textColor = .MyTheme.defaultTextColor
        //.MyTheme.whiteTextColor
        view.font = .MyTheme.defaultText
        view.text = "Senha"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var passwordTextField: UITextField = {
       let view = UITextField()
        view.placeholder = "******"
        view.backgroundColor = .clear
        view.textColor = .MyTheme.mainBlueColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isSecureTextEntry = true
        return view
    }()
    
    // MARK: - login button
    private lazy var loginButton: UIButton = {
        let view = UIButton.defaultButton(title: "Entrar", target: self, selector: #selector(performLogin))
        return view
    }()
    
    //MARK: -register button
    private lazy var registerButton: UIButton = {
       let view = UIButton()
        view.tintColor = .MyTheme.defaultTextColor
        view.setTitleColor(.tintColor, for: .normal)
        view.setTitle("Não tem conta? Cadastre-se", for: .normal)
        view.titleLabel?.font = .MyTheme.defaultText
        view.layer.cornerRadius = 5
        view.addTarget(self, action: #selector(registerTapButton), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - register tap button
    @objc func registerTapButton(){
        let registerViewController = RegisterViewController()
        self.navigationController?.pushViewController(registerViewController, animated: true)
    }

    
    
    //MARK: - logo imageview
    private lazy var logoImageView: UIImageView = {
        let view = UIImageView()
        view.tintColor = .MyTheme.whiteTextColor
        view.image = UIImage(named: "logo pig")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    


    //MARK: - init
    init(){
        super.init(nibName: nil, bundle: nil)
        setupView()
        setupConstraints()
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SetupView
    private func setupView(){
        
        view.addSubview(rectangleImage)
        view.addSubview(welcomeLabel)
        view.addSubview(agencyLabel)
        view.addSubview(accountLabel)
        view.addSubview(agencyTextField)
        view.addSubview(accountTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(logoImageView)
        view.addSubview(registerButton)
    }
    
    //MARK: - Constraints
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -70),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            welcomeLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.70),
            
            rectangleImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            rectangleImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rectangleImage.widthAnchor.constraint(equalTo: view.widthAnchor),
            rectangleImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.40),
            
            logoImageView.topAnchor.constraint(equalTo: rectangleImage.bottomAnchor, constant: -50),
            logoImageView.centerXAnchor.constraint(equalTo: self.loginButton.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: 0.5),
            
            agencyLabel.topAnchor.constraint(equalTo: view.centerYAnchor),
            agencyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            accountLabel.topAnchor.constraint(equalTo: agencyLabel.topAnchor),
            accountLabel.leadingAnchor.constraint(equalTo: view.centerXAnchor),
            
            agencyTextField.topAnchor.constraint(equalTo: agencyLabel.bottomAnchor, constant: 5),
            agencyTextField.leadingAnchor.constraint(equalTo: agencyLabel.leadingAnchor),
            agencyTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            
            accountTextField.topAnchor.constraint(equalTo: agencyTextField.topAnchor),
            accountTextField.leadingAnchor.constraint(equalTo: accountLabel.leadingAnchor),
//            accountTextField.widthAnchor.constraint(equalTo: agencyTextField.widthAnchor),
            accountTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            
            passwordLabel.topAnchor.constraint(equalTo: agencyTextField.bottomAnchor, constant: 5),
            passwordLabel.leadingAnchor.constraint(equalTo: agencyTextField.leadingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: accountTextField.trailingAnchor),
            
            loginButton.widthAnchor.constraint(equalTo: passwordTextField.widthAnchor),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            registerButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }
    
    //MARK: - button perform
    @objc func performLogin(){
        viewModel.loginPassword = passwordTextField.text ?? ""
        viewModel.loginAccount = accountTextField.text ?? ""
        viewModel.loginAgency = agencyTextField.text ?? ""
        
        viewModel.doLogin()
    }
}

//MARK: - Delegate
extension LoginViewController: LoginViewModelDelegate {
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
    
    func onSuccessPush() {
        let homeViewController = HomeViewController()
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
}

extension UIView {
    
    func addBottomLineWithColor(color: UIColor, width: CGFloat) {
        
        let bottomBorderLine = CALayer()
        bottomBorderLine.backgroundColor = color.cgColor
        bottomBorderLine.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        self.layer.addSublayer(bottomBorderLine)
        

    }
}


