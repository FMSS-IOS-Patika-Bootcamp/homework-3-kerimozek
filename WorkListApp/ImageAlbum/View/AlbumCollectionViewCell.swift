//
//  AlbumCollectionViewCell.swift
//  WorkListApp
//
//  Created by Mehmet Kerim ÖZEK on 19.09.2022.
//

import UIKit


class AlbumCollectionViewCell: UICollectionViewCell {

    // Defining Constants and Variables
    @IBOutlet private(set) weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
     
        imageView.layer.cornerRadius = imageView.frame.width / 15
      
    }
        
}
