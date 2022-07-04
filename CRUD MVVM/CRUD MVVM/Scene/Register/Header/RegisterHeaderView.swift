import UIKit

class RegisterHeaderView: UIView {
    
    static let height: CGFloat = 130
    
    private lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.text = "registerGreeting".localized(tableName: "RegisterLocalizable")
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .MyTheme.boldTitleText
        label.textColor = .MyTheme.defaultTextColor
        return label
    }()

    init(){
        super.init(frame: .zero)
        self.backgroundColor = .MyTheme.backgroundColor
        self.addSubviews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews(){
        self.addSubview(greetingLabel)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            self.greetingLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.greetingLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.greetingLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
    
}
