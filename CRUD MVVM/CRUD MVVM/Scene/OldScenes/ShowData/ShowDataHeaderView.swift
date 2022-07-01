import Foundation
import UIKit

class ShowDataHeaderView: UIView {
    static let height: CGFloat = 40
    
    //MARK: - UIElements
    lazy var searchBar: UISearchBar = {
        let view = UISearchBar()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var cpfLabel: UILabel = {
        let view = UILabel()
        view.text = "CPF"
        view.textColor = .systemPink
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.text = "Nome"
        view.textColor = .systemPink
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(){
        super.init(frame: .zero)
        setupView()
        setupLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        self.backgroundColor = .systemBackground
        self.addSubview(cpfLabel)
        self.addSubview(nameLabel)
    }
    
    private func setupLayoutConstraints(){
        NSLayoutConstraint.activate([
            
            cpfLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            cpfLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            
            nameLabel.topAnchor.constraint(equalTo: cpfLabel.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
}
