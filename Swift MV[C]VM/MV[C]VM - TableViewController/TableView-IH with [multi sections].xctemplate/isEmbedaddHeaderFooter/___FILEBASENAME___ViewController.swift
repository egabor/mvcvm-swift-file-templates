//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import UIKit
import RxCocoa
import RxSwift

class ___FILEBASENAMEASIDENTIFIER___ViewController: UIViewController {
    
    // MARK: - let constants
    
    let disposeBag = DisposeBag()
    
    // The viewmodel must be let! To prevent memory leaks change the model inside the viewmodel instead of changing the viewmodel object.
    let viewModel: ___FILEBASENAMEASIDENTIFIER___ViewModel = ___FILEBASENAMEASIDENTIFIER___ViewModel()
    
    // MARK: - var variables
    
    // MARK: - Interface Builder Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - ViewController Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = nil
        
         // Uncomment if the cells are self-sizing
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        
        /*
        // Uncomment in case of use custom section headers or footers
        tableView.sectionHeaderHeight = UITableViewAutomaticDimension
        tableView.estimatedSectionHeaderHeight = 100
        tableView.sectionFooterHeight = UITableViewAutomaticDimension
        tableView.estimatedSectionFooterHeight = 1
        */
        
        setUpBindings()
    }
    
    deinit {
        // Don't forget to remove the observers here
    }
    
    func setUpBindings() {
        
        tableView.rx.setDelegate(self)
            .addDisposableTo(disposeBag)
        
        // MARK: - Cell Binding
    
        viewModel.dataSource.configureCell = { dataSource, tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(type(of: item))Cell") as! ReactiveBindable
            cell.bind(to: item)
            return cell as! UITableViewCell
        }
        
        // MARK: - Section Header and Footer Binding
        
        viewModel.dataSource.titleForHeaderInSection = { ds, index in
            return ds.sectionModels[index].header?.title
        }
        
        viewModel.dataSource.titleForFooterInSection = { ds, index in
            return ds.sectionModels[index].footer?.title
        }
        
        // MARK: - Section Binding
        
        viewModel.sections.asObservable()
            .bind(to: tableView.rx.items(dataSource: viewModel.dataSource))
            .disposed(by: disposeBag)
        
        // MARK: - Selection Handling
        
        tableView.rx
            .modelSelected(Bindable.self)
            .subscribe(onNext: { value in
                print("Tapped `\(value)`")
            })
            .disposed(by: disposeBag)
        
        /*
         tableView.rx
            .itemAccessoryButtonTapped
            .subscribe(onNext: { indexPath in
                print("Tapped Detail @ \(indexPath.section),\(indexPath.row)")
            })
            .disposed(by: disposeBag)
        */
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation
     
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Helper Methods
    
}

// MARK: - TableView Delegate Methods

extension ___FILEBASENAMEASIDENTIFIER___ViewController: UITableViewDelegate {
    
    /*
    // Uncomment in case of use custom section header
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let item = viewModel.dataSource[section].header else {
            return nil
        }
        let header = tableView.dequeueReusableCell(withIdentifier: "\(type(of: item))Cell") as! ReactiveBindable
        header.bind(to: item)
        return header as? UIView
    }
    */
    
    /*
    // Uncomment in case of use custom section footer
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let item = viewModel.dataSource[section].footer else {
            return nil
        }
        let footer = tableView.dequeueReusableCell(withIdentifier: "\(type(of: item))Cell") as! ReactiveBindable
        footer.bind(to: item)
        return footer as? UIView
    }
    */

}

// MARK: - Interface Builder Actions

extension ___FILEBASENAMEASIDENTIFIER___ViewController {
    
}

// MARK: - Notification handlers can be placed here

extension ___FILEBASENAMEASIDENTIFIER___ViewController {
    
}
