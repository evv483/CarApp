//
//  BrandsTableViewController.swift
//  CarApp
//
//  Created by Владимир Ефимов on 10.03.2021.
//

import UIKit
import CoreData

class BrandsTableViewController: UITableViewController, UISearchBarDelegate  {
    
    @IBOutlet weak var brandsTableView: UITableView!
    
    var brands: [Brand] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchBarSetup()
        
        if UserDefaults.standard.bool(forKey: "CoreDataBackUp") == false {
            restoreFromCoreDataBackUp(backUpName: "CarApp")
            UserDefaults.standard.setValue(true, forKey: "CoreDataBackUp")
        } else {
            print("restoreFromCoreDataBackUp true")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reloadTableViewData()
    }
    
    func searchBarSetup() {
        let controller = UISearchController(searchResultsController: nil)
        controller.obscuresBackgroundDuringPresentation = false
        controller.searchBar.delegate = self
        controller.searchBar.placeholder = "Поиск по маркам"
        controller.searchBar.showsCancelButton = false
        controller.hidesNavigationBarDuringPresentation = false
        navigationItem.searchController = controller
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            var predicate: NSPredicate = NSPredicate()
            predicate = NSPredicate(format: "brandName contains[c] '\(searchText)'")
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            let managedObjectContext = appDelegate.persistentContainer.viewContext
            let fetchRequest: NSFetchRequest<Brand> = Brand.fetchRequest()
            fetchRequest.predicate = predicate
            do {
                brands = try managedObjectContext.fetch(fetchRequest)
            } catch let error as NSError {
                print("Could not fetch. \(error)")
            }
        } else {
            reloadTableViewData()
        }
        brandsTableView.reloadData()
    }
    
    func reloadTableViewData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Brand> = Brand.fetchRequest()
        do {
            brands = try managedContext.fetch(fetchRequest)
            brandsTableView.reloadData()
        } catch {
            print("Could not fetch")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? ModelsTableViewController, let selectedRow = self.brandsTableView.indexPathForSelectedRow?.row else {
                return
        }
        destination.brand = brands[selectedRow]
    }
    
    func restoreFromCoreDataBackUp(backUpName: String){
        let storeFolderUrl = FileManager.default.urls(for: .applicationSupportDirectory, in:.userDomainMask).first!
        let storeUrl = storeFolderUrl.appendingPathComponent("CarApp.sqlite")
        let backupUrl = Bundle.main.url(forResource: "CarApp", withExtension: "sqlite")!
        let container = NSPersistentContainer(name: "CarApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            do{
                try container.persistentStoreCoordinator.replacePersistentStore(at: storeUrl,destinationOptions: nil,withPersistentStoreFrom: backupUrl,sourceOptions: nil,ofType: NSSQLiteStoreType)
            } catch {
                print("Failed to BackUp")
            }
        })
    }
    
    func deleteBrand(at indexPath: IndexPath) {
        let brandForDelete = brands[indexPath.row]
        guard let managedContext = brandForDelete.managedObjectContext else {
            return
        }
        managedContext.delete(brandForDelete)
        
        do {
            try managedContext.save()
            brands.remove(at: indexPath.row)
            brandsTableView.deleteRows(at: [indexPath], with: .automatic)
        } catch {
            print("Could not delete")
            brandsTableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return brands.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "brandCell", for: indexPath) as! BrandsCellTableViewCell
        let brand = brands[indexPath.row]
        
//        cell.brandLogo.image = UIImage(named: brand.brandName ?? "NoLogo")
//      почему то этот метод не подставляет дефолтную картинку при отсутствии основной, поэтому придумал следующий способ        
        
        if UIImage(named: brand.brandName!) != nil {
            cell.brandLogo.image = UIImage(named: brand.brandName!)
        } else {
            cell.brandLogo.image = UIImage(named: "NoLogo")
        }
        
        if brand.brandName == "" {
            cell.brandNameLabel.text = "нет данных"
        } else {
            cell.brandNameLabel.text = brand.brandName
        }
        
        if brand.brandYear == 0 {
            cell.brandYearLabel.text = "нет данных"
        } else {
            cell.brandYearLabel.text = String(brand.brandYear)
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteBrand(at: indexPath)
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
