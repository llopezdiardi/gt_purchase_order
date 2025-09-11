//Purchase Order
namespace com.globaltalent.purchaseorder;

entity PurchaseOrderHeader {
    key ID                     : UUID;
    key PurchaseOrder          : String(10);
        CompanyCode            : String(4);
        PurchaseOrderType      : Association to OrderTypes; //OrderTypes_ID & OrderTypes_OrderType
        PurchasingOrganization : String(4);
        PurchaseGroup          : String(3);
        Supplier               : String(10);
        Language               : String(2);
        OrderDate              : Date;
        DocumentCurrency       : String(3);
        to_PurchaseOrderItem   : Composition of many PurchaseOrderItem
                                     on to_PurchaseOrderItem.PurchaseOrder = $self;
}

entity PurchaseOrderItem {
    key ID                : UUID;
    key PurchaseOrderItem : String(5);
        PurchaseOrder     : Association to PurchaseOrderHeader; //PurchaseOrderHeader_ID & PurchaseOrderHeader_PurchaseOrder

}

entity OrderTypes {
    key ID : UUID;
    key OrderType : String(4);
        Description : String(40);
}

entity Suppliers {
    key ID : UUID;
    key Supplier : String(10);
        Description : String(40);
}