//
//  ViewController.swift
//  UITableView
//
//  Created by Sarath P on 22/10/21.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var contacts = [
                "Ajo",
                "Alen",
                "Arshad",
                "Favas",
                "Harley",
                "Jithu",
                "Junaid",
                "Junais",
                "Mubashir",
                "Nasaf",
                "Nihal",
                "Nijin",
                "Sanath",
                "Shabith",
                "Shyamjith",
                "Sinan",
                "Sooraj",
                "Sreerag",
                "Sarath"
    ]
    
    var number = [
        "+91 7558 042 864",
        "+91 9496 250 520",
        "+91 9774 531 501",
        "+91 3784 367 434",
        "+91 9893 929 733",
        "+91 9328 903 939",
        "+91 9308 439 093",
        "+91 9034 903 929",
        "+91 9034 903 929",
        "+91 9034 903 929",
        "+91 9034 903 929",
        "+91 9034 903 929",
        "+91 9774 531 501",
        "+91 9774 531 501",
        "+91 9774 531 501",
        "+91 9774 531 501",
        "+91 9774 531 501",
        "+91 9774 531 501",
        "+91 9774 531 501"
    ]
    override func viewDidLoad() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        
        //        Ask for permission
        
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { granted, error in
        }
        
        //        Content for Notification
        let content = UNMutableNotificationContent()
        content.title = "Notification"
        content.body = "This is a random notification by this app :)"
        
        
        //    triggering notification
        
        let date = Date().addingTimeInterval(5)
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        
        //        create request'
        let uuIdString = UUID().uuidString
        let request = UNNotificationRequest (identifier: uuIdString, content: content, trigger: trigger)
        
        
        //        add request
        center.add(request) { Error in}
    }
    
    
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row]
        
        return cell
    }
    
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Selected \(contacts[indexPath.row])")
        let viewC = storyboard?.instantiateViewController(withIdentifier: "InsideViewController") as? InsideViewController
        
        viewC?.name = contacts[indexPath.row]
        viewC?.phoneNum = number[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(viewC!, animated: true)
    }
}

