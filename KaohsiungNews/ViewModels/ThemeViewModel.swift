//
//  ThemeViewModel.swift
//  KaohsiungNews
//
//  Created by ChaoBo-Shang on 2022/10/28.
//

import Foundation

struct ThemeListViewModel {
    private let themes: [Theme]
}

extension ThemeListViewModel {
    init(_ themes: [Theme]) {
        self.themes = themes
    }
}

extension ThemeListViewModel {
    var numberOfSection: Int {
        return 1
    }

    func numberOfRowInSection(_ section: Int) -> Int {
        return self.themes.count
    }

    func themeAtIndex(_ index: Int) -> ThemeViewModel {
        let theme = self.themes[index]
        return ThemeViewModel(theme)
    }
}


struct ThemeViewModel {
    private let theme: Theme
}

extension ThemeViewModel {
    init(_ theme: Theme) {
        self.theme = theme
    }
}

extension ThemeViewModel {
    var title: String {
        return self.theme.title
    }
    
    var url: URL? {
        return self.theme.newsApi.url
    }
    
    var resource: Resource<ArticleList>? {
        return self.theme.apiResource
    }
}
