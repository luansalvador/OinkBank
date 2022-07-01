import UIKit

class ChargeViewController: UIViewController {
    
    let cobrarViewModel: PixChargeViewModel = PixChargeViewModel()
    let confirmViewController = ConfirmViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .MyTheme.backgroundColor
        
        title = "charge".chargePixLocalized()
        
    }
    
    private lazy var label: UILabel = {
        let view = UILabel()
        view.text = "writeValue".chargePixLocalized()
        view.numberOfLines = 0
        view.font = .MyTheme.boldTitleText
        view.textColor = .MyTheme.defaultTextColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var textField: UITextField = {
        let view = UITextField()
        view.placeholder = "cifrao".chargePixLocalized()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(myTextFieldDidChange), for: .editingChanged)
        return view
    }()
    
    private lazy var notValuebutton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("doNotSpecifyValue".chargePixLocalized(), for: .normal)
        view.backgroundColor = .MyTheme.backgroundColor
        view.setTitleColor(UIColor.MyTheme.blueColor, for: .normal)
        view.addTarget(self, action: #selector(notValueButtonTapped), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var button: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("confirm".chargePixLocalized(), for: .normal)
        view.titleLabel?.font = UIFont.MyTheme.defaultText
        view.setTitleColor(UIColor.MyTheme.blackColor, for: .normal)
        view.backgroundColor = UIColor.MyTheme.greenColor
        view.layer.cornerRadius = 5
        view.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupView()
        setupConstraints()
    }
    
    @objc private func continueButtonTapped() {
        
        if (textField.text == "")  {
            let alert = UIAlertController(title:"Campo valor não preenchido", message: "Caso não deseja colocar valor, ir no Não especificar valor", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true, completion: nil)
        }else{
            
            PixChargeViewModel.copyPasteKey = cobrarViewModel.generateCopyPaste(value: self.textField.text ?? "", clientCPF: clients[loginIndex].cpf)
            confirmViewController.configLabel(text: PixChargeViewModel.copyPasteKey)
            performGoToConfirm()
        }
    }
    
    @objc private func notValueButtonTapped() {
        textField.text = "0,00"
    }
    
    private func setupView() {
        view.addSubview(label)
        view.addSubview(textField)
        view.addSubview(button)
        view.addSubview(notValuebutton)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            self.label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            self.label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            self.textField.topAnchor.constraint(equalTo: self.label.bottomAnchor, constant: 16),
            self.textField.leadingAnchor.constraint(equalTo: self.label.leadingAnchor),
            self.textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            self.notValuebutton.bottomAnchor.constraint(equalTo: self.textField.bottomAnchor, constant: 50),
            self.notValuebutton.leadingAnchor.constraint(equalTo: self.label.leadingAnchor),
            self.notValuebutton.trailingAnchor.constraint(equalTo: self.label.trailingAnchor),
            
            self.button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func performGoToConfirm() {
        let confirmViewController = ConfirmViewController()
        self.navigationController?.pushViewController(confirmViewController, animated: true)
    }
    
    //MARK: - MoneyMask
    @objc func myTextFieldDidChange(_ textField: UITextField) {
        
        if let amountString = textField.text?.currencyInputFormatting() {
            textField.text = amountString
        }
    }
}

extension String {
    
    func chargePixLocalized() -> String {
        return NSLocalizedString(self,
                                 tableName: "ChargePixLocalizable",
                                 bundle: .main,
                                 value: self,
                                 comment: self)
    }
}






