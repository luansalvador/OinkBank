import UIKit 

class Error404ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func configureView() {
        let error404View = Error404View()
        self.view = error404View
        error404View.tryAgainAction = executeTryAgain
    }
    
    private func executeTryAgain() {
        print("Clicou no botao")
    }
}
