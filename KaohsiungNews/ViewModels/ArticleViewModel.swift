//
//  ArticleViewModel.swift
//  KaohsiungNews
//
//  Created by ChaoBo-Shang on 2022/5/8.
//

import Foundation
import UIKit

struct ArticleListViewModel {
    private let articles: [Article]
}

extension ArticleListViewModel {
    init(_ articles: [Article]){
        self.articles = articles
    }
}

extension ArticleListViewModel {
    var numberOfSection: Int {
        return 1
    }
    
    func numberOfRowInSection(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
}

struct ArticleViewModel {
    private let article: Article
}

extension ArticleViewModel {
    init(_ article: Article){
        self.article = article
    }
}

extension ArticleViewModel {
    var title: String {
        return self.article.title!
    }
    
    var description: String {
        return self.article.description!
    }
    
    /// Set Image from URL
    /// - Parameter completion: UIImage Type
    func image(completion: @escaping (UIImage?) -> Void) {
        
        guard let imageURL = article.urlToImage else {
            completion(UIImage.imageForPlaceHolder())
            return
        }
        
        UIImage.image(url: imageURL) { image in
            DispatchQueue.main.async {
                completion(image)
            }
        }
    }
}
