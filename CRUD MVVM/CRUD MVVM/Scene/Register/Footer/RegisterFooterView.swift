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
    static let height: CGFloat = 50
    
    var clickRegisterButton: (() -> Void)?
    
    //MARK: - UIElements
    private lazy var registerButton: UIButton = UIButton.defaultButton(title: "Cadastrar", font: UIFont.MyTheme.defaultText, target: self, selector: #selector(performRegister))
    
    
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
    }
    
    func setupLayoutConstraints(){
        NSLayoutConstraint.activate([
            registerButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            registerButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            registerButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ])
    }
    
    //MARK: - Button Perform
    @objc func performRegister(){
        clickRegisterButton?()
        
        viewModel?.addNewClient()
    }
    
    
    
}
