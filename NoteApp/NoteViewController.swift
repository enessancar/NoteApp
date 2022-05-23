
import UIKit

class NoteViewController: UIViewController {

    @IBOutlet weak var textViewSubtitle: UITextView!
    @IBOutlet weak var labelTitle: UILabel!
    
    public var noteTitle = String ()
    public var note = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelTitle.text = noteTitle
        textViewSubtitle.text = note
        
    }
    
    

   

}
