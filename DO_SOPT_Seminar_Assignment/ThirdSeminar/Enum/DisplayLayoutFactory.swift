//
//  DisplayLayoutFactory.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/11/04.
//

import UIKit

enum DisplayLayoutFactory {
    
    //MARK: - 섹션별로 다른 SectionLayout 생성
    static func create() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, _) -> NSCollectionLayoutSection? in
            let section: NSCollectionLayoutSection
            
            switch sectionNumber {
            case 0:
                section = createScrollSection()
            case 1:
                section = createGridSection()
            default:
                section = createScrollSection()
            }
            return section
        }
    }
    
    static func createScrollSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(44.adjusted), heightDimension: .absolute(146.adjusted)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 22.adjusted
        section.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 2)
        return section
    }


    
    static func createGridSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/3),
            heightDimension: .fractionalWidth(1/2)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(
            top: 3,
            leading: 3,
            bottom: 3,
            trailing: 3
        )
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(1/2)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let containerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1))
        
        let containerGroup = NSCollectionLayoutGroup.vertical(layoutSize: containerGroupSize, subitems: [group, group])
        
        let section = NSCollectionLayoutSection(group: containerGroup)
        
        return section
    }
}
