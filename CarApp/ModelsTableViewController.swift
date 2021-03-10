//
//  ModelsTableViewController.swift
//  CarApp
//
//  Created by Владимир Ефимов on 10.03.2021.
//

import UIKit
import CoreData

class ModelsTableViewController: UITableViewController {
    
    @IBOutlet weak var modelsTableView: UITableView!
    
    var brand: Brand?
    var brands: [Brand] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.modelsTableView.reloadData()
    }
    
    func reloadTableViewData() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Brand> = Brand.fetchRequest()
        do {
            brands = try managedContext.fetch(fetchRequest)
            modelsTableView.reloadData()
        } catch {
            print("Could not fetch")
        }
    }
    
    @IBAction func addNewModel(_ sender: Any) {
        performSegue(withIdentifier: "showModel", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? NewModelViewController else {
            return
        }
        destination.brand = brand
    }
    
    func deleteModel(at indexPath: IndexPath) {
        guard let modelForDelete = brand?.models?[indexPath.row],
              let managedContext = modelForDelete.managedObjectContext else {
            return
        }
        managedContext.delete(modelForDelete)
        
        do {
            try managedContext.save()
            modelsTableView.deleteRows(at: [indexPath], with: .automatic)
        } catch  {
            print("Could not delete")
            modelsTableView.reloadRows(at: [indexPath], with: .automatic)
        }        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return brand?.models?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = modelsTableView.dequeueReusableCell(withIdentifier: "modelCell", for: indexPath) as! ModelsCellTableViewCell
      let model = brand?.models?[indexPath.row]
        
        if UIImage(named: (model?.modelName)!) != nil {
            cell.modelLogo.image = UIImage(named: (model?.modelName)!)
        } else {
            cell.modelLogo.image = UIImage(named: "NoLogo")
        }
        
        cell.modelLogo.layer.cornerRadius = 6
        cell.modelLogo.layer.masksToBounds = true
                
        if model?.modelName == "" {
            cell.modelNameLabel.text = "нет данных"
        } else {
            cell.modelNameLabel.text = model?.modelName
        }
        
        if model?.modelYear == 0 {
            cell.modelYearLabel.text = "нет данных"
        } else {
            cell.modelYearLabel.text = String((model?.modelYear)!)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewControllerMain") as! DetailViewControllerMain
        let model2 = brand?.models?[indexPath.row]
        
        if brand?.brandName == "" || brand?.brandName == "n/a" {
            vc.brandName = "нет данных"
        } else {
            vc.brandName = (brand?.brandName)!
        }
        
        vc.detailModelName = model2?.modelName ?? "n/a"
        
        if model2?.modelName == "" || model2?.modelName == "n/a" {
            vc.detailModelName = "нет данных"
        } else {
            vc.detailModelName = (model2?.modelName)!
        }
        
        if model2?.modelYear == 0 {
            vc.detailModelYear = "нет данных"
        } else {
            vc.detailModelYear = String((model2?.modelYear)!)
        }
        
        if model2?.modelColors == "" || model2?.modelColors == "n/a" {
            vc.detailModelColors = "нет данных"
        } else {
            vc.detailModelColors = (model2?.modelColors)!
        }
                
        if model2?.modelEngineType == "" || model2?.modelEngineType == "n/a" {
            vc.detailModelEngineType = "нет данных"
        } else {
            vc.detailModelEngineType = (model2?.modelEngineType)!
        }
        
        if model2?.modelEnginePower == 0.0 {
            vc.detailModelEnginePower = "нет данных"
        } else {
            vc.detailModelEnginePower = String((model2?.modelEnginePower)!)
        }
        
        if model2?.modelDriveType == "" || model2?.modelDriveType == "n/a" {
            vc.detailModelDriveType = "нет данных"
        } else {
            vc.detailModelDriveType = (model2?.modelDriveType)!
        }
               
        if model2?.modelGear == "" || model2?.modelGear == "n/a" {
            vc.detailModelGear = "нет данных"
        } else {
            vc.detailModelGear = (model2?.modelGear)!
        }
        
        if model2?.modelDetailInfo == "" || model2?.modelDetailInfo == "n/a" {
            vc.detailModelDetailInfo = "нет данных"
        } else {
            vc.detailModelDetailInfo = (model2?.modelDetailInfo)!
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteModel(at: indexPath)
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
