//
//  UserImageRow.swift
//  Doctor4All
//
//  Created by Kyle Gorter on 3/9/17.
//  Copyright © 2017 NextAcademy. All rights reserved.
//

import UIKit
import Eureka
import ImageRow


final class DoctorInfoCell: PushSelectorCell<UIImage> {
    
    @IBOutlet weak var selectedDisplayImage: UIImageView!
    
    override func setup() {
        super.setup()
        selectionStyle = .none
        selectedDisplayImage.contentMode = .scaleAspectFill
        selectedDisplayImage.layer.cornerRadius = selectedDisplayImage.frame.size.width / 2
        selectedDisplayImage.clipsToBounds = true
        height = {return 118}
        backgroundColor = UIColor(displayP3Red: 0.984, green: 0.988, blue: 0.976, alpha: 1.00)
    }
    
    override func update() {
        super.update()
        if let imageValue = row.value {
            selectedDisplayImage.image = imageValue
        } else {
            selectedDisplayImage.image = UIImage(named: "")
        }
    }
    
}

final class DoctorImageRow : _ImageRow<DoctorInfoCell>, RowType {
    
    public required init(tag: String?) {
        super.init(tag: tag)
        cellProvider = CellProvider<DoctorInfoCell>(nibName: "RegisterDoctorCell")
    }
    
    override func customUpdateCell() {
        super.customUpdateCell()
        cell.accessoryView = nil
        cell.accessoryType = .none
        
        //
        if let image = self.value {
            cell.selectedDisplayImage.image = image
        } else{
            cell.selectedDisplayImage.image = UIImage(named: "")
        }
    }
}

final class DoctorInfoRow: Row<DoctorInfoCell>, RowType {
    
    required init(tag: String?) {
        super.init(tag: tag)
        cellProvider = CellProvider<DoctorInfoCell>(nibName: "RegisterDoctorCell")
    }
    
    
}


