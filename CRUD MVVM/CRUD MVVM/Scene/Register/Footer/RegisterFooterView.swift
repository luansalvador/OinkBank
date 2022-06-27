//
//  RegisterFooterView.swift
//  CRUD MVVM
//
//  Created by user210203 on 4/28/22.
//

import Foundation
import UIKit

class RegisterFooterView: UIView {
    // Reference of other class' ViewModel(RegisterViewModel) to this one. Definition on ViewController
    weak var viewModel: RegisterViewModel?
    
    // MARK: - Attributes
    static let height: CGFloat = 200
    
    var clickRegisterButton: (() -> Void)?
    
    
    //MARK: - UIElements
    private lazy var registerButton: UIButton = UIButton.defaultButton(title: "Cadastrar", font: UIFont.MyTheme.defaultText, target: self, selector: #selector(performRegister))
    
    private lazy var loginButton: UIButton = UIButton.transparentButton(title: "Já possui uma conta? Entre aqui", font: .MyTheme.defaultText, target: self, selector: #selector(goToLogin))
    
    private lazy var toggleButtonTerms: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "square"), for: .normal)
        button.backgroundColor = .clear
        button.semanticContentAttribute = .forceLeftToRight
        button.contentHorizontalAlignment = .center
        button.setTitle("Ao criar uma conta você aceita nossos termos e condições", for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.setTitleColor(UIColor.MyTheme.defaultTextColor, for: .normal)
        button.titleLabel?.font = .MyTheme.defaultText
        button.addTarget(self, action: #selector(toggleButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    //MARK: - Initializer
    init() {
        super.init(frame: .zero)
        self.setupView()
        self.setupLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setupview and Constraints
    func setupView(){
        self.addSubview(registerButton)
        self.addSubview(loginButton)
        self.addSubview(toggleButtonTerms)
    }
    
    func setupLayoutConstraints(){
        NSLayoutConstraint.activate([
            toggleButtonTerms.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            toggleButtonTerms.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
//            toggleButtonTerms.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            

            registerButton.topAnchor.constraint(equalTo: self.toggleButtonTerms.bottomAnchor, constant: 25),
            registerButton.trailingAnchor.constraint(equalTo: toggleButtonTerms.trailingAnchor),
            registerButton.leadingAnchor.constraint(equalTo: toggleButtonTerms.leadingAnchor),
            
            loginButton.topAnchor.constraint(equalTo: self.registerButton.bottomAnchor, constant: 16),
            loginButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            loginButton.trailingAnchor.constraint(equalTo: toggleButtonTerms.trailingAnchor),
            loginButton.leadingAnchor.constraint(equalTo: toggleButtonTerms.leadingAnchor),
        ])
    }
    
    //MARK: - Button Perform
    @objc func performRegister(){
        clickRegisterButton?()
        
        viewModel?.addNewClient()
    }
    
    @objc func goToLogin(){
        clickRegisterButton?()
        
        viewModel?.popViewController()
    }
    
    @objc func toggleButtonTapped(){
        clickRegisterButton?()
        
        guard let image = self.toggleButtonTerms.currentImage else {return}
        let square = UIImage(systemName: "square")
        let check = UIImage(systemName: "checkmark.square.fill")
        
        if image == square {
            self.toggleButtonTerms.setImage(check, for: .normal)
        }
        
        if image == check {
            self.toggleButtonTerms.setImage(square, for: .normal)
        }
        
        
    }
    
    
}
