import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
  
    @IBOutlet weak var myTableView: UITableView!
    
    var models : [(title : String , note : String)] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let row = models[indexPath.row]
        cell.textLabel?.text = row.title
        cell.detailTextLabel?.text = row.note
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model1 = models[indexPath.row]
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "NoteViewController") as? NoteViewController else {return}
        
        vc.title = "Note"
        vc.noteTitle = model1.title
        vc.note = model1.note
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func btnAdd(_ sender: Any) {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "NewViewController") as? NewViewController else { return }
        
        vc.title = "New Note"
        
        vc.completion = {
            noteTitle ,  note  in
            self.navigationController?.popViewController(animated: true)
            self.models.append ((title : noteTitle , note : note))
            self.myTableView.reloadData()
        }
        
        navigationController?.pushViewController(vc , animated: true)
        
    }
    
}

extension ViewController {
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: UIContextualAction.Style.destructive, title: nil ){
            (action , sourceView , completionHandler) in
            
            self.models.remove(at: indexPath.row)
            self.myTableView.reloadData()
            completionHandler(true)
        }
        delete.image = UIImage(systemName: "trash")
        delete.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [delete])
    }
}

