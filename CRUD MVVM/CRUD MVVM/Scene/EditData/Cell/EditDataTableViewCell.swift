//
//  EditDataTableViewCell.swift
//  CRUD MVVM
//
//  Created by user210203 on 5/3/22.
//

import Foundation
import UIKit

final class EditDataTableViewCell: UITableViewCell {
    //MARK: - cellId
    static let reuseId: String = "EditDataTableViewCell"
    
    //MARK: - UIElements
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.MyTheme.defaultText
        view.numberOfLines = -1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var editTextField: UITextField = {
        let view = UITextField()
        view.textAlignment = .left
        view.borderStyle = .roundedRect
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.rightView = accessoryAlertImageView
        view.rightViewMode = .always
        
        return view
    }()
    
    // MARK: - alert elements
    lazy var accessoryAlertImageView: UIImageView = {
        //added on registertextfield
        let view = UIImageView()
        view.tintColor = .MyTheme.deleteTextColor
        let image = UIImage(named: "registerTextFieldAlertImage")
        //let image = UIImage(systemName: "key")
        view.image = image
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    lazy var tipLabel: UILabel = {
        let view = UILabel()
        view.text = "Aqui está sua dica"
        view.font = .MyTheme.tipText
        view.textColor = .MyTheme.deleteTextColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    //MARK: = Cell lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //constraints
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(titleLableText: String, editTextFieldText: String){
        titleLabel.text = titleLableText
        editTextField.text = editTextFieldText
    }
    
    func setupConstraints(){
        contentView.addSubview(titleLabel)
        contentView.addSubview(editTextField)
        contentView.addSubview(tipLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleLabel.widthAnchor.constraint(equalToConstant: 110),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            editTextField.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10),
            editTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            editTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            editTextField.heightAnchor.constraint(equalToConstant: 30),
            
            tipLabel.widthAnchor.constraint(equalTo: editTextField.widthAnchor),
            tipLabel.centerXAnchor.constraint(equalTo: editTextField.centerXAnchor),
            tipLabel.topAnchor.constraint(equalTo: editTextField.bottomAnchor)
        ])
    }
}
