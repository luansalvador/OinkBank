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
    private lazy var registerButton: UIButton = {
       let view = UIButton()
        view.backgroundColor = UIColor.MyTheme.mainBlueColor
        view.titleLabel?.font = .MyTheme.defaultText
        view.tintColor = UIColor.MyTheme.backgroundColor
        view.setTitleColor(.tintColor, for: .normal)
        view.setTitle("Cadastrar", for: .normal)
        view.addTarget(self, action: #selector(performRegister), for: .touchUpInside)
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    }
    
    func setupLayoutConstraints(){
        NSLayoutConstraint.activate([
            registerButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.85),
            registerButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            registerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    //MARK: - Button Perform
    @objc func performRegister(){
        clickRegisterButton?()
        
        viewModel?.addNewClient()
    }
    
    
    
}
