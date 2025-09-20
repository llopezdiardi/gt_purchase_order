using {com.globaltalent.purchaseorder as entities } from '../db/schema';

service PurchaseOrderService {

    entity PurchaseOrderHeader as projection on entities.PurchaseOrderHeader;

    entity PurchaseOrderItem as projection on entities.PurchaseOrderItem;

    entity OrderTypes as projection on entities.OrderTypes;
};