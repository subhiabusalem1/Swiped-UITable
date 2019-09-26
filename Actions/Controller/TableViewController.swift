
import UIKit

final class Serverstodos {
    let title: String

    var isImportant: Bool
    var isFinished: Bool
    
    init(title: String) {
        self.title = title
        self.isImportant = false
        self.isFinished = false
    }
}

class TableViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    
    @IBOutlet weak var tableview1: UITableView!
    
    var Servers = [Serverstodos]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 1...30 {
            Servers.append(Serverstodos(title: "   MOBILENOC-FW.MOBILENOC.US.CA"))
        }
    }
    
    // Mark: - Table view delegate
    
   func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let Drone = DroneAction (at: indexPath)
        let Router = RouterAction (at: indexPath)
        let Alert = AlertAction (at: indexPath)
        return UISwipeActionsConfiguration (actions: [Drone , Router , Alert ])
    }
    
    // MARK: - Table view data source
    func AlertAction (at IndexPath: IndexPath) -> UIContextualAction {
        
        let activedevices = Servers[IndexPath.row]
        let action = UIContextualAction (style: .normal, title: "Alert")
        { ( action ,View ,Completion ) in activedevices.isImportant = !activedevices.isImportant
            Completion(true)
        }
        
        action.image =  UIImage(named: "Drone")
        action.backgroundColor = .blue
        
        return action
    }
    
    
    func RouterAction (at IndexPath: IndexPath) -> UIContextualAction {
        
        let activedevices = Servers[IndexPath.row]
        let action = UIContextualAction (style: .normal, title: "")
        { ( action ,View ,Completion ) in activedevices.isImportant = !activedevices.isImportant
            Completion(true)
        }
        
         action.image = UIImage(named:"Router")
        action.backgroundColor = .gray
        
        return action
    }
    
    func DroneAction (at IndexPath: IndexPath) -> UIContextualAction {
        
        let activedevices = Servers[IndexPath.row]
        let action = UIContextualAction (style: .normal, title: "Alert")
        { ( action ,View ,Completion ) in activedevices.isImportant = !activedevices.isImportant
            Completion(true)
        }
        
       action.image =  UIImage(named: "Alert")
    action.backgroundColor =  .red
    //This function was working fine before i update my swift to 5.0 try to delete the comment and check if its working in your XCODE
        
        
        
        return action
    }
    
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Servers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActiveCell", for: indexPath)
        
        
        // Configure the cell...
        let activedevices = Servers[indexPath.row]
        cell.textLabel?.text = activedevices.title
        cell.textLabel?.textAlignment = .center
        cell.detailTextLabel?.textAlignment = .center
        cell.detailTextLabel?.text = "     4.71.144.122"
        cell.detailTextLabel?.textColor = .gray
        return cell
    }
}
