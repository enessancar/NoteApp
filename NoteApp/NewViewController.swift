
import UIKit

class NewViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textField: UITextField!
    
    public var completion : ((String , String) -> Void)?
            
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
        
        // Do any additional setup after loading the view.
    }
    

    @objc func didTapSave(){
        
        if let title = textField.text , !title.isEmpty , !textView.text.isEmpty {
            
            completion?(title, textView.text)
}
   
    }
    
}
