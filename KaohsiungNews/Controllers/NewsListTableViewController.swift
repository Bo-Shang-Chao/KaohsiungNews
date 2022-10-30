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
    
    func setTheme(_ themeVM: ThemeViewModel) {
        self.title = themeVM.title
        guard let resource = themeVM.resource else {
            fatalError("Resource is incorrect!")
        }
        self.loadNewsData(newsResource: resource)
    }
    
    func loadNewsData(newsResource: Resource<ArticleList>) {
        Webservice().load(resource: newsResource) { [weak self] result in
            
            switch result {
            case .success(let articleList):
                self?.articleListVM = ArticleListViewModel(articleList.articles)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func setup() {
        
    }
    
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
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
