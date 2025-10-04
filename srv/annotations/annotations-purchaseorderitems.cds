using {PurchaseOrderService as pos} from '../service';

annotate pos.PurchaseOrderItem with {
    PurchaseOrderItem @title: 'Item';
    Material          @title: 'Material';
    Plant             @title: 'Plant';
    StorageLocation   @title: 'Storage';
};

annotate pos.PurchaseOrderItem with @(

    UI.SelectionFields: [Material],

    UI.LineItem       : [{
        $Type: 'UI.DataField',
        Value: Material,
        Label: 'Material'
    }, ]

);
