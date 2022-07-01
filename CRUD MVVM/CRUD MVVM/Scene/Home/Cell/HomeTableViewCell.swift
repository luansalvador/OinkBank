import Foundation
import UIKit

final class HomeTableViewCell: UITableViewCell {
    // MARK: cellID
    static let reuseId: String = "HomeTableViewCell"
    
    
    // MARK: - UI elements
    
    private lazy var logoImageView: UIImageView = {
        let view = UIImageView()
        view.tintColor = UIColor.MyTheme.blueColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var optionLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 1
        view.font = UIFont.MyTheme.defaultText
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var arrowLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor.MyTheme.blueColor
        view.text = ">"
        view.font = UIFont.MyTheme.defaultText
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    // MARK: = Cell lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
        contentView.backgroundColor = .MyTheme.backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Functions
    func setupView(imageTitle: String, optionTitle: String){
        logoImageView.image = UIImage(named: imageTitle)
        optionLabel.text = optionTitle
    }
    
    // MARK: -Constraints and subviews
    private func setupConstraints(){
        contentView.addSubview(logoImageView)
        contentView.addSubview(optionLabel)
        contentView.addSubview(arrowLabel)
        
        NSLayoutConstraint.activate([
            logoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            logoImageView.centerXAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
            logoImageView.widthAnchor.constraint(equalToConstant: 33),
            logoImageView.heightAnchor.constraint(equalToConstant: 33),
            
            optionLabel.centerYAnchor.constraint(equalTo: logoImageView.centerYAnchor),
            optionLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 40),
            
            arrowLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            arrowLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
}
