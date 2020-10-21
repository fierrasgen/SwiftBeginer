//
//  NewsViewLayout.swift
//  Social App
//
//  Created by Alexander Novikov on 21.10.2020.
//

import UIKit

class NewsViewLayout: UICollectionViewLayout {
    
    var cacheAtrributes = [IndexPath: UICollectionViewLayoutAttributes]()
    
    var collumnsCount = 2
    
    var totalCellHeight: CGFloat = 0
    
    
    override func prepare() {
        self.cacheAtrributes = [:]
        
        guard let collectionView = self.collectionView else { return }
        
        let itemCount = collectionView.numberOfItems(inSection: 0)
        
        guard itemCount > 0 else { return }
        
        let cellSize = (collectionView.frame.width - 20) / CGFloat(collumnsCount)
        
        var lastY: CGFloat = 0
        var lastX: CGFloat = 0
        
        for index in 0..<itemCount {
            let indexPath = IndexPath(item: index, section: 0)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = CGRect(x: lastX, y: lastY, width: cellSize, height: cellSize)
            
            let isLastColumn = index % self.collumnsCount - 1 == 0
            if isLastColumn {
                lastY += cellSize + 5
                lastX = 5
            } else {
                lastX += cellSize + 5
            }
            
            cacheAtrributes[indexPath] = attributes
            totalCellHeight = lastY
            
        }
        
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return cacheAtrributes.values.filter { (attr) -> Bool in
            return rect.intersects(attr.frame)
        }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cacheAtrributes[indexPath]
    }
    
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: self.collectionView?.frame.width ?? 0, height: self.totalCellHeight)
    }
        
        }
    
   




