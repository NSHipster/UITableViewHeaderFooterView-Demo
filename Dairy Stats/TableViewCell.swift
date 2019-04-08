import UIKit

private let formatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.minimumSignificantDigits = 3
    
    return formatter
}()

final class TableViewCell: UITableViewCell {
    var year: Int? {
        didSet {
            if let year = year {
                textLabel?.text = "\(year)"
            }
        }
    }
    
    var amount: Decimal? {
        didSet {
            if let amount = amount {
                detailTextLabel?.text = formatter.string(for: amount)
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let bodyFontDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .body)
        
        let textLabelFontDescriptor = bodyFontDescriptor.addingAttributes([
            .traits : [
                UIFontDescriptor.TraitKey.weight : UIFont.Weight.semibold
            ]
            ])
        
        textLabel?.font = UIFont(descriptor: textLabelFontDescriptor, size: textLabel?.font.pointSize ?? 17.0)
        
        let detailTextLabelFontDescriptor = bodyFontDescriptor.addingAttributes([
            .featureSettings: [
                UIFontDescriptor.FeatureKey.featureIdentifier: kNumberSpacingType,
                UIFontDescriptor.FeatureKey.typeIdentifier: kMonospacedNumbersSelector
            ]
            ])
        detailTextLabel?.font = UIFont(descriptor: detailTextLabelFontDescriptor, size: detailTextLabel?.font.pointSize ?? 17.0)
        
    }
}
