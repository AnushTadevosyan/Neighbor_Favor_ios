//
//  DashboardViewController.swift
//  NF
//
//  Created by Anush Tadevosyan on 1/12/22.
//

import UIKit

class DashboardViewController: UIViewController {

    var resultSearchController = UISearchController()
    @IBOutlet weak var favorTable: UITableView!
    
    var fetchedFavor = [favorModel]()
    var filteredTableData = [favorModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchFavors()
        favorTable.delegate = self
        favorTable.dataSource = self
        
        resultSearchController = ({
                let controller = UISearchController(searchResultsController: nil)
                controller.searchResultsUpdater = self
                controller.dimsBackgroundDuringPresentation = false
                controller.searchBar.sizeToFit()

                favorTable.tableHeaderView = controller.searchBar

                return controller
            })()

            // Reload the table
            favorTable.reloadData()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.favorTable.register(FavorTableViewCell.self, forCellReuseIdentifier: "favorcell")
    }
    
    
    func fetchFavors(){
        
            fetchedFavor = []
            let urll = get_all_pending_favors_url
            var request = URLRequest(url: URL(string: urll)!)
            request.httpMethod = "GET"
        
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if (error != nil) {
                print("Error")
            }
            else{
                do {
                    let fetchedData = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! NSArray
                    
                    for eachFetchedFavor in fetchedData{
                        
                        let eachFavor = eachFetchedFavor as! [String: Any]
                        let favorid = eachFavor["favorid"] as? Int
                        let favortitle=eachFavor["favortitle"] as? String
                        let favordetail = eachFavor["favordetail"] as? String
                        let favorlistedby = eachFavor["favorlistedby"] as? Int
                        let favorlistedphone = eachFavor["favorlistedphone"] as? String
                        let favoriscompleted = eachFavor["favoriscompleted"] as? Bool
                        let favorcompletedby = eachFavor["favorcompletedby"] as? String
                        
                        self.fetchedFavor.append(favorModel(favorid: favorid, favortitle: favortitle, favordetail: favordetail, favorlistedby: favorlistedby, favorlistedphone: favorlistedphone, favoriscompleted: favoriscompleted, favorcompletedby: favorcompletedby))
                        //MARK: - WHY DOES THIS APPEND WORK HERE?
                    }
                    self.favorTable.reloadData()
                   
                }
                catch{
                    print("error 2")
                }
            }
        }
        
        task.resume()
    }

}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating{
    
    private func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
   {
       return 100.0;//Your custom row height
   }
    
    func updateSearchResults(for searchController: UISearchController) {
        filteredTableData.removeAll(keepingCapacity: false)

           let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
           let array = (fetchedFavor as NSArray).filtered(using: searchPredicate)
           filteredTableData = array as! [favorModel]

           self.favorTable.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  (resultSearchController.isActive) {
              return filteredTableData.count
          } else {
              return fetchedFavor.count
          }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favorcell", for: indexPath) as! FavorTableViewCell

          if (resultSearchController.isActive) {
              cell.favorTitleLbl?.text = filteredTableData[indexPath.row].favortitle
              cell.favorDetail?.text = filteredTableData[indexPath.row].favordetail
              cell.phoneNumLbl?.text = filteredTableData[indexPath.row].favorlistedphone

              return cell
          }
          else {
              cell.favorTitleLbl?.text = fetchedFavor[indexPath.row].favortitle
              cell.favorDetail?.text = fetchedFavor[indexPath.row].favordetail
              cell.phoneNumLbl?.text = fetchedFavor[indexPath.row].favorlistedphone

              return cell
          }
   
    }
    
    
     func numberOfSections(in tableView: UITableView) -> Int {
      // 1
      // return the number of sections
      return 1
   }
    
}
