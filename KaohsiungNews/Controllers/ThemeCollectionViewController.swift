//
//  KeyWordCollectionViewController.swift
//  KaohsiungNews
//
//  Created by ChaoBo-Shang on 2022/10/13.
//

import UIKit

private let reuseIdentifier = "Cell"

class ThemeCollectionViewController: UICollectionViewController {

    private var themeListVM: ThemeListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setup()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        

        // Do any additional setup after loading the view.
    }
    
    private func setup() {
        let url = Bundle.main.url(forResource: "Themes", withExtension: "plist")!
                
        if let data = try? Data(contentsOf: url) {
            do {
                let themes = try PropertyListDecoder().decode([Theme].self, from: data)
                self.themeListVM = ThemeListViewModel(themes)
                self.collectionView.reloadData()
            } catch {
                print(error)
            }
        }
    }
    
    private func initUI() {
        let itemSize = UIScreen.main.bounds.width/2 - 10
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.estimatedItemSize = .zero
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        self.collectionView.collectionViewLayout = layout
        // Register cell classes
        self.collectionView!.register(ThemeCollectionViewCell.self, forCellWithReuseIdentifier: "ThemeCollectionViewCell")
        self.collectionView.backgroundColor = .black
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.themeListVM == nil ? 0 : self.themeListVM.numberOfSection
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.themeListVM.numberOfRowInSection(section)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThemeCollectionViewCell", for: indexPath) as! ThemeCollectionViewCell
        // Configure the cell
        //cell.config
        let themeVM = self.themeListVM.themeAtIndex(indexPath.row)
        cell.config(with: themeVM)
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let themeVM = self.themeListVM.themeAtIndex(indexPath.row)
        print(themeVM.url!)
        
        self.performSegue(withIdentifier: "NewsListTableViewController", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NewsListTableViewController"{
            let indexPath = sender as? NSIndexPath
            let themeVM = self.themeListVM.themeAtIndex(indexPath!.row)
            print(themeVM.url!)
            guard let navC = segue.destination as? UINavigationController, let controller = navC.viewControllers.first as? NewsListTableViewController else { return }
            controller.setTheme(themeVM)
        }
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
