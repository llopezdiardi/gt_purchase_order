const cds = require('@sap/cds');
const { query } = require('@sap/cds/lib/env/defaults');
const moment = require('moment');


module.exports = class PurchaseOrderHeader extends cds.ApplicationService {
    async init() {


        const { PurchaseOrderHeader, VHE_Companies } = this.entities;

        const api_company = await cds.connect.to("API_COMPANYCODE_SRV");


        this.on('READ', VHE_Companies, async (req) => {
            return await api_company.tx(req).send({
                query: req.query,
                headers: {
                    apikey: "dVAYARtWRgNBkTqa9cgSdDKLgZBgacfe"
                }
            }
            )
        });
        //dVAYARtWRgNBkTqa9cgSdDKLgZBgacfe
        //before
        //on
        //after

        //CREATE para persitencia -> NEW para draft, 
        // //READ, UPDATE, DELETE

        this.before('NEW', PurchaseOrderHeader.drafts, async (req) => {
            //req.data.PurchaseOrder = '0000000001';

            const dbp = await SELECT.one.from(PurchaseOrderHeader).columns('max(PurchaseOrder)');
            const dbd = await SELECT.one.from(PurchaseOrderHeader.drafts).columns('max(PurchaseOrder)');

            let idbp = parseInt(dbp.max);
            let idbd = parseInt(dbd.max);

            let iNewPurchaseOrder = 0;

            if (isNaN(idbd)) {
                iNewPurchaseOrder = idbp + 1;
            } else if (idbd > idbp) {
                iNewPurchaseOrder = idbd + 1;
            } else {
                iNewPurchaseOrder = idbp + 1;
            };

            //req.data.PurchaseOrder = String(iNewPurchaseOrder);
            req.data.PurchaseOrder = '0000000001';

            req.data.OrderDate = moment().format("YYYY-MM-DD");

            req.data.OverallStatus_Code = 'P'.
                console.log("Datos");
            console.log(req.data.OrderDate);




        });

        return super.init();
    };
};