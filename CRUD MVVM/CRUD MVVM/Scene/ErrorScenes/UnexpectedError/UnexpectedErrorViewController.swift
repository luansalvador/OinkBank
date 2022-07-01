import Foundation
import UIKit

class UnexpectedErrorViewController: UIViewController {
    
    //MARK: - Labels
    
    lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.numberOfLines = 1
        lb.text = NSLocalizedString("Oooopss...", comment: "")
        lb.font = .MyTheme.boldTitleText
        lb.textColor = .MyTheme.defaultTextColor
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var subtitleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.numberOfLines = 2
        lb.text = NSLocalizedString("Parece que ocorreu um erro inesperado em nosso sistema.", comment: "")
        lb.font = .MyTheme.defaultText
        lb.textColor = .MyTheme.defaultTextColor
        lb.textAlignment = .left
        return lb
    }()
    
    //MARK: - Image
    
    lazy var baconImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "unexpectedErrorImage")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    //MARK: - Button
    
    private lazy var backButton: UIButton = UIButton.defaultButton(title: NSLocalizedString("Voltar", comment: ""), font: UIFont.MyTheme.defaultText, target: self, selector: #selector(back))
    
    //MARK: - Button Action
    
    @objc func back(sender:UIButton){
        print("teste")
    }
    
    //MARK: - viewWillAppear
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK: - loadView
    
    override func loadView() {
        super.loadView()
        addSubviews()
        configConstraints()
    }
    
    //MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
    }
    
    //MARK: - Func addSubviews
    
    private func addSubviews() {
        self.view.addSubview(titleLabel)
        self.view.addSubview(subtitleLabel)
        self.view.addSubview(baconImage)
        self.view.addSubview(backButton)
    }
    
    //MARK: - Constraints
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            
            self.subtitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor),
            self.subtitleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            self.subtitleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            self.baconImage.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 280),
            self.baconImage.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            self.baconImage.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            self.baconImage.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -140),
            
            self.backButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            self.backButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            self.backButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16)
        ])
    }
}
