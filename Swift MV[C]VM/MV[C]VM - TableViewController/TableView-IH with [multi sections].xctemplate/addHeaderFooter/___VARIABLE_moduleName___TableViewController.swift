//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources

class ___VARIABLE_moduleName___TableViewController: UITableViewController {

    // MARK: - let constants

    let disposeBag = DisposeBag()

    // The viewmodel must be let!
    // To prevent memory leaks change the model inside the viewmodel instead of changing the viewmodel object.
    let viewModel = ___VARIABLE_moduleName___ViewModel()

    // MARK: - var variables

    lazy var dataSource = RxTableViewSectionedReloadDataSource<TableViewSection>(configureCell: { [weak self] dataSource, tableView, indexPath, item in
        return (self?.bindCell(tableView, item))!
    })

    // MARK: - Interface Builder Outlets

    // MARK: - ViewController Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = nil
        /*
        // Uncomment if the cells are self-sizing
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        */

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

        // MARK: - Section Header and Footer Binding

        dataSource.titleForHeaderInSection = { dataSource, index in
            return dataSource.sectionModels[index].header?.title
        }

        dataSource.titleForFooterInSection = { dataSource, index in
            return dataSource.sectionModels[index].footer?.title
        }

        // MARK: - Section Binding

        viewModel.sections.asObservable()
            .bind(to: tableView.rx.items(dataSource: dataSource))
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

    func bindCell(_ tableView: UITableView, _ item: Bindable) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(type(of: item))Cell")
        if let bindableCell = cell as? ReactiveBindable {
            bindableCell.bind(to: item)
        }
        return cell!
    }

}

// MARK: - TableView Delegate Methods

extension ___VARIABLE_moduleName___TableViewController {

    /*
    // Uncomment in case of use custom section header

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let item = dataSource[section].header else {
            return nil
        }
        return bindCell(tableView, item)
    }
    */

    /*
    // Uncomment in case of use custom section footer

    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let item = dataSource[section].footer else {
            return nil
        }
        return bindCell(tableView, item)
    }
    */
}

// MARK: - Interface Builder Actions

extension ___VARIABLE_moduleName___TableViewController {

}

// MARK: - Notification handlers can be placed here

extension ___VARIABLE_moduleName___TableViewController {

}
