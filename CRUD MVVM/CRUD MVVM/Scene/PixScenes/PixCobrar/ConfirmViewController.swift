//
//  confirmViewController.swift
//  CRUD MVVM
//
//  Created by user220270 on 5/27/22.
//

import UIKit

class ConfirmViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        title = "Código de cobrança"
    }
    
    private lazy var firstLabel: UILabel = {
        let view = UILabel()
        view.text = "Esse é seu pix copia e cola"
        view.font = .MyTheme.boldTitleText
        view.textColor = .MyTheme.defaultTextColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var confirmLabel: UILabel = {
        let view = UILabel()
        view.text = PixChargeViewModel.copyPasteKey
        view.font = .MyTheme.defaultText
        view.textColor = .MyTheme.defaultTextColor
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var qrCodeImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .MyTheme.mainBlueColor
        view.layer.cornerRadius = 20
        view.tintColor = .MyTheme.whiteTextColor
        let image = UIImage(named:  "ic_qrcode")
        view.image = image
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var button: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("CONFIRMAR", for: .normal)
        view.backgroundColor = .MyTheme.mainBlueColor
        view.setTitleColor(UIColor.MyTheme.whiteTextColor, for: .normal)
        view.layer.cornerRadius = 9
        view.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var copyButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage.init(named: "ic_copiaecola"), for: .normal)
        view.tintColor = .MyTheme.mainBlueColor
        view.addTarget(self, action: #selector(copyValue), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupView()
        setupConstraints()
    }
    
    @objc private func continueButtonTapped() {
        performGoToConfirm()
    }
    
    @objc private func notValueButtonTapped() {
        print("not value tapped")
    }
    
    @objc private func copyValue() {
        UIPasteboard.general.string = confirmLabel.text
    }
    
    private func setupView() {
        view.addSubview(firstLabel)
        view.addSubview(confirmLabel)
        view.addSubview(button)
        view.addSubview(copyButton)
        view.addSubview(qrCodeImageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.firstLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            self.firstLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            self.firstLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            qrCodeImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            qrCodeImageView.topAnchor.constraint(equalTo: confirmLabel.bottomAnchor, constant: 20),
            qrCodeImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            qrCodeImageView.heightAnchor.constraint(equalTo: qrCodeImageView.widthAnchor),
            
            self.confirmLabel.topAnchor.constraint(equalTo: self.firstLabel.bottomAnchor, constant: 20),
            self.confirmLabel.leadingAnchor.constraint(equalTo: self.firstLabel.leadingAnchor),
            self.confirmLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            self.copyButton.leadingAnchor.constraint(equalTo: self.confirmLabel.trailingAnchor, constant: 8),
            self.copyButton.bottomAnchor.constraint(equalTo: self.confirmLabel.bottomAnchor),
            
            self.button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            self.button.leadingAnchor.constraint(equalTo: self.firstLabel.leadingAnchor),
            self.button.trailingAnchor.constraint(equalTo: self.firstLabel.trailingAnchor),
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func performGoToConfirm() {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
        self.navigationController!.popToViewController(viewControllers[viewControllers.count - 3], animated: true)
//        let homePixViewController = HomePixViewController()
//        self.navigationController?.pushViewController(homePixViewController, animated: true)
    }
    
    public func configLabel(text: String) {
        self.confirmLabel.text = text
    }
    
}





