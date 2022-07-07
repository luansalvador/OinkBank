import Foundation
import UIKit

var flag: Bool = false

class RegisterFooterView: UIView {
    
    weak var viewModel: RegisterViewModel?
    
    // MARK: - Attributes
    static let height: CGFloat = 200
    
    var clickRegisterButton: (() -> Void)?
    
    
    //MARK: - UIElements
    private lazy var registerButton: UIButton = UIButton.defaultButton(title: "Cadastrar", font: UIFont.MyTheme.defaultText, target: self, selector: #selector(performRegister))
    
    private lazy var loginButton: UIButton = UIButton.transparentButton(title: "Já possui uma conta? Entre aqui", font: .MyTheme.defaultText, target: self, selector: #selector(goToLogin))
    
     lazy var toggleButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "unchecked"), for: .normal)
        button.setImage(UIImage(named: "checked"), for: .selected)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .MyTheme.defaultTextColor
        button.addTarget(self, action: #selector(toggleButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var termsAndConditionsButton: UIButton = UIButton.transparentButton(title: "Ao criar uma conta você aceita nossos termos e condições", font: .MyTheme.defaultText, target: self, selector: #selector(termsButtonTapped))
    
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
        self.addSubview(toggleButton)
        self.addSubview(termsAndConditionsButton)
    }
    
    func setupLayoutConstraints(){
        NSLayoutConstraint.activate([
            
            toggleButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            toggleButton.bottomAnchor.constraint(equalTo: registerButton.topAnchor, constant: -25),
            toggleButton.centerYAnchor.constraint(equalTo: termsAndConditionsButton.centerYAnchor),
            
            termsAndConditionsButton.leadingAnchor.constraint(equalTo: toggleButton.trailingAnchor, constant: 16),
            termsAndConditionsButton.trailingAnchor.constraint(equalTo: registerButton.trailingAnchor),
            termsAndConditionsButton.bottomAnchor.constraint(equalTo: registerButton.topAnchor, constant: -25),
            
            registerButton.topAnchor.constraint(equalTo: self.toggleButton.bottomAnchor, constant: 16),
            registerButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            registerButton.leadingAnchor.constraint(equalTo: toggleButton.leadingAnchor),
            
            loginButton.topAnchor.constraint(equalTo: self.registerButton.bottomAnchor, constant: 16),
            loginButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            loginButton.trailingAnchor.constraint(equalTo: registerButton.trailingAnchor),
            loginButton.leadingAnchor.constraint(equalTo: toggleButton.leadingAnchor),
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
    
    @objc func toggleButtonTapped() {
        
        toggleButton.isSelected.toggle()
        verifyIfSelected()
        
    }
    
    func verifyIfSelected() -> Bool {
    
        if toggleButton.isSelected {
            flag = true
            print(flag)
        }
            return flag
    }
    
    @objc func termsButtonTapped(){
    }
    
    
}
