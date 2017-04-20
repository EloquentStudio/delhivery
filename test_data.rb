require 'date'
Delhivery.configure(api_key: '--api-key-here--', production: false)
dsh = {
"dispatch_date": DateTime.now,
"dispatch_id": 'CDId#146',
"pickup_location":{
  "add": "113 Barthal, Dundahera",
  "city": "New Delhi",
  "country": "India",
  "name": "FCDEL1",
  "phone": "xxxxxxxxxx",
  "pin": "110074"
  },
"shipments": [
  {
    "waybill": "",
    "client": "XYZ Online",
    "name": "John Kapoor",
    "order": "3002199824",
    "products_desc": "Sony PS3 Super Slim(Black)",
    "order_date": DateTime.now.iso8601,
    "payment_mode": "Pre­paid",
    "total_amount": 21841.0,
    "cod_amount": 0.0,
    "add": "M25, Nelson Marg, GBP City Phase 1",
    "city": "Gurgaon",
    "state": "Haryana",
    "country": "India",
    "phone": "xxxxxxxxxx",
    "pin": "122002",
    "return_add": "",
    "return_city": "",
    "return_country": "",
    "return_name": "",
    "return_phone": "",
    "return_pin": "",
    "return_state": "",
    "supplier": "Kangaroo (India) Pvt Ltd",
    "extra_parameters": "",
    "shipment_width": "",
    "shipment_height": "",
    "weight": "650.0 gm",
    "quantity": 1,
    "seller_inv": "invoice number",
    "seller_inv_date": DateTime.now.iso8601,
    "seller_name": "seller name",
    "seller_add": "seller add",
    "seller_cst": "seller cst",
    "seller_tin": "seller tin",
    "consignee_tin": "consignee tin",
    "commodity_value": "commodity value",
    "tax_value": "tax value",
    "sales_tax_form_ack_no":"",
    "category_of_goods":""
    }
  ]
}