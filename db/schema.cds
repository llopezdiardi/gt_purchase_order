//Purchase Order
namespace com.globaltalent.purchaseorder;

using {
    cuid,
    managed,
    sap.common.CodeList,
    sap.common.Languages,
    sap.common.Currencies,
} from '@sap/cds/common';

entity PurchaseOrderHeader : cuid, managed {    
    key PurchaseOrder          : String(10) @Core.Computed: true;
        CompanyCode            : String(4);
        PurchaseOrderType      : Association to OrderTypes; //OrderTypes_ID & OrderTypes_OrderType
        PurchasingOrganization : String(4);
        PurchaseGroup          : String(3);
        Supplier               : Association to Suppliers;
        Language               : Association to Languages default 'ES';
        OrderDate              : Date;
        DocumentCurrency       : Association to Currencies default 'COP'; //
        OverallStatus: Association to OverallStatus; //OverallStatus_Code
        to_PurchaseOrderItem   : Composition of many PurchaseOrderItem
                                     on to_PurchaseOrderItem.PurchaseOrder = $self;
}

entity PurchaseOrderItem : cuid, managed{    
    key PurchaseOrderItem : String(5);
        PurchaseOrderItemText: String(40);
        Plant : String(4);
        StorageLocation : String(4);
        Material : String(40);
        MaterialGroup: String(9);
        ProductType : String(2);
        NetPriceQuantity : Decimal(5);
        NetPriceAmount: Decimal(12,2);
        OrderQuantity: Decimal(5,2);
        OrderPriceUnit: String(3);
        DocumentCurrency: Association to Currencies;
        PurchaseOrder     : Association to PurchaseOrderHeader; //PurchaseOrderHeader_ID & PurchaseOrderHeader_PurchaseOrder
}

entity OrderTypes {    
    key OrderType : String(4);
        Description : String(40);
}

entity Suppliers : cuid{
    Supplier : String(10);
    SupplierName : String(80);
}

entity OverallStatus : CodeList {
    key code : String enum { 
        P = 'Pendiente';
        E = 'Enviado';
        R = 'Rechazado';
    };
    criticality: Integer; 

}


