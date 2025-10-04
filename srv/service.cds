using {com.globaltalent.purchaseorder as entities } from '../db/schema';
using {API_COMPANYCODE_SRV} from './external/API_COMPANYCODE_SRV';

service PurchaseOrderService {

    entity PurchaseOrderHeader as projection on entities.PurchaseOrderHeader;

    entity PurchaseOrderItem as projection on entities.PurchaseOrderItem;

    entity OrderTypes as projection on entities.OrderTypes;

    @readonly
    entity Supplier as projection on entities.Suppliers;
    
    
    // Persistency
    @cds.persistence.exists
    @cds.persistence.skip
    entity VHE_Companies as projection on API_COMPANYCODE_SRV.A_CompanyCode{
        key CompanyCode,
            CompanyCodeName,
            Country,
            CityName,
            Language
    };

};