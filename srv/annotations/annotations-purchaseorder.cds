using {PurchaseOrderService as pos} from '../service';

using from './annotations-purchaseorderitems.cds';

annotate pos.PurchaseOrderHeader with @odata.draft.enabled;


annotate pos.PurchaseOrderHeader with {
    PurchaseOrder          @title: 'Purchase Order';
    PurchaseOrderType      @title: 'Purchase Order Type';
    PurchasingOrganization @title: 'Organization';
    CompanyCode            @title: 'Company Code';
    Supplier               @title: 'Supplier';
    Language               @title: 'Language';
    OrderDate              @title: 'Order Date';
    DocumentCurrency       @title: 'Currency';
    OverallStatus          @title: 'Overral Status';
};

annotate pos.PurchaseOrderHeader with @(
    UI.HeaderInfo     : {
        $Type: 'UI.HeaderInfoType',
        TypeName : 'Purchase Order',
        TypeNamePlural : 'Purchase Orders',

        Title      : {
            $Type: 'UI.DataField',
            Value: PurchaseOrder
        },
        Description: {
            $Type: 'UI.DataField',            
            Value:  PurchaseOrderType.Description
        },
    },

    UI.FieldGroup #OrganizationalData: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: CompanyCode
            },
            {
                $Type: 'UI.DataField',
                Value: PurchasingOrganization
            }
        ],
    },

    UI.FieldGroup #BasicData: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: Supplier
            },
            {
                $Type: 'UI.DataField',
                Value: OrderDate
            }
        ],
    },

    UI.FieldGroup #ValueData: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: DocumentCurrency_code
            },
            {
                $Type: 'UI.DataField',
                Value: OrderDate
            }
        ],
    },

    UI.Facets:[
        {
            $Type : 'UI.ReferenceFacet',
            Target: @UI.FieldGroup#OrganizationalData,
            Label: 'Organization Data',
            ID: 'OrganizationalData'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target: @UI.FieldGroup#BasicData,
            Label: 'Basic Data',
            ID: 'BasicData'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target: @UI.FieldGroup#ValueData,
            Label: 'Value Data',
            ID: 'ValueData'
        },
        {
            $Type: 'UI.ReferenceFacet',
            Target: 'to_PurchaseOrderItem/@UI.LineItem',
            Label: 'Item',
            ID: 'Item'
        }
    ],

    UI.SelectionFields: [
        PurchaseOrder,
        PurchaseOrderType,
        CompanyCode,
        Supplier,
        Language_code,
        DocumentCurrency_code
    ],
    UI.LineItem       : [
        {
            $Type: 'UI.DataField',
            Value: PurchaseOrder,
            Label: 'Purchase Order',
        },
        {
            $Type: 'UI.DataField',
            Value: CompanyCode,
            Label: 'Company Code',
        },
        {
            $Type: 'UI.DataField',
            Value: OverallStatus.code,
            Label: 'Status',
        },
        {
            $Type: 'UI.DataField',
            Value: PurchaseOrderType_OrderType,
            Label: 'Order Type',
        },
        {
            $Type: 'UI.DataField',
            Value: OrderDate,
            Label: 'Order Date',
        },
        {
            $Type: 'UI.DataField',
            Value: Supplier_ID,
            Label: 'Supplier',
        },
        {
            $Type: 'UI.DataField',
            Value: DocumentCurrency_code,
            Label: 'Currency',
        },
    ]
);


