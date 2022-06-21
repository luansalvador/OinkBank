//
//  EditDataFooterView.swift
//  CRUD MVVM
//
//  Created by user210203 on 5/4/22.
//

import UIKit

class EditDataFooterView: UIView {
    weak var viewModel: EditDataViewModel?
    
    static let height: CGFloat = 100
    
    // MARK: - UIElements
    private lazy var confirmEditButton: UIButton = {
       let view = UIButton()
        view.setTitle("Confirmar edição", for: .normal)
        view.backgroundColor = .MyTheme.mainBlueColor
        view.tintColor = .MyTheme.backgroundColor
        view.titleLabel?.font = .MyTheme.defaultText
        view.addTarget(self, action: #selector(performEdit), for: .touchUpInside)
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var deleteRegisterButton: UIButton = {
       let view = UIButton()
        view.setTitle("Excluir", for: .normal)
        view.backgroundColor = .MyTheme.backgroundColor
        view.titleLabel?.font = .MyTheme.defaultText
        view.setTitleColor(UIColor.MyTheme.deleteTextColor, for: .normal)
        view.addTarget(self, action: #selector(performDeleteRegister), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Init
    init(){
        super.init(frame: .zero)
        self.setupView()
        self.setupLayoutConstraints()
        self.backgroundColor = .MyTheme.backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    func setupView(){
        self.addSubview(confirmEditButton)
        self.addSubview(deleteRegisterButton)
    }
    
    func setupLayoutConstraints(){
        NSLayoutConstraint.activate([
            confirmEditButton.topAnchor.constraint(equalTo: self.topAnchor, constant:  15),
            confirmEditButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            confirmEditButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            deleteRegisterButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            deleteRegisterButton.topAnchor.constraint(equalTo: confirmEditButton.bottomAnchor, constant: 10)
        ])
    }
    
    //MARK: - Perform
    @objc func performEdit(){
        viewModel?.updateClient()
    }
    
    @objc func performDeleteRegister() {
        viewModel?.displayAlertWithAction(title: "Deletar", message: "Você está prestes a deletar um cadastro, Tem certeza?")
    }
    
}
