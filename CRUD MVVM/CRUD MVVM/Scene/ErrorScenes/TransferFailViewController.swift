//
//  CadastroConcluido.swift
//  CRUD MVVM
//
//  Created by user217685 on 6/14/22.
//

import UIKit
import Foundation

class TransferFailViewController: UIViewController {
    //MARK: - Labels Texts
    private lazy var errorLabel:UILabel = {
        let view = UILabel()
        view.text = "Erro na transação!"
        view.numberOfLines = 0
        view.font = UIFont.MyTheme.defaultText.withSize(24)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        }()
    private lazy var infoLabel:UILabel = {
        let view = UILabel()
        view.text = "No momento, não foi possível efetuar a transação. Tente novamente mais tarde ou entre em contato conosco."
        view.numberOfLines = 0
        view.font = UIFont.MyTheme.defaultText.withSize(17)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        }()
    //MARK: - Images Views
    
    private lazy var pigImageTransferFail: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "FredTransferFail")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    //MARK: - Botão
    private lazy var backButton: UIButton = {
        let view = UIButton()
        view.setTitle("Voltar", for: .normal)
        view.addTarget(self, action: #selector(TapBack), for: .touchUpInside)
        view.backgroundColor = UIColor.MyTheme.mainGreenButtonColor
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    //MARK: - Button Actions
    @objc func TapBack() {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
        self.navigationController!.popToViewController(viewControllers[viewControllers.count - 5], animated: true)
    }
   
    
    //MARK: - viewdidload
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let presentationController = presentationController as? UISheetPresentationController {
                presentationController.detents = [
                    .large()
                ]
            setupView()
            setupConstraints()
            self.navigationController?.isNavigationBarHidden = true
            view.backgroundColor = .white
    }
    }
    //MARK: - SetupView
        func setupView(){
        view.addSubview(errorLabel)
        view.addSubview(infoLabel)
        view.addSubview(pigImageTransferFail)
        view.addSubview(backButton)
        
        
    }
    //MARK: - Constraints
        func setupConstraints(){
        NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            errorLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 16),
            errorLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -16),
            infoLabel.topAnchor.constraint(equalTo: errorLabel.bottomAnchor,constant: 20),
            infoLabel.leadingAnchor.constraint(equalTo: errorLabel.leadingAnchor),
            infoLabel.trailingAnchor.constraint(equalTo: errorLabel.trailingAnchor),
            backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -40),
            backButton.trailingAnchor.constraint(equalTo: errorLabel.trailingAnchor),
            backButton.leadingAnchor.constraint(equalTo: errorLabel.leadingAnchor),
            pigImageTransferFail.bottomAnchor.constraint(equalTo: backButton.topAnchor,constant: -40),
            pigImageTransferFail.leadingAnchor.constraint(equalTo: backButton.leadingAnchor),
            pigImageTransferFail.trailingAnchor.constraint(equalTo: backButton.trailingAnchor)
            
        ])
    }
   
}


