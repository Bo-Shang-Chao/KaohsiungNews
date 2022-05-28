//
//  NewsListTableViewController.swift
//  KaohsiungNews
//
//  Created by ChaoBo-Shang on 2022/5/8.
//

import Foundation
import UIKit

class NewsListTableViewController : UITableViewController {
    
    private var articleListVM: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.backgroundColor = .gray
        let url = URL(string: "https://newsapi.org/v2/everything?q=%E9%AB%98%E9%9B%84&language=zh&sortBy=publishedAt&apiKey=d35766c79dc843c3b5f711250ce0a5c9")!
        Webservice().getArticles(url: url) { articles in
            if let articles = articles {
                self.articleListVM = ArticleListViewModel(articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSection
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        cell.config(with: articleVM)
        
        return cell
    }
    
}
