import UIKit

class CopyAndPastViewController: UIViewController {
    
    let copyAndPastView = CopyAndPasteView()
    let pixCopyAndPastViewModel = PixCopyAndPasteViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "copyAndPaste".localized(tableName: "CopyAndPasteLocalizable")
        setupView()
    }
    
    private func setupView() {
        self.view = copyAndPastView
        copyAndPastView.continueAction = clickedContinue
        copyAndPastView.deleteAction = clickedDelete
    }
    
    private func clickedContinue() {
        let CopyAndPastConfirm = CopyAndPasteConfirmViewController()
        pixCopyAndPastViewModel.verifyValuesFromCopyPastePix(copyPastePix: copyAndPastView.getText())
        
        self.navigationController?.pushViewController(CopyAndPastConfirm, animated: true)
    }
    
    private func clickedDelete() {
        copyAndPastView.configureTextField(text: "")
    }
}
