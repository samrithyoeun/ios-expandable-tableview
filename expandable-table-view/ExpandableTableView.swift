//
//  ExpandableTableView.swift
//  expandable-table-view
//
//  Created by Yoeun Samrith on 6/15/20.
//  Copyright © 2020 Yoeun Samrith. All rights reserved.
//

import UIKit

class ExpandableTableView: UITableView {
    
    var selectedRow: Int?
    var data = ["Testing 1", "testing 2", "testing 3", "testing 4"]
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTableView()
    }
    
    func setupTableView() {
        delegate = self
        dataSource = self
        
        separatorStyle = .none
        
        register(UINib(nibName: "ExpandableTableViewCell", bundle: nil), forCellReuseIdentifier: "ExpandableTableViewCell")
        register(UINib(nibName: "ExpanableMenuTableViewCell", bundle: nil), forCellReuseIdentifier: "ExpanableMenuTableViewCell")
    }
    
}

extension ExpandableTableView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected row --- \(selectedRow)")
//        if let selectedRow = selectedRow {
//
//            performBatchUpdates({
//                tableView.moveRow(at: IndexPath.init(row: selectedRow + 1, section: indexPath.section),
//                                  to: IndexPath.init(row: indexPath.row, section: indexPath.section))
//            }, completion: {bool in
//                self.selectedRow = indexPath.row
//            })
//
//
//        } else {
//            selectedRow = indexPath.row
//            print("indexPath.row  --- \(indexPath.row) -- data source \(dataSource.debugDescription)")
//            data.insert(data[indexPath.row], at: indexPath.row)
//            let newIndexPath = IndexPath.init(row: indexPath.row + 1, section: indexPath.section)
//            tableView.insertRows(at: [newIndexPath], with: .automatic)
//
//        }
        tableView.performBatchUpdates(nil, completion: nil)
    }
    
   

}

extension ExpandableTableView: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("---- reloaded \(indexPath)")
        if let selectedRow = selectedRow, indexPath.row == selectedRow + 1  {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExpanableMenuTableViewCell", for: indexPath) as! ExpanableMenuTableViewCell
            return cell

        }

        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpandableTableViewCell", for: indexPath) as! ExpandableTableViewCell
        cell.bind(data[indexPath.row])
        return cell
        
    }
    
}
