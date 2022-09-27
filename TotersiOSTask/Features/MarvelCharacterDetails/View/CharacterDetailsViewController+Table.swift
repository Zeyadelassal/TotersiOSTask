//
//  CharacterDetailsViewController+Table.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 26/09/2022.
//

import UIKit

extension CharacterDetailsViewController: UITableViewDelegate {
    func setupTableView() {
        characterDetailsTableView.dataSource = self
        characterDetailsTableView.delegate = self
        characterDetailsTableView.registerCell(CharacterDetailsTableViewCell.self)
        characterDetailsTableView.isScrollEnabled = false
        characterDetailsTableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            sections[indexPath.section].isOpened.toggle()
            guard let cell = tableView.cellForRow(at: indexPath) as? CharacterDetailsTableViewCell else {return}
            tableView.reloadSections([indexPath.section], with: .none)
            
            }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 50
        } else {
            return UITableView.automaticDimension
        }
    }
}

extension CharacterDetailsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sections[section].isOpened {
            return sections[section].items.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CharacterDetailsTableViewCell = tableView.dequeueReusableCell()
        if indexPath.row == 0 {
            cell.setupHeaderCell(title: sections[indexPath.section].title)
        } else {
            let index = indexPath.row - 1
            let title = sections[indexPath.section].items[index].title
            let desc = sections[indexPath.section].items[index].desc
            let thumbnail = sections[indexPath.section].items[index].thumbnail
            let extra = sections[indexPath.section].items[index].extra
            cell.setupCell(title: title, desc: desc, thumbnail: thumbnail, extra: extra)
        }
        return cell
    }
    
    
}
